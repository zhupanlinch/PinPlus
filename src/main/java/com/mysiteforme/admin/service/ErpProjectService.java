package com.mysiteforme.admin.service;

import com.mysiteforme.admin.entity.ErpProject;
import com.baomidou.mybatisplus.service.IService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 项目表 服务类
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
public interface ErpProjectService extends IService<ErpProject> {

    /**
     * 保存
     * @param erpProject
     * @return
     */
    public ErpProject saveErpProject(ErpProject erpProject);

    /**
     * 更新
     * @param erpProject
     * @return
     */
    public ErpProject updateErpProject(ErpProject erpProject);

    /**
     * 删除
     * @param erpProject
     * @return
     */
    public void deleteErpProject(ErpProject erpProject);

    /**
     * 查询项目的招聘专员ID集合
     * @param projectId
     * @return
     */
    List<Long> selectProjectUserIds(Long projectId);

    /**
     * 查询项目的标签ID集合
     * @param projectId
     * @return
     */
    List<Long> selectProjectTagIds(Long projectId);
}
