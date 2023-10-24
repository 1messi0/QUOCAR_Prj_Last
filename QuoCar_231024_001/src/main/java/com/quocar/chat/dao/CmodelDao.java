package com.quocar.chat.dao;

import java.util.List;

import com.quocar.chat.vo.CmodelVo;

public interface CmodelDao {

	List<CmodelVo> getCmodelList();

	String getCmodelName(String model_id);

	CmodelVo getCmodel(CmodelVo vo);

}
