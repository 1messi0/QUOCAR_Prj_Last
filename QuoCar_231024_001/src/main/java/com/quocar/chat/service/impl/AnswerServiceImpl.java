package com.quocar.chat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quocar.chat.dao.AnswerDao;
import com.quocar.chat.service.AnswerService;
import com.quocar.chat.vo.AnswersVo;

@Service("answerService")
public class AnswerServiceImpl implements AnswerService {
	
	@Autowired
	private AnswerDao answerDao;
	@Override
	public List<AnswersVo> getAnswerList(AnswersVo vo) {
		List<AnswersVo> answerList = answerDao.getAnswerList(vo);
		return answerList;
	}
	@Override
	public AnswersVo getView(AnswersVo vo) {
		AnswersVo answersVo = answerDao.getView(vo);
		return answersVo;
	}

}
