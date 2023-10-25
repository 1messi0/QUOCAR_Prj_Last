package com.quocar.reply.vo;

import java.util.Date;

public class ReplyVO {
	private Integer rno;
	private Integer bno;
	private String  replytext;
	private String  replyer;
	private Date    regdate;
	private Date    updatedate;
	private String  username;
	
	// Constructor
	public ReplyVO() {}
	public ReplyVO(Integer rno, Integer bno, String replytext, String replyer, Date regdate, Date updatedate,
			String username) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.replytext = replytext;
		this.replyer = replyer;
		this.regdate = regdate;
		this.updatedate = updatedate;
		this.username = username;
	}
	// GetterSetter
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	// toString
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", username=" + username + "]";
	}
	
	
	
	
}
