package com.quocar.csc.service;

import java.util.List;

import com.quocar.csc.vo.CmenuVo;

public interface CmenuService {

	List<CmenuVo> getCmenuList();

	String getCscName(String csc_id);
	
	CmenuVo getCmenu(CmenuVo vo);

}
