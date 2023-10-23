package com.quocar.chat.dao;

import java.util.List;

import com.quocar.chat.vo.AnswersVo;

public interface AnswerDao {

	List<AnswersVo> getAnswerList(AnswersVo vo);

	AnswersVo getView(AnswersVo vo);

}
