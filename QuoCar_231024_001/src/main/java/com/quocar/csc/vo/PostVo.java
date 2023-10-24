package com.quocar.csc.vo;

public class PostVo {
	// Fields
	private int    csc_idx;
	private String csc_id;
	private String csc_title;
	private String csc_cont;
	private String csc_writer;
	private String csc_regdate;
	private int    csc_bnum;
	private int    csc_lvl;
	private int    csc_step;
	private int    csc_nref;
	
	//constructor
	public PostVo() {}
	public PostVo(int csc_idx, String csc_id, String csc_title, String csc_cont, String csc_writer, String csc_regdate,
			int csc_bnum, int csc_lvl, int csc_step, int csc_nref) {
		super();
		this.csc_idx = csc_idx;
		this.csc_id = csc_id;
		this.csc_title = csc_title;
		this.csc_cont = csc_cont;
		this.csc_writer = csc_writer;
		this.csc_regdate = csc_regdate;
		this.csc_bnum = csc_bnum;
		this.csc_lvl = csc_lvl;
		this.csc_step = csc_step;
		this.csc_nref = csc_nref;
	}
	
	//Getter/Setter
	public int getCsc_idx() {
		return csc_idx;
	}
	public void setCsc_idx(int csc_idx) {
		this.csc_idx = csc_idx;
	}
	public String getCsc_id() {
		return csc_id;
	}
	public void setCsc_id(String csc_id) {
		this.csc_id = csc_id;
	}
	public String getCsc_title() {
		return csc_title;
	}
	public void setCsc_title(String csc_title) {
		this.csc_title = csc_title;
	}
	public String getCsc_cont() {
		return csc_cont;
	}
	public void setCsc_cont(String csc_cont) {
		this.csc_cont = csc_cont;
	}
	public String getCsc_writer() {
		return csc_writer;
	}
	public void setCsc_writer(String csc_writer) {
		this.csc_writer = csc_writer;
	}
	public String getCsc_regdate() {
		return csc_regdate;
	}
	public void setCsc_regdate(String csc_regdate) {
		this.csc_regdate = csc_regdate;
	}
	public int getCsc_bnum() {
		return csc_bnum;
	}
	public void setCsc_bnum(int csc_bnum) {
		this.csc_bnum = csc_bnum;
	}
	public int getCsc_lvl() {
		return csc_lvl;
	}
	public void setCsc_lvl(int csc_lvl) {
		this.csc_lvl = csc_lvl;
	}
	public int getCsc_step() {
		return csc_step;
	}
	public void setCsc_step(int csc_step) {
		this.csc_step = csc_step;
	}
	public int getCsc_nref() {
		return csc_nref;
	}
	public void setCsc_nref(int csc_nref) {
		this.csc_nref = csc_nref;
	}
	
	//toString
	@Override
	public String toString() {
		return "PostVo [csc_idx=" + csc_idx + ", csc_id=" + csc_id + ", csc_title=" + csc_title + ", csc_cont="
				+ csc_cont + ", csc_writer=" + csc_writer + ", csc_regdate=" + csc_regdate + ", csc_bnum=" + csc_bnum
				+ ", csc_lvl=" + csc_lvl + ", csc_step=" + csc_step + ", csc_nref=" + csc_nref + "]";
	}

	
	
}
