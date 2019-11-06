package com.mysiteforme.admin.entity;

import java.util.Date;
import java.util.Set;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.google.common.collect.Sets;
import com.mysiteforme.admin.base.DataEntity;
import com.mysiteforme.admin.util.excel.annotation.ExcelField;

/**
 * <p>
 * 简历表
 * </p>
 *
 * @author wangl
 * @since 2019-10-27
 */
@TableName("erp_resume")
public class ErpResume extends DataEntity<ErpResume> {

    private static final long serialVersionUID = 1L;

    /**
     * 姓名
     */
	@ExcelField(title = "姓名", align = 2, sort = 10)
	private String name;
    /**
     * 性别
     */
	@ExcelField(title = "性别", align = 2, sort = 20, dictType = "erp_resume_sex")
	private Integer sex;
    /**
     * 年龄
     */
	@ExcelField(title = "年龄", align = 2, sort = 30)
	private Integer age;
    /**
     * 电话
     */
	@ExcelField(title = "手机", align = 2, sort = 90)
	private String phone;
    /**
     * 地址
     */
	@ExcelField(title = "现居住地", align = 2, sort = 110)
	private String address;
    /**
     * 学历
     */
	@ExcelField(title = "最高学历", align = 2, sort = 130, dictType = "erp_resume_education")
	private Integer education;
    /**
     * 工资
     */
	@ExcelField(title = "期望薪资", align = 2, sort = 60)
	private String salary;
    /**
     * 期望职位
     */
	@ExcelField(title = "应聘职位", align = 2, sort = 50)
	private String job;
    /**
     * 求职状态
     */
	// @ExcelField(title = "求职状态", align = 2, sort = 50, dictType = "erp_resume_status")
	private Integer status;
    /**
     * 期望地址
     */
	// @ExcelField(title = "期望地址", align = 2, sort = 50)
	private String addr;
    /**
     * 工作经验
     */
	@ExcelField(title = "工作经验", align = 2, sort = 80)
	private String year;
    /**
     * 人才状态
     */
	@TableField("job_status")
	//@ExcelField(title = "人才状态", align = 2, sort = 50, dictType = "erp_resume_job_status")
	private Integer jobStatus;
    /**
     * 类型
     */
	@ExcelField(title = "简历类型", align = 2, sort = 40, dictType = "erp_resume_type")
	private Integer type;
    /**
     * 现职位
     */
	@TableField("curr_job")
	@ExcelField(title = "现职位", align = 2, sort = 70)
	private String currJob;
    /**
     * 电子邮件
     */
	@ExcelField(title = "电子邮件", align = 2, sort = 100)
	private String mail;
    /**
     * 现单位
     */
	@ExcelField(title = "现工作单位", align = 2, sort = 120)
	private String unit;
    /**
     * 学校
     */
	@ExcelField(title = "学校名称", align = 2, sort = 140)
	private String school;
    /**
     * 专业
     */
	@ExcelField(title = "专业", align = 2, sort = 150)
	private String major;
    /**
     * 下载日期
     */
	@TableField("down_date")
	@ExcelField(title = "下载日期", align = 2, sort = 160)
	private Date downDate;

	/**
	 * 成交项目ID、
	 *
	 */
	@TableField("project_id")
	private Long projectId;

	/**
	 * 项目标签
	 */
	@TableField(exist=false)
	private Set<ErpTag> resumeTag = Sets.newHashSet();

	/**
	 * 简历被招聘的项目
	 */
	@TableField(exist=false)
	private Set<ErpProject> resumeProject = Sets.newHashSet();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getEducation() {
		return education;
	}

	public void setEducation(Integer education) {
		this.education = education;
	}
	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	public Integer getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(Integer jobStatus) {
		this.jobStatus = jobStatus;
	}
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	public String getCurrJob() {
		return currJob;
	}

	public void setCurrJob(String currJob) {
		this.currJob = currJob;
	}
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}
	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}
	public Date getDownDate() {
		return downDate;
	}

	public void setDownDate(Date downDate) {
		this.downDate = downDate;
	}

	public Set<ErpTag> getResumeTag() {
		return resumeTag;
	}

	public void setResumeTag(Set<ErpTag> resumeTag) {
		this.resumeTag = resumeTag;
	}

	public Set<ErpProject> getResumeProject() {
		return resumeProject;
	}

	public void setResumeProject(Set<ErpProject> resumeProject) {
		this.resumeProject = resumeProject;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	public String getUpdateUserNickName() {
		if(updateUser!=null){
			return updateUser.getNickName();
		}else{
			return null;
		}
	}

	@Override
	public String toString() {
		return "ErpResume{" +
			", name=" + name +
			", sex=" + sex +
			", age=" + age +
			", phone=" + phone +
			", address=" + address +
			", education=" + education +
			", salary=" + salary +
			", job=" + job +
			", status=" + status +
			", addr=" + addr +
			", year=" + year +
			", jobStatus=" + jobStatus +
			", type=" + type +
			", currJob=" + currJob +
			", mail=" + mail +
			", unit=" + unit +
			", school=" + school +
			", major=" + major +
			", downDate=" + downDate +
			", projectId=" + projectId +
			// ", updateUser=" + updateUser +
			", updateUserNickName=" + updateUser.getNickName() +
			", updateDate=" + updateDate +
			"}";
	}
}
