package egovframework.example.login.service;

import java.io.Serializable;

public class LoginVO implements Serializable{

	private static final long serialVersionUID = -8274004534207618049L;

	private String id;
	private String name;
	private String password;
	private String uniqId;
	private String url;
	private String num;
	private String mberNm;
	
	public String getMberNm() {
		return mberNm;
	}

	public void setMberNm(String mberNm) {
		this.mberNm = mberNm;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUniqId() {
		return uniqId;
	}

	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}