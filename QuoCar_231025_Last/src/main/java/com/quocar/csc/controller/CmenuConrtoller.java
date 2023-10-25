package com.quocar.csc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quocar.csc.service.CmenuService;
import com.quocar.csc.vo.CmenuVo;

@Controller
@RequestMapping("/Csc")
public class CmenuConrtoller {
	@Autowired
	private CmenuService cmenuService;
	
	//고객센터 목록
	@RequestMapping("/List")
	public String list(Model model) {
		List<CmenuVo> cmenuList = cmenuService.getCmenuList();
		model.addAttribute("cmenuList", cmenuList);
		return "csc/list";
	}
}
