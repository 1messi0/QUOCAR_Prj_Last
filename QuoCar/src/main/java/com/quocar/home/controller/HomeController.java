package com.quocar.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	
	@RequestMapping("/")   // root : http://localhost:9090/   
	public  String  home( ) {			
		return  "home";      // /WEB-INF/views/ home .jsp
	}
	
	// 로그인 화면
    @RequestMapping("/login")
    public  String   login() {
       return  "user/login";
    }
    
    // 회원가입 화면
    @RequestMapping("/user/register")
    public  String  register() {
    	return  "user/register";
    }
    
    // 정비 페이지 이동
    @RequestMapping("/mechanic")
    public void mechanic() {
    }
    
    // 보험 페이지 이동
    @RequestMapping("/insurance")
    public void insurance() {
    }
    
    //gpt페이지 이동
    @RequestMapping("/chatGPT")
    public void chatGPT() {
    	
    }

}







