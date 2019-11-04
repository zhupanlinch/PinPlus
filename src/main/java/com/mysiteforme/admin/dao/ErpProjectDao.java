package com.mysiteforme.admin.dao;

import com.mysiteforme.admin.entity.ErpProject;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.mysiteforme.admin.entity.ErpTag;
import com.mysiteforme.admin.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 项目表 Mapper 接口
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
public interface ErpProjectDao extends BaseMapper<ErpProject> {

    /**
     * 查询项目的招聘专员ID集合
     * @param projectId
     * @return
     */
    List<Long> selectProjectUserIds(@Param("projectId")Long projectId);

    /**
     * 查询项目的标签ID集合
     * @param projectId
     * @return
     */
    List<Long> selectProjectTagIds(@Param("projectId")Long projectId);

    /**
     * 保存项目的招聘专员
     * @param projectId
     * @param projectUser
     */
    void saveProjectUser(@Param("projectId")Long projectId, @Param("projectUser") Set<User> projectUser);

    /**
     * 保存项目的标签
     * @param projectId
     * @param projectTag
     */
    void saveProjectTag(@Param("projectId")Long projectId, @Param("projectTag") Set<ErpTag> projectTag);

    /**
     * 删除项目的招聘专员
     * @param projectId
     */
    void dropProjectUser(@Param("projectId")Long projectId);

    /**
     * 删除项目的标签
     * @param projectId
     */
    void dropProjectTag(@Param("projectId")Long projectId);

}
