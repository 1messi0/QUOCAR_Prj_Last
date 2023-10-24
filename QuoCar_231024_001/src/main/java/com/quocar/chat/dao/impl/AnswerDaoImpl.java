package com.quocar.chat.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quocar.chat.dao.AnswerDao;
import com.quocar.chat.vo.AnswersVo;

@Repository("answerDao")
public class AnswerDaoImpl implements AnswerDao {
	
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<AnswersVo> getAnswerList(AnswersVo vo) {
		List<AnswersVo> answerList = sqlSession.selectList("Answer.AnswerList", vo);
		return answerList;
	}
	@Override
	public AnswersVo getView(AnswersVo vo) {
		AnswersVo answersVo =sqlSession.selectOne("Answer.AnswerView", vo);
		return answersVo;
	}

}
