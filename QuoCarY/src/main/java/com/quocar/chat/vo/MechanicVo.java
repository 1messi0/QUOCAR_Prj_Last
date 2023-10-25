package com.quocar.chat.vo;

public class MechanicVo {
	// Fields
	private String mechanic_id;
	private String mechanic_name;
	private int    mechanic_seq;
	
	//Constructor
	public MechanicVo() {}
	public MechanicVo(String mechanic_id, String mechanic_name, int mechanic_seq) {
		super();
		this.mechanic_id = mechanic_id;
		this.mechanic_name = mechanic_name;
		this.mechanic_seq = mechanic_seq;
	}
	
	//Getter/Setter
	public String getMechanic_id() {
		return mechanic_id;
	}
	public void setMechanic_id(String mechanic_id) {
		this.mechanic_id = mechanic_id;
	}
	public String getMechanic_name() {
		return mechanic_name;
	}
	public void setMechanic_name(String mechanic_name) {
		this.mechanic_name = mechanic_name;
	}
	public int getMechanic_seq() {
		return mechanic_seq;
	}
	public void setMechanic_seq(int mechanic_seq) {
		this.mechanic_seq = mechanic_seq;
	}
	
	//toString
	@Override
	public String toString() {
		return "MechanicVo [mechanic_id=" + mechanic_id + ", mechanic_name=" + mechanic_name + ", mechanic_seq="
				+ mechanic_seq + "]";
	}
}
