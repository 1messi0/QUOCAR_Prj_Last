package com.quocar.reply.vo;

import java.util.Date;

public class ReplyVO {
	private Integer rno; 		// 댓글 번호
	private Integer bno; 		// 게시글 번호
	private String 	replytext;  // 댓글 내용
	private String 	replyer; 	// 댓글 작성자
	private String 	username; 	// 댓글 작성자의 이름(회원의 이름)
	private Date 	regdate; 	// 댓글 작성일자
	private Date 	updatedate; // 댓글 수정일자

	// Constructor
	public ReplyVO(Integer rno, Integer bno, String replytext, String replyer, String username, Date regdate,
			Date updatedate) {
		super();
		this.rno 		= rno;
		this.bno 		= bno;
		this.replytext 	= replytext;
		this.replyer 	= replyer;
		this.username 	= username;
		this.regdate 	= regdate;
		this.updatedate = updatedate;
	}
	// Getter/Setter
	public Integer getRno() {
		return rno;
	}

	public void setRno(Integer rno) {
		this.rno = rno;
	}

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getUsername() {
		return username;
	}

	public void setUserName(String username) {
		this.username = username;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", username=" + username + ", regdate=" + regdate + ", updatedate=" + updatedate 
				+ "]";
	}

}
