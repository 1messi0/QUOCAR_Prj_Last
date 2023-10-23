package com.quocar.chat.service;

import java.util.List;

import com.quocar.chat.vo.MechanicVo;

public interface MechanicService {

	List<MechanicVo> getMechanicList();

	String getMechanicName(String mechanic_id);
	
	MechanicVo getMechanic(MechanicVo vo);
}
