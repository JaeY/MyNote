package egovframework.example.board.service;

public class BoardVO {

	@Override
	public String toString() {
		return "BoardVO [hno=" + hno + ", title=" + title + ", content="
				+ content + ", writer=" + writer + ", regdate=" + regDate
				+ ", viewcnt=" + viewCnt + ", favorcnt=" +
				 ", useyn=" + useYn + ", moddate=" + modDate + "]";
	}
	private int		hno;
	private String 	title;
	private String 	content;
	private String 	writer;
	private	String 	regDate;
	private int 	viewCnt;
	private String 	useYn;
	private String 	modDate;
	
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	
	


}
