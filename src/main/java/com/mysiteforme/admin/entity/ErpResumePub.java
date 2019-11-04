package com.mysiteforme.admin.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.mysiteforme.admin.base.DataEntity;

/**
 * <p>
 * 公示板
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@TableName("erp_resume_pub")
public class ErpResumePub extends DataEntity<ErpResumePub> {

    private static final long serialVersionUID = 1L;

    /**
     * 简历ID
     */
	@TableField("resume_id")
	private Long resumeId;

	public Long getResumeId() {
		return resumeId;
	}

	public void setResumeId(Long resumeId) {
		this.resumeId = resumeId;
	}


	@Override
	public String toString() {
		return "ErpResumePub{" +
			", resumeId=" + resumeId +
			"}";
	}
}
