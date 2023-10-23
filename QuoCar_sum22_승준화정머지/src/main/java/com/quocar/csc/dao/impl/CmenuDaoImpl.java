package com.quocar.csc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quocar.csc.dao.CmenuDao;
import com.quocar.csc.vo.CmenuVo;

@Repository("cmenuDao")
public class CmenuDaoImpl implements CmenuDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CmenuVo> getCmenuList() {
		List<CmenuVo>  cmenuList = sqlSession.selectList("Cmenu.CmenuList");
		return cmenuList;
	}
	@Override
	public String getCscName(String csc_id) {
		String csc_name = sqlSession.selectOne("Cmenu.CmenuName", csc_id);
		return csc_name;
	}
	@Override
	public CmenuVo getCmenu(CmenuVo vo) {
		CmenuVo  cmenuVo  =  sqlSession.selectOne("Cmenu.GetCmenu", vo);
		return cmenuVo;
	}

}





















