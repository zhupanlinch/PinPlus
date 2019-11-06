package com.mysiteforme.admin.service.impl;

import com.mysiteforme.admin.entity.ErpTeamMember;
import com.mysiteforme.admin.dao.ErpTeamMemberDao;
import com.mysiteforme.admin.service.ErpTeamMemberService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 管理小组 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-11-06
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ErpTeamMemberServiceImpl extends ServiceImpl<ErpTeamMemberDao, ErpTeamMember> implements ErpTeamMemberService {

}
