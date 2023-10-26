package com.quocar.csc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quocar.csc.dao.CmenuDao;
import com.quocar.csc.service.CmenuService;
import com.quocar.csc.vo.CmenuVo;

@Service("cmenuService")
public class CmenuServiceImpl implements CmenuService {
	
	@Autowired
	private CmenuDao cmenuDao;
	@Override
	public List<CmenuVo> getCmenuList() {
		List<CmenuVo> cmenuList  = cmenuDao.getCmenuList();
		return cmenuList;
	}
	@Override
	public String getCscName(String csc_id) {
		String csc_name  =  cmenuDao.getCscName(csc_id);
		return csc_name;
	}
	@Override
	public CmenuVo getCmenu(CmenuVo vo) {
		CmenuVo  cmenuVo  =  cmenuDao.getCmenu(vo);
		return cmenuVo;
	}

}
