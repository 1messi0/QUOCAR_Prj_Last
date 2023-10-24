package com.quocar.chat.vo;

public class CmodelVo {
	// Fields
	private String model_id;
	private String model_name;
	private int    model_seq;
	
	//constructor
	public CmodelVo() {}
	public CmodelVo(String model_id, String model_name, int model_seq) {
		super();
		this.model_id = model_id;
		this.model_name = model_name;
		this.model_seq = model_seq;
	}
	
	//Getter/Setter
	public String getModel_id() {
		return model_id;
	}
	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}
	public String getModel_name() {
		return model_name;
	}
	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}
	public int getModel_seq() {
		return model_seq;
	}
	public void setModel_seq(int model_seq) {
		this.model_seq = model_seq;
	}
	
	//toString
	@Override
	public String toString() {
		return "ModelVo [model_id=" + model_id + ", model_name=" + model_name + ", model_seq=" + model_seq + "]";
	}
	
}
