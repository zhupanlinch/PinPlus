package com.mysiteforme.admin.dao;

import com.mysiteforme.admin.entity.ErpProject;
import com.mysiteforme.admin.entity.ErpResume;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.mysiteforme.admin.entity.ErpTag;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 简历表 Mapper 接口
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
public interface ErpResumeDao extends BaseMapper<ErpResume> {

    /**
     * 保存简历的标签
     * @param resumeId
     * @param resumeTag
     */
    void saveResumeTag(@Param("resumeId")Long resumeId, @Param("resumeTag") Set<ErpTag> resumeTag);

    /**
     * 删除简历的标签
     * @param resumeId
     */
    void dropResumeTag(@Param("resumeId")Long resumeId);

    /**
     * 查询简历的标签ID集合
     * @param resumeId
     * @return
     */
    public List<Long> selectResumeTagIds(Long resumeId);

    /**
     * 保存简历的项目
     * @param resumeId
     * @param resumeProject
     */
    void saveResumeProject(@Param("resumeId")Long resumeId, @Param("resumeProject") Set<ErpProject> resumeProject);

    /**
     * 删除简历的项目
     * @param resumeId
     */
    void dropResumeProject(@Param("resumeId")Long resumeId);

    /**
     * 查询简历的项目ID集合
     * @param resumeId
     * @return
     */
    public List<Long> selectResumeProjectIds(Long resumeId);
}
