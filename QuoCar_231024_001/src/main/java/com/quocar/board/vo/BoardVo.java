package com.quocar.board.vo;

import java.util.Date;

public class BoardVo {
	private int 	bno;		// 게시글 번호
	private String 	title;		// 게시글 제목
	private String 	content;	// 게시글 내용
	private String 	writer;		// 게시글 작성자
	private Date 	regdate;	// 게시글 작성일자 util.Date
	private int 	viewcnt;	// 게시글 조회수
	private String 	username;	// 게시글 회원이름 = 게시글 작성자
	private int 	recnt;		// **게시글 댓글의 수 추가
	
	//Constructor
	public BoardVo() {}
	public BoardVo(int bno, String title, String content, String writer, Date regdate, int viewcnt, String username,
			int recnt) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.username = username;
		this.recnt = recnt;
	}
	// Getter/Setter
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	// toString
	@Override
	public String toString() {
		return "BoardVo [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + ", username=" + username + ", recnt=" + recnt + "]";
	}
	
	
	
}