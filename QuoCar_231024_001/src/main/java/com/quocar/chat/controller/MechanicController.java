package com.quocar.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quocar.chat.service.MechanicService;
import com.quocar.chat.vo.MechanicVo;

@Controller
@RequestMapping("/Chat")
public class MechanicController {
	
	@Autowired
	private MechanicService mechanicService;
	
	//차량명 목록
	@RequestMapping("/List2")
	public String list(Model model) {
		List<MechanicVo> mechanicList = mechanicService.getMechanicList();
		model.addAttribute("mechanicList", mechanicList);
		return "chat/list2";
	}
}
