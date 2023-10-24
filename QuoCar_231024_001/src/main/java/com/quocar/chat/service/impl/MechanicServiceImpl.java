package com.quocar.chat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quocar.chat.dao.MechanicDao;
import com.quocar.chat.service.MechanicService;
import com.quocar.chat.vo.MechanicVo;

@Service("mechanicService")
public class MechanicServiceImpl implements MechanicService {
	
	@Autowired
	private MechanicDao mechanicDao;
	@Override
	public List<MechanicVo> getMechanicList() {
		List<MechanicVo> mechanicList = mechanicDao.getMechanicList();
		return mechanicList;
	}
	@Override
	public String getMechanicName(String mechanic_id) {
		String mechanic_name = mechanicDao.getMechanicName(mechanic_id);
		return mechanic_name;
	}
	@Override
	public MechanicVo getMechanic(MechanicVo vo) {
		MechanicVo mechanicVo = mechanicDao.getMechanic(vo);
		return mechanicVo;
	}

}
