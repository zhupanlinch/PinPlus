package com.mysiteforme.admin.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.mysiteforme.admin.base.DataEntity;

/**
 * <p>
 * 人力标签
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@TableName("erp_tag")
public class ErpTag extends DataEntity<ErpTag> {

    private static final long serialVersionUID = 1L;

    /**
     * 标签名称
     */
	private String name;
    /**
     * 排序
     */
	private Integer sort;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}


	@Override
	public String toString() {
		return "ErpTag{" +
			", name=" + name +
			", sort=" + sort +
			"}";
	}
}
