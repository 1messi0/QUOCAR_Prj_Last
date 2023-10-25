package com.quocar.csc.dao;

import java.util.List;

import com.quocar.csc.vo.CmenuVo;

public interface CmenuDao {

	List<CmenuVo> getCmenuList();

	String getCscName(String csc_id);

	CmenuVo getCmenu(CmenuVo vo);

}
