package com.quocar.chat.service;

import java.util.List;

import com.quocar.chat.vo.CmodelVo;

public interface CmodelService {

	List<CmodelVo> getCmodelList();

	String getCmodelName(String model_id);
	
	CmodelVo getCmodel(CmodelVo vo);
}
