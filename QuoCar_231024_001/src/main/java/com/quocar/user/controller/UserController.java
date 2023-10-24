// UserController.java
package com.quocar.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.quocar.user.service.UserService;
import com.quocar.user.vo.UserVo;

@Controller
@RequestMapping("/user") // 모든맵핑은 /user/를 상속
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
   // 사용자 등록 화면을 렌더링합니다.
    // /register?id=3
    @GetMapping("/register")
    public String register() {
    
        return "user/register";
    }
    
 // 사용자 등록 요청을 처리합니다.
    //  /user/insertUser
    @RequestMapping("/insertUser")
    public String registerPost(@RequestParam HashMap<String, Object> map, Model model) {
        // 아이디 중복 확인
       // if (userService.checkIdDuplication(userVo.getUserid())) {
       //     model.addAttribute("error", "아이디 중복");
       //     return "user/register";
       // }
    	
    	//map.put("id", id);
        // 사용자 등록
        int result = userService.register(map);

        if (result > 0) {
            return "redirect:/user/login"; // 사용자 등록 성공 시 로그인 화면으로 리다이렉트
        } else {
            model.addAttribute("error", "등록 실패");
            return "user/register";
        }
    }

    // idCheck POST 요청을 처리하기 위한 새로운 메서드 추가
    @PostMapping("/user/register")
    @ResponseBody
    public boolean checkIdDuplication(@RequestParam HashMap<String, Object> map, Model model) {
        // ID 중복 확인 로직을 구현합니다.
        // 여기에서 중복을 확인하기 위해 서비스 메서드를 호출하거나 다른 적절한 방법을 사용할 수 있습니다.
        boolean isDuplicate = userService.checkIdDuplication(map);
        return isDuplicate;
    }
    
    // 01. 로그인 화면 
    @RequestMapping("login")
    public String login(){
        return "user/login";    // views/user/login.jsp로 포워드
    }
    
    // 02. 로그인 처리
    @RequestMapping("loginCheck")
    public ModelAndView loginCheck(@ModelAttribute UserVo vo, HttpSession session){
        boolean result = userService.loginCheck(vo, session);
        ModelAndView mav = new ModelAndView();
        if (result == true) { // 로그인 성공
            // home.jsp로 이동
            mav.setViewName("home");
            mav.addObject("msg", "success");
        } else {    // 로그인 실패
            // login.jsp로 이동
            mav.setViewName("user/login");
            mav.addObject("msg", "failure");
        }
        return mav;
    }
       
    // 03. 로그아웃 처리
    @RequestMapping("logout")
    public ModelAndView logout(HttpSession session){
        userService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user/login");
        mav.addObject("msg", "logout");
        return mav;
    }
    
    @RequestMapping("/mypage")
    public String updateUser() {

      return "user/mypage";
    }
}
