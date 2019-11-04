package com.mysiteforme.admin.service.impl;

import com.mysiteforme.admin.entity.ErpProject;
import com.mysiteforme.admin.dao.ErpProjectDao;
import com.mysiteforme.admin.service.ErpProjectService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 项目表 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ErpProjectServiceImpl extends ServiceImpl<ErpProjectDao, ErpProject> implements ErpProjectService {

    /**
     * 保存
     * @param erpProject
     * @return
     */
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public ErpProject saveErpProject(ErpProject erpProject) {
        baseMapper.insert(erpProject);
        if(erpProject.getProjectUser()!=null && erpProject.getProjectUser().size()>0){
            //保存项目招聘专员
            baseMapper.saveProjectUser(erpProject.getId(), erpProject.getProjectUser());
        }
        if(erpProject.getProjectTag()!=null && erpProject.getProjectTag().size()>0){
            //保存项目标签
            baseMapper.saveProjectTag(erpProject.getId(), erpProject.getProjectTag());
        }
        return erpProject;
    }

    /**
     * 更新
     * @param erpProject
     * @return
     */
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public ErpProject updateErpProject(ErpProject erpProject) {
        baseMapper.updateById(erpProject);
        //更新项目招聘专员
        baseMapper.dropProjectUser(erpProject.getId());
        if(erpProject.getProjectUser()!=null && erpProject.getProjectUser().size()>0){
            baseMapper.saveProjectUser(erpProject.getId(), erpProject.getProjectUser());
        }

        //更新项目标签
        baseMapper.dropProjectTag(erpProject.getId());
        if( erpProject.getProjectTag()!=null && erpProject.getProjectTag().size()>0){
            baseMapper.saveProjectTag(erpProject.getId(), erpProject.getProjectTag());
        }

        return erpProject;
    }

    /**
     * 删除
     * @param erpProject
     * @return
     */
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void deleteErpProject(ErpProject erpProject){
        erpProject.setDelFlag(true);
        erpProject.updateById();
    }

    /**
     * 查询项目的招聘专员ID集合
     * @param projectId
     * @return
     */
    public List<Long> selectProjectUserIds(Long projectId){
        return baseMapper.selectProjectUserIds(projectId);
    }

    /**
     * 查询项目的标签ID集合
     * @param projectId
     * @return
     */
    public List<Long> selectProjectTagIds(Long projectId){
        return baseMapper.selectProjectTagIds(projectId);
    }

}
