package com.quocar.csc.vo;

public class CmenuVo {
	// Fields
	private String csc_id;
	private String csc_name;
	private int    csc_seq;
	
	// Contructor
	public CmenuVo() {}
	public CmenuVo(String csc_id, String csc_name, int csc_seq) {
		super();
		this.csc_id = csc_id;
		this.csc_name = csc_name;
		this.csc_seq = csc_seq;
	}
	
	// Getter / Setter	
	public String getCsc_id() {
		return csc_id;
	}
	public void setCsc_id(String csc_id) {
		this.csc_id = csc_id;
	}
	public String getCsc_name() {
		return csc_name;
	}
	public void setCsc_name(String csc_name) {
		this.csc_name = csc_name;
	}
	public int getCsc_seq() {
		return csc_seq;
	}
	public void setCsc_seq(int csc_seq) {
		this.csc_seq = csc_seq;
	}
	//toString	
	@Override
	public String toString() {
		return "CmenuVo [csc_id=" + csc_id + ", csc_name=" + csc_name + ", csc_seq=" + csc_seq + "]";
	}
	
	
}
