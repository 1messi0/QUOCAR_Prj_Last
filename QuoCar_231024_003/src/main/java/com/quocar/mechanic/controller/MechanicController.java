package com.quocar.mechanic.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MechanicController {

    // 정비 화면 요청
    @RequestMapping("/mechanic")
    public String member(HttpSession session) {
    	
        return "mechanic"; // "user" 폴더에서 파일을 로드합니다.
    }
}