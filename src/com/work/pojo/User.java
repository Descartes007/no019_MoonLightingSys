package com.work.pojo;

import java.util.Date;

public class User {
	private Integer userId;
	private String realName;
	private String nickName;
	private Integer sex;
	private String phone;
	private Date pirthday;
	private String email;
	private String headerImage;
	private String question;
	private String answer;
	private String userCategory;
	private Integer userLeven;
	private String password;
	private Integer isEffect;
	private Integer isWork;
	private String remark;
	private Date createTime;
	
	public Integer getIsWork() {
		return isWork;
	}
	public void setIsWork(Integer isWork) {
		this.isWork = isWork;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getPirthday() {
		return pirthday;
	}
	public void setPirthday(Date pirthday) {
		this.pirthday = pirthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHeaderImage() {
		return headerImage;
	}
	public void setHeaderImage(String headerImage) {
		this.headerImage = headerImage;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public String getUserCategory() {
		return userCategory;
	}
	public void setUserCategory(String userCategory) {
		this.userCategory = userCategory;
	}
	public Integer getUserLeven() {
		return userLeven;
	}
	public void setUserLeven(Integer userLeven) {
		this.userLeven = userLeven;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getIsEffect() {
		return isEffect;
	}
	public void setIsEffect(Integer isEffect) {
		this.isEffect = isEffect;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	
}
