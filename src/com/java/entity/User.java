package com.java.entity;

public class User {
	private String userId;
	private String userName;
	private String passWord;
	private String realName;
	private String userIphone;
	private String belongAsso;
	private String major;
	private String loginImage;
	private String gradesAndClass;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getUserIphone() {
		return userIphone;
	}
	public void setUserIphone(String userIphone) {
		this.userIphone = userIphone;
	}
	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getGradesAndClass() {
		return gradesAndClass;
	}

	public void setGradesAndClass(String gradesAndClass) {
		this.gradesAndClass = gradesAndClass;
	}
	public String getLoginImage() {
		return loginImage;
	}

	public void setLoginImage(String loginImage) {
		this.loginImage = loginImage;
	}
	public String getBelongAsso() {
		return belongAsso;
	}
	public void setBelongAsso(String belongAsso) {
		this.belongAsso = belongAsso;
	}
	public User(String userId,String userName, String passWord,String realName,String userIphone,String major,String gradesAndClass,String loginImage,String belongAsso) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.passWord = passWord;
		this.realName = realName;
		this.userIphone = userIphone;
		this.belongAsso = belongAsso;
		this.major = major;
		this.gradesAndClass = gradesAndClass;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", passWord=" + passWord + ",realName=" + realName + ",userIphone=" + userIphone  + "]";
	}
	
	
}
