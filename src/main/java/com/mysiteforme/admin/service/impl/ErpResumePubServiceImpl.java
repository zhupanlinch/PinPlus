package com.mysiteforme.admin.service.impl;

import com.mysiteforme.admin.entity.ErpResumePub;
import com.mysiteforme.admin.dao.ErpResumePubDao;
import com.mysiteforme.admin.service.ErpResumePubService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 公示板 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ErpResumePubServiceImpl extends ServiceImpl<ErpResumePubDao, ErpResumePub> implements ErpResumePubService {

}
