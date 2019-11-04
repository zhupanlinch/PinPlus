package com.mysiteforme.admin.util.quartz.task;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.collect.Sets;
import com.mysiteforme.admin.entity.*;
import com.mysiteforme.admin.service.*;
import com.mysiteforme.admin.util.SpringContextHolder;
import com.xiaoleilu.hutool.log.Log;
import com.xiaoleilu.hutool.log.LogFactory;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.util.ThreadContext;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;
import org.apache.shiro.mgt.SecurityManager;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wangl on 2018/1/26.
 * todo: 系统定时任务
 */
@Component("systemTask")
public class SystemTask {
    private static Log log = LogFactory.get();

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Autowired
    private BlogArticleService blogArticleService;

    @Autowired
    private ErpResumeService erpResumeService;

    @Autowired
    private ErpTagService erpTagService;

    @Autowired
    private ErpUserResumeService erpUserResumeService;

    @Autowired
    protected UserService userService;

    @Value("#{${weight}}")
    private int weightPerPerson;

    /**
     * 同步文章点击量
     * @param params
     */
    public void  synchronizationArticleView(String params){
        ValueOperations<String, Object> operations=redisTemplate.opsForValue();
        EntityWrapper<BlogArticle> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        List<BlogArticle> list = blogArticleService.selectList(wrapper);
        for (BlogArticle article : list){
            String key = "article_click_id_"+article.getId();
            if(redisTemplate.hasKey(key)){
                Integer count = (Integer)operations.get(key);
                if(count > 0){
                    article.setClick(blogArticleService.getArticleClick(article.getId()));
                    if(StringUtils.isNotBlank(params)){
                        article.setUpdateId(Long.valueOf(params));
                    }
                    blogArticleService.updateById(article);
                }
            }
        }
    }

    /**
     * 生成文章搜索索引
     */
    public void createArticleIndex(String params) {
        blogArticleService.createArticlIndex();
    }

    /**
     * 系统自动分配简历到所有招聘专员
     * 数据：每人应分量 weightPerPerson
     *       招聘专员数量 userCount
     *       每次分析简历量 userCount * weightPerPerson
     * 集合：未入职简历 R ∈ {R1, R2, R3, ……} 分页获取 R
     *       招聘专员 U
     *       项目 P
     * 条件：
     *       简历符合招聘专员所招聘的项目 C1
     *       简历属于招聘专员创建 C2
     *       简历已分配过该项目 C3 todo
     *       简历和项目标签不匹配 C4 todo 简历标签是项目标签的子集则为匹配
     * 算法：
     *       for(u : U){
     *           n = 0;  // n 为已分配给u的简历数量
     *           for(r : R) {
     *               if(n > weightPerPerson) {
     *                   break; // goto loop U
     *               }
     *               if(C2 || C3 || C4){
     *                   continue; // goto loop R
     *               }
     *               if(C1){
     *                   r -> u; // 将简历r分配给u
     *                   n ++ ;
     *               }
     *           }
     *       }
     */
    public void distributionOfResume(String params) {
        try {
            ThreadContext.bind(securityManager);
            SecurityUtils.getSubject();
            // 所有账号可用的招聘专员
            EntityWrapper<User> userEntityWrapper = new EntityWrapper<>();
            userEntityWrapper.eq("del_flag", 0);
            userEntityWrapper.eq("locked", 0);
            List<User> U = userService.selectUserByRoleId(4L); // 招聘专员roleId = 4

            // 查询出一次需要分析的简历数量
            EntityWrapper<ErpResume> resumeWrapper = new EntityWrapper<>();
            resumeWrapper.eq("del_flag",false);
            resumeWrapper.lt("job_status", 2);  // 状态为未成交的
            resumeWrapper.notExists(" select 1 from erp_user_resume ur where erp_resume.id = ur.resume_id and is_read = 0 ");  // 排除已分配给用户并且用户未读
            Page<ErpResume> resumePage = erpResumeService.selectPage(new Page<>(1,weightPerPerson*U.size()),resumeWrapper);
            List<ErpResume> R = resumePage.getRecords();

            String alreadyDone = "已分配";
            int devide = R.size() / U.size();
            int weight = devide < weightPerPerson? devide: weightPerPerson;
            weight = (weight == 0? 1: weight);

            for(User u : U) {
                int n = 0;
                EntityWrapper<ErpProject> uProjectWrapper = new EntityWrapper<ErpProject>();
                uProjectWrapper.eq("del_flag",false);
                uProjectWrapper.eq("status",1);
                uProjectWrapper.exists("select 1 from erp_project_user where project_id = erp_project.id and user_id= "+u.getId()+" ");  //我的项目
                List<ErpProject> uProjecctList = erpProjectService.selectList(uProjectWrapper); //用户的项目

                if(uProjecctList.size()==0){
                    continue;
                }

                String [] uProjecctIds = new String[uProjecctList.size()];
                int i = 0;
                for(ErpProject uProject: uProjecctList) {
                    uProjecctIds[i++] = uProject.getId().toString();
                }

                String uProjecctIdsStr = StringUtils.join(uProjecctIds, ",");

                for(ErpResume r : R) {
                    if(alreadyDone.equals(r.getRemarks())){
                        continue;
                    }
                    if(n == weight) {
                        break;
                    }
                    if(u.getId().equals(r.getCreateId())){
                        continue;
                    }

                    // 简历被招过的所有项目
                    EntityWrapper<ErpProject> rProjectWrapper = new EntityWrapper<ErpProject>();
                    rProjectWrapper.eq("del_flag",false);
                    rProjectWrapper.eq("status",1);
                    rProjectWrapper.exists("select 1 from erp_resume_project erp where erp.resume_id = "+r.getId()+" and erp_project.id = erp.project_id ");  //项目已经招聘过该简历
                    List<ErpProject> rProjecctList = erpProjectService.selectList(rProjectWrapper);

                    Set<Long> rProjectIds = Sets.newHashSet();
                    for(ErpProject rProject: rProjecctList){
                        rProjectIds.add(rProject.getId());
                    }
                    // 改简历招过的项目已经包含了该用户的所有项目
                    if(rProjectIds.containsAll(Sets.newHashSet(uProjecctIds))){
                        continue;
                    }

                    boolean tagEqs = false;  // 标签是否匹配某一个项目
                    List<Long> rTagIds = erpResumeService.selectResumeTagIds(r.getId()); // 简历标签IDs
                    if(rTagIds.size()==0){
                        tagEqs = true; //简历未打标签直接分配
                    } else {
                        for(ErpProject uProject: uProjecctList) {
                            List<Long> uProjectTagIds = erpProjectService.selectProjectTagIds(uProject.getId()); // 项目标签IDs
                            Set<Long> uProjectTagIdsSet = new HashSet<>(uProjectTagIds);
                            // 简历标签有一个符合项目标签，则tagEqs=true
                            for(Long rTag: rTagIds){
                                if(uProjectTagIdsSet.contains(rTag)){
                                    tagEqs = true;
                                    break;
                                }
                            }
                            if(tagEqs){
                                break;
                            }
                        }
                    }

                    if(tagEqs) {
                        ErpUserResume ur = new ErpUserResume();
                        ur.setUserId(u.getId());
                        ur.setResumeId(r.getId());
                        ur.setRead(false);
                        ur.setCreateDate(new Date());
                        erpUserResumeService.insert(ur);
                        n ++;
                        r.setRemarks(alreadyDone);
                    }

                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 将以前的推荐设置为过期
     * @param params
     */
    public void overdueOfResume(String params) {
        try {
            ThreadContext.bind(securityManager);
            SecurityUtils.getSubject();
            // 将以前的推荐设置为过期
            erpUserResumeService.overdue();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Resource
    org.apache.shiro.mgt.SecurityManager securityManager;

    @Autowired
    private ErpProjectService erpProjectService;


}
