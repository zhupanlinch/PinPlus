package com.mysiteforme.admin.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.mysiteforme.admin.base.DataEntity;

/**
 * <p>
 * 管理小组
 * </p>
 *
 * @author wangl
 * @since 2019-11-06
 */
@TableName("erp_team_member")
public class ErpTeamMember extends DataEntity<ErpTeamMember> {

    private static final long serialVersionUID = 1L;

    /**
     * 组员
     */
	@TableField("user_id")
	private Long userId;
    /**
     * 个人目标
     */
	private Integer target;

	@TableField(exist=false)
	private User teamMember;

	@TableField(exist=false)
	private int finish;

	@TableField(exist=false)
	private String progress;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Integer getTarget() {
		return target;
	}

	public void setTarget(Integer target) {
		this.target = target;
	}

	public User getTeamMember() {
		return teamMember;
	}

	public void setTeamMember(User teamMember) {
		this.teamMember = teamMember;
	}

	public int getFinish() {
		return finish;
	}

	public void setFinish(int finish) {
		this.finish = finish;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getUserName(){
		if(teamMember!=null) {
			return teamMember.getNickName();
		}
		return "";
	}

	@Override
	public String toString() {
		return "ErpTeamMember{" +
			", userId=" + userId +
			", target=" + target +
			", userName=" + teamMember.getNickName() +
			"}";
	}
}
