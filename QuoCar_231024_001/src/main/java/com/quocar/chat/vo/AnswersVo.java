package com.quocar.chat.vo;

public class AnswersVo {
	//Fields
	private int    ans_idx;
	private String model_id;
	private String mechanic_id;
	private String ans_cont;

	//constructor
	public AnswersVo() {}
	public AnswersVo(int ans_idx, String model_id, String mechanic_id, String ans_cont) {
		super();
		this.ans_idx = ans_idx;
		this.model_id = model_id;
		this.mechanic_id = mechanic_id;
		this.ans_cont = ans_cont;
	}
	
	//Getter/Setter
	public int getAns_idx() {
		return ans_idx;
	}
	public void setAns_idx(int ans_idx) {
		this.ans_idx = ans_idx;
	}
	public String getModel_id() {
		return model_id;
	}
	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}
	public String getMechanic_id() {
		return mechanic_id;
	}
	public void setMechanic_id(String mechanic_id) {
		this.mechanic_id = mechanic_id;
	}
	public String getAns_cont() {
		return ans_cont;
	}
	public void setAns_cont(String ans_cont) {
		this.ans_cont = ans_cont;
	}
	
	//toString
	@Override
	public String toString() {
		return "AnswersVo [ans_idx=" + ans_idx + ", model_id=" + model_id + ", mechanic_id=" + mechanic_id
				+ ", ans_cont=" + ans_cont + "]";
	}
	
	
}
