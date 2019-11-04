package com.mysiteforme.admin.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.google.common.collect.Sets;
import com.mysiteforme.admin.base.DataEntity;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 项目表
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@TableName("erp_project")
public class ErpProject extends DataEntity<ErpProject> {

    private static final long serialVersionUID = 1L;

    /**
     * 名称
     */
	private String name;
    /**
     * 招聘简章
     */
	private String content;
    /**
     * 注意事项
     */
	private String careful;
    /**
     * 面试流程
     */
	private String review;
    /**
     * 组长ID
     */
	@TableField("leader_id")
	private Long leaderId;
    /**
     * 状态
     */
	private Integer status;

	/**
	 * 项目分配招聘专员
	 */
	@TableField(exist=false)
	private Set<User> projectUser = Sets.newHashSet();

	/**
	 * 项目标签
	 */
	@TableField(exist=false)
	private Set<ErpTag> projectTag = Sets.newHashSet();


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public String getCareful() {
		return careful;
	}

	public void setCareful(String careful) {
		this.careful = careful;
	}
	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}
	public Long getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(Long leaderId) {
		this.leaderId = leaderId;
	}
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set<User> getProjectUser() {
		return projectUser;
	}

	public void setProjectUser(Set<User> projectUser) {
		this.projectUser = projectUser;
	}

	public Set<ErpTag> getProjectTag() {
		return projectTag;
	}

	public void setProjectTag(Set<ErpTag> projectTag) {
		this.projectTag = projectTag;
	}

	@Override
	public String toString() {
		return "ErpProject{" +
			", name=" + name +
			", content=" + content +
			", careful=" + careful +
			", review=" + review +
			", leaderId=" + leaderId +
			", status=" + status +
			"}";
	}
}
