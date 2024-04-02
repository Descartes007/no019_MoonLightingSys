package com.work.pojo;

import java.util.Date;


public class Chat{
	private Integer id;
	private User userFa;
	private User userJie;
	private String content;
	private String image;
	private Date createTime;
	private Integer isRemoveFa;
	private Integer isRemoveJie;
	private String chatSignal;
	private Integer isLook;
	
	private Integer userIdFa;
	private String nickNameFa;
	private String headerImageFa;
	private Integer userIdJie;
	private String nickNameJie;
	private String headerImageJie;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public User getUserFa() {
		return userFa;
	}
	public void setUserFa(User userFa) {
		this.userFa = userFa;
	}
	public User getUserJie() {
		return userJie;
	}
	public void setUserJie(User userJie) {
		this.userJie = userJie;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getIsRemoveFa() {
		return isRemoveFa;
	}
	public void setIsRemoveFa(Integer isRemoveFa) {
		this.isRemoveFa = isRemoveFa;
	}
	public Integer getIsRemoveJie() {
		return isRemoveJie;
	}
	public void setIsRemoveJie(Integer isRemoveJie) {
		this.isRemoveJie = isRemoveJie;
	}
	public String getChatSignal() {
		return chatSignal;
	}
	public void setChatSignal(String chatSignal) {
		this.chatSignal = chatSignal;
	}
	public Integer getIsLook() {
		return isLook;
	}
	public void setIsLook(Integer isLook) {
		this.isLook = isLook;
	}
	
	public Integer getUserIdFa() {
		return userIdFa;
	}
	public void setUserIdFa(Integer userIdFa) {
		this.userIdFa = userIdFa;
	}
	public String getNickNameFa() {
		return nickNameFa;
	}
	public void setNickNameFa(String nickNameFa) {
		this.nickNameFa = nickNameFa;
	}
	public String getHeaderImageFa() {
		return headerImageFa;
	}
	public void setHeaderImageFa(String headerImageFa) {
		this.headerImageFa = headerImageFa;
	}
	public Integer getUserIdJie() {
		return userIdJie;
	}
	public void setUserIdJie(Integer userIdJie) {
		this.userIdJie = userIdJie;
	}
	public String getNickNameJie() {
		return nickNameJie;
	}
	public void setNickNameJie(String nickNameJie) {
		this.nickNameJie = nickNameJie;
	}
	public String getHeaderImageJie() {
		return headerImageJie;
	}
	public void setHeaderImageJie(String headerImageJie) {
		this.headerImageJie = headerImageJie;
	}
	
}
