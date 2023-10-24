package com.quocar.chat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quocar.chat.dao.CmodelDao;
import com.quocar.chat.service.CmodelService;
import com.quocar.chat.vo.CmodelVo;

@Service("cmodelService")
public class CmodelServiceImpl implements CmodelService {
	
	@Autowired
	private CmodelDao cmodelDao;
	
	@Override
	public List<CmodelVo> getCmodelList() {
		List<CmodelVo> cmodelList =  cmodelDao.getCmodelList();
		return cmodelList;
	}

	@Override
	public String getCmodelName(String model_id) {
		String model_name = cmodelDao.getCmodelName(model_id);
		return model_name;
	}

	@Override
	public CmodelVo getCmodel(CmodelVo vo) {
		CmodelVo cmodelVo = cmodelDao.getCmodel(vo);
		return cmodelVo;
	}

}
