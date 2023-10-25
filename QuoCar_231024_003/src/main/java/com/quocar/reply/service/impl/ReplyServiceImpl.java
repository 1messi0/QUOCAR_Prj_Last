package com.quocar.reply.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quocar.reply.dao.ReplyDAO;
import com.quocar.reply.service.ReplyService;
import com.quocar.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
    
	@Autowired
	private ReplyDAO replyDao;
    
	// 1. 댓글 작성
	@Override
	public void create(ReplyVO vo) {
		replyDao.create(vo);
	}
    // 2. 댓글 목록
    @Override
    public List<ReplyVO> list(Integer bno) {
        return replyDao.list(bno);
    }
    // 3. 댓글 상세보기
    @Override
    public ReplyVO detail(Integer rno) {
        return replyDao.detail(rno);
    }
    // 4. 댓글 수정
    @Override
    public void update(ReplyVO vo) {
    	replyDao.update(vo);
    }
    // 5. 댓글 삭제
    @Override
    public void delete(Integer rno) {
    	replyDao.delete(rno);
    }

 
}
