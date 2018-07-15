package egovframework.example.server.service;

public class ServerSideVO {
	private static final long serialVersionUID = 1L;
	
	private String uniqId;
	private String seq;
	private String mberId;
	
	private String mberNm;
	
	private String password;
	
	private String passwordCheck;
	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getUniqId() {
		return uniqId;
	}
	
	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}

	public String getMberId() {
		return mberId;
	}

	public void setMberId(String mberId) {
		this.mberId = mberId;
	}

	public String getMberNm() {
		return mberNm;
	}

	public void setMberNm(String mberNm) {
		this.mberNm = mberNm;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordCheck() {
		return passwordCheck;
	}

	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}
}




