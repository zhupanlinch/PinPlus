package com.mysiteforme.admin.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.mysiteforme.admin.base.DataEntity;

/**
 * <p>
 * 系统分配给用户的简历
 * </p>
 *
 * @author wangl
 * @since 2019-10-30
 */
@TableName("erp_user_resume")
public class ErpUserResume extends DataEntity<ErpUserResume> {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
	@TableField("user_id")
	private Long userId;
    /**
     * 简历ID
     */
	@TableField("resume_id")
	private Long resumeId;
    /**
     * 是否查看
     */
	@TableField("is_read")
	private Boolean isRead;

	/**
	 * 简历信息
	 */
	@TableField(exist=false)
	private ErpResume resume;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getResumeId() {
		return resumeId;
	}

	public void setResumeId(Long resumeId) {
		this.resumeId = resumeId;
	}
	public Boolean getRead() {
		return isRead;
	}

	public void setRead(Boolean isRead) {
		this.isRead = isRead;
	}

	public ErpResume getResume() {
		return resume;
	}

	public void setResume(ErpResume resume) {
		this.resume = resume;
	}

	@Override
	public String toString() {
		return "ErpUserResume{" +
			", userId=" + userId +
			", resumeId=" + resumeId +
			", isRead=" + isRead +
			", name=" + resume.getName() +
			"}";
	}
}
