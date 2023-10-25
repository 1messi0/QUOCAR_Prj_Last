// UserService.java
package com.quocar.user.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.quocar.user.vo.UserVo;

public interface UserService {
    // 사용자 등록
	int register(HashMap<String, Object> map);

    // 01_01. 회원 로그인 체크
    public boolean loginCheck(UserVo vo, HttpSession session);
    // 01_02. 회원 로그인 정보
    public UserVo viewUser(UserVo vo);
    // 02. 회원 로그아웃
    public void logout(HttpSession session);

    // 로그인 확인
    boolean login(HashMap<String, Object> map);
    
    // 아이디 중복 확인
    boolean checkIdDuplication(HashMap<String, Object> map);

}