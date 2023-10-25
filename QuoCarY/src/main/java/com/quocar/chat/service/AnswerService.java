package com.quocar.chat.service;

import java.util.List;

import com.quocar.chat.vo.AnswersVo;

public interface AnswerService {

	List<AnswersVo> getAnswerList(AnswersVo vo);

	AnswersVo getView(AnswersVo vo);

}
