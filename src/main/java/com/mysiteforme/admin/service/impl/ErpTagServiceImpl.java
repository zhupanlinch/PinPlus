package com.mysiteforme.admin.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.ErpTag;
import com.mysiteforme.admin.dao.ErpTagDao;
import com.mysiteforme.admin.service.ErpTagService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 人力标签 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ErpTagServiceImpl extends ServiceImpl<ErpTagDao, ErpTag> implements ErpTagService {

    @Override
    public List<ErpTag> listAll() {
        EntityWrapper<ErpTag> wrapper = new EntityWrapper<ErpTag>();
        wrapper.eq("del_flag",false);
        wrapper.orderBy("sort",false);
        return selectList(wrapper);
    }
}
