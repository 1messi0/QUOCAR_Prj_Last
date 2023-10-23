package com.quocar.user.dao.impl;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quocar.user.dao.UserDao;
import com.quocar.user.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SqlSession sqlSession;

    // 회원가입
    @Override
    public int insertUser(HashMap<String, Object> map) {
        return sqlSession.insert("User.insertUser", map);
    }
    
    // 아이디 중복확인
    @Override
    public boolean checkIdDuplication(HashMap<String, Object> map) {
        int count = sqlSession.selectOne("User.checkIdDuplication", map);
        return count > 0; // 중복된 ID가 존재하는 경우 true 반환
    }

    // 01_01. 회원 로그인체크
    @Override
    public boolean loginCheck(UserVo vo) {
        String userid = sqlSession.selectOne("User.loginCheck", vo);
        return (userid == null) ? false : true;
    }
    // 01_02. 회원 로그인 정보
    @Override
    public UserVo viewUser(UserVo vo) {
        return sqlSession.selectOne("User.viewUser", vo);
    }
    // 02. 회원 로그아웃
    @Override
    public void logout(HttpSession sessin) {
    }
}