package com.quocar.user.dao;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.quocar.user.vo.UserVo;

public interface UserDao {
    // 사용자 등록
    int insertUser(HashMap<String, Object> map);

    // 01_01. 회원 로그인 체크
    public boolean loginCheck(UserVo vo);
    // 01_02. 회원 로그인 정보
    public UserVo viewUser(UserVo vo);
    // 02. 회원 로그아웃
    public void logout(HttpSession session);

    // 로그인 확인
    boolean checkPassword(HashMap<String, Object> map);
    
    // ID 중복 확인
    boolean checkIdDuplication(HashMap<String, Object> map);

    void updateUserInfo(UserVo vo);

	String getPasswordByUserId(String userid);


}
