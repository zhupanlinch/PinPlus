package com.mysiteforme.admin.service;

import com.mysiteforme.admin.entity.ErpTag;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 * 人力标签 服务类
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
public interface ErpTagService extends IService<ErpTag> {

    /**
     * 获取所有标签
     * @return
     */
    List<ErpTag> listAll();

}
