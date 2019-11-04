package com.mysiteforme.admin.controller;

import com.mysiteforme.admin.base.BaseController;
import com.mysiteforme.admin.entity.ErpProject;
import com.mysiteforme.admin.entity.ErpResume;
import com.mysiteforme.admin.service.ErpProjectService;
import com.mysiteforme.admin.service.ErpResumeService;
import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.ErpUserResume;
import com.mysiteforme.admin.service.ErpUserResumeService;
import com.baomidou.mybatisplus.plugins.Page;
import com.mysiteforme.admin.util.LayerData;
import com.mysiteforme.admin.util.RestResponse;
import com.mysiteforme.admin.annotation.SysLog;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;

/**
 * <p>
 * 系统分配给用户的简历  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-10-30
 */
@Controller
@RequestMapping("/admin/erpUserResume")
public class ErpUserResumeController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ErpUserResumeController.class);

    @Autowired
    private ErpUserResumeService erpUserResumeService;

    @Autowired
    private ErpResumeService erpResumeService;

    @Autowired
    private ErpProjectService erpProjectService;

    @GetMapping("list")
    @SysLog("跳转系统分配给用户的简历列表")
    public String list(){
        return "/admin/erpUserResume/list";
    }

    @PostMapping("list")
    @ResponseBody
    @SysLog("请求系统分配给用户的简历列表数据")
    public LayerData<ErpResume> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                      ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<ErpResume> layerData = new LayerData<>();
        EntityWrapper<ErpUserResume> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        wrapper.eq("user_id", getCurrentUser().getId());
        wrapper.eq("is_read", 0);
        wrapper.notExists(" select 1 from erp_resume r where r.id = erp_user_resume.resume_id and r.job_status > 1 "); //未成交的简历
        if(!map.isEmpty()){
            String beginCreateTime = (String) map.get("beginCreateTime");
            String endCreateTime = (String) map.get("endCreateTime");
            if(StringUtils.isNotBlank(beginCreateTime)) {
                Date begin = DateUtil.parse(beginCreateTime);
                map.put("create_time",begin);
            }else{
                map.remove("beginCreateTime");
            }
            if(StringUtils.isNotBlank(endCreateTime)) {
                Date end = DateUtil.parse(endCreateTime);
                map.put("create_time",end);
            }else{
                map.remove("endCreateTime");
            }
        }
        Page<ErpUserResume> pageData = erpUserResumeService.selectPage(new Page<>(page,limit),wrapper);
        List<ErpResume> list = new ArrayList<>();
        for(ErpUserResume ur : pageData.getRecords()) {
            ErpResume resume = erpResumeService.selectById(ur.getResumeId());
            list.add(resume);
        }
        layerData.setData(list);
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增系统分配给用户的简历页面")
    public String add(){
        return "/admin/erpUserResume/add";
    }

    @PostMapping("add")
    @SysLog("保存新增系统分配给用户的简历数据")
    @ResponseBody
    public RestResponse add(ErpUserResume erpUserResume){
        erpUserResumeService.insert(erpUserResume);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑系统分配给用户的简历页面")
    public String edit(Long id,Model model){
        ErpUserResume erpUserResume = erpUserResumeService.selectById(id);
        model.addAttribute("erpUserResume",erpUserResume);
        return "/admin/erpUserResume/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑系统分配给用户的简历数据")
    public RestResponse edit(ErpUserResume erpUserResume){
        if(null == erpUserResume.getId() || 0 == erpUserResume.getId()){
            return RestResponse.failure("ID不能为空");
        }
        erpUserResumeService.updateById(erpUserResume);
        return RestResponse.success();
    }

    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除系统分配给用户的简历数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        ErpUserResume erpUserResume = erpUserResumeService.selectById(id);
        erpUserResume.setDelFlag(true);
        erpUserResumeService.updateById(erpUserResume);
        return RestResponse.success();
    }

    @PostMapping("overdue")
    @ResponseBody
    @SysLog("简历不合适")
    public RestResponse overdue(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        EntityWrapper<ErpUserResume> wrapper = new EntityWrapper<>();
        wrapper.eq("user_id", getCurrentUser().getId());
        wrapper.eq("resume_id", id);
        List<ErpUserResume> list = erpUserResumeService.selectList(wrapper);
        for(ErpUserResume ur: list){
            ur.setRead(true);
            erpUserResumeService.insertOrUpdate(ur);
            EntityWrapper<ErpProject> projectWrapper = new EntityWrapper<ErpProject>();
            projectWrapper.eq("del_flag",false);
            projectWrapper.exists("select 1 from erp_project_user where project_id = erp_project.id and user_id= "+getCurrentUser().getId()+" ");
            List<ErpProject> projects = erpProjectService.selectList(projectWrapper);
            // 设置不合适的项目
            erpResumeService.saveResumeProject(ur.getResumeId(), new HashSet<>(projects));
        }
        return RestResponse.success();
    }

}