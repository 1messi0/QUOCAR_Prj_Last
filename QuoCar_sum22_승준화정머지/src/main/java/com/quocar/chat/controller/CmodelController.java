package com.quocar.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quocar.chat.service.CmodelService;
import com.quocar.chat.vo.CmodelVo;

@Controller
@RequestMapping("/Chat")
public class CmodelController {
	
	@Autowired
	private CmodelService cmodelService;
	
	//차량명 목록
	@RequestMapping("/List")
	public String list(Model model) {
		List<CmodelVo> cmodelList = cmodelService.getCmodelList();
		model.addAttribute("cmodelList", cmodelList);
		return "chat/list";
	}
}
