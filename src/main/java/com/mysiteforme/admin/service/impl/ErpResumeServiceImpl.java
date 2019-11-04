package com.mysiteforme.admin.service.impl;

import com.mysiteforme.admin.entity.ErpProject;
import com.mysiteforme.admin.entity.ErpResume;
import com.mysiteforme.admin.dao.ErpResumeDao;
import com.mysiteforme.admin.service.ErpResumeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 简历表 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ErpResumeServiceImpl extends ServiceImpl<ErpResumeDao, ErpResume> implements ErpResumeService {

    /**
     * 保存
     * @return
     */
    public ErpResume saveErpResume(ErpResume erpResume) {
        baseMapper.insert(erpResume);
        //保存标签
        if(erpResume.getResumeTag()!=null && erpResume.getResumeTag().size()>0){
            baseMapper.saveResumeTag(erpResume.getId(), erpResume.getResumeTag());
        }
        // 保存项目
        if(erpResume.getResumeProject()!=null && erpResume.getResumeProject().size()>0){
            baseMapper.saveResumeProject(erpResume.getId(), erpResume.getResumeProject());
        }
        return erpResume;
    }

    /**
     * 更新
     * @return
     */
    public ErpResume updateErpResume(ErpResume erpResume) {
        baseMapper.updateById(erpResume);
        //更新项目标签
        baseMapper.dropResumeTag(erpResume.getId());
        if(erpResume.getResumeTag()!=null && erpResume.getResumeTag().size()>0){
            baseMapper.saveResumeTag(erpResume.getId(), erpResume.getResumeTag());
        }
        // 保存项目
        if(erpResume.getResumeProject()!=null && erpResume.getResumeProject().size()>0){
            baseMapper.saveResumeProject(erpResume.getId(), erpResume.getResumeProject());
        }
        return erpResume;
    }

    /**
     * 查询简历的标签ID集合
     * @param resumeId
     * @return
     */
    public List<Long> selectResumeTagIds(Long resumeId) {
        return baseMapper.selectResumeTagIds(resumeId);
    }

    /**
     * 保存简历的项目
     * @param resumeId
     * @param resumeProject
     */
    public void saveResumeProject(Long resumeId, Set<ErpProject> resumeProject) {
        if(resumeProject!=null && resumeProject.size()>0){
            baseMapper.saveResumeProject(resumeId, resumeProject);
        }
    }
}
