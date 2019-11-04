package com.mysiteforme.admin.service;

import com.mysiteforme.admin.entity.ErpUserResume;
import com.baomidou.mybatisplus.service.IService;
/**
 * <p>
 * 系统分配给用户的简历 服务类
 * </p>
 *
 * @author wangl
 * @since 2019-10-30
 */
public interface ErpUserResumeService extends IService<ErpUserResume> {

    /**
     * 设置之前的推荐为过期
     */
    public void overdue();

}
