package com.mysiteforme.admin.service;

import com.mysiteforme.admin.entity.ErpProject;
import com.mysiteforme.admin.entity.ErpResume;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 简历表 服务类
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
public interface ErpResumeService extends IService<ErpResume> {

    /**
     * 保存
     * @return
     */
    public ErpResume saveErpResume(ErpResume erpResume);

    /**
     * 更新
     * @return
     */
    public ErpResume updateErpResume(ErpResume erpResume);

    /**
     * 查询简历的标签ID集合
     * @param resumeId
     * @return
     */
    List<Long> selectResumeTagIds(Long resumeId);

    /**
     * 保存简历的项目
     * @param resumeId
     * @param resumeProject
     */
    public void saveResumeProject(Long resumeId, Set<ErpProject> resumeProject);

}
