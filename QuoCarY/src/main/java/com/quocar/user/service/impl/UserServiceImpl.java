package com.quocar.user.service.impl;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quocar.user.dao.UserDao;
import com.quocar.user.service.UserService;
import com.quocar.user.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {

    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public int register(HashMap<String, Object> map) {
        // 사용자 등록 로직 구현
        int result = userDao.insertUser(map); // 사용자 정보를 데이터베이스에 저장
        return result;
    }

    @Override
    public boolean checkIdDuplication(HashMap<String, Object> map) {
        // 아이디 중복 확인 로직 구현
        return userDao.checkIdDuplication(map); // 데이터베이스에서 아이디 중복 여부 확인
    }

    @Override
    public boolean login(HashMap<String, Object> map) {
        // 로그인 확인 로직 구현
        return userDao.checkPassword(map); // 사용자의 아이디와 비밀번호를 검사하여 로그인 확인
    }
    
    // 01_01. 회원 로그인체크
    @Override
    public boolean loginCheck(UserVo vo, HttpSession session) {
        boolean result = userDao.loginCheck(vo);
        if (result) { // true일 경우 세션에 등록
            UserVo vo2 = viewUser(vo);
            // 세션 변수 등록
            session.setAttribute("userid", vo2.getUserid());
            session.setAttribute("username", vo2.getUsername());
            session.setAttribute("gender", vo2.getGender());
            session.setAttribute("email", vo2.getEmail());
            
            // 날짜 형식을 포맷팅하여 세션에 저장
            SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
            String formattedBirthdate = dateFormat.format(vo2.getBirthdate());
            session.setAttribute("birthdate", formattedBirthdate);
            session.setAttribute("carManufacturer", vo2.getCarManufacturer());
            session.setAttribute("carModel", vo2.getCarModel());

        } 
        return result;
    }
    // 01_02. 회원 로그인 정보
    @Override
    public UserVo viewUser(UserVo vo) {
        return userDao.viewUser(vo);
    }
    // 02. 회원 로그아웃
    @Override
    public void logout(HttpSession session) {
        // 세션 변수 개별 삭제
        // session.removeAttribute("userid");
        // 세션 정보를 초기화 시킴
        session.invalidate();
    }

}