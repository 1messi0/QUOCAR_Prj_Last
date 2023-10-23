package com.quocar.chat.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quocar.chat.dao.MechanicDao;
import com.quocar.chat.vo.MechanicVo;

@Repository("mechanicDao")
public class MechanicDaoImpl implements MechanicDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MechanicVo> getMechanicList() {
		List<MechanicVo>  mechanicList = sqlSession.selectList("Mechanic.MechanicList");
		return mechanicList;
	}

	@Override
	public String getMechanicName(String mechanic_id) {
		String mechanic_name = sqlSession.selectOne("Mechanic.MechanicName", mechanic_id);
		return mechanic_name;
	}

	@Override
	public MechanicVo getMechanic(MechanicVo vo) {
		MechanicVo mechanicVo = sqlSession.selectOne("Mechanic.GetMechanic", vo);
		return mechanicVo;
	}

}
