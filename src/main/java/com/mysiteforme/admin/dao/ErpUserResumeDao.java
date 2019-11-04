package com.mysiteforme.admin.dao;

import com.mysiteforme.admin.entity.ErpUserResume;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 * 系统分配给用户的简历 Mapper 接口
 * </p>
 *
 * @author wangl
 * @since 2019-10-30
 */
public interface ErpUserResumeDao extends BaseMapper<ErpUserResume> {

    public void overdue();

}
