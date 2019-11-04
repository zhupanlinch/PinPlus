package com.mysiteforme.admin.service.impl;

import com.mysiteforme.admin.entity.ErpUserResume;
import com.mysiteforme.admin.dao.ErpUserResumeDao;
import com.mysiteforme.admin.service.ErpUserResumeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 系统分配给用户的简历 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-10-30
 */
@Service("erpUserResumeService")
@Transactional(rollbackFor = Exception.class)
public class ErpUserResumeServiceImpl extends ServiceImpl<ErpUserResumeDao, ErpUserResume> implements ErpUserResumeService {

    /**
     * 设置之前的推荐为过期
     */
    public void overdue(){
        baseMapper.overdue();
    }

}
