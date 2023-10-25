package com.quocar.chat.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quocar.chat.dao.CmodelDao;
import com.quocar.chat.vo.CmodelVo;

@Repository("cmodelDao")
public class CmodelDaoImpl implements CmodelDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CmodelVo> getCmodelList() {
		List<CmodelVo> cmodelList = sqlSession.selectList("Cmodel.CmodelList");
		return cmodelList;
	}

	@Override
	public String getCmodelName(String model_id) {
		String model_name = sqlSession.selectOne("Cmodel.CmodelName", model_id);
		return model_name;
	}

	@Override
	public CmodelVo getCmodel(CmodelVo vo) {
		CmodelVo cmodelVo = sqlSession.selectOne("Cmodel.GetCmodel", vo);
		return cmodelVo;
	}

}
