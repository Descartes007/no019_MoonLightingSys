package com.work.pojo;

import java.util.Date;

public class SystemUpset {
	private Integer id;
	private User user;
	private String welcomText;
	private String companyAddres;
	private String company;
	private String qq;
	private String phone;
	private String companyLogo;
	private String weChat;
	private Date createTime;
	
	private Integer userId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getCompanyAddres() {
		return companyAddres;
	}
	public void setCompanyAddres(String companyAddres) {
		this.companyAddres = companyAddres;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getWelcomText() {
		return welcomText;
	}
	public void setWelcomText(String welcomText) {
		this.welcomText = welcomText;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCompanyLogo() {
		return companyLogo;
	}
	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}
	public String getWeChat() {
		return weChat;
	}
	public void setWeChat(String weChat) {
		this.weChat = weChat;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	
	
}
