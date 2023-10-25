package com.quocar.reply.service;

import java.util.List;

import com.quocar.reply.vo.ReplyVO;

public interface ReplyService {
	// 1. 댓글 입력
	public void create(ReplyVO vo);
	
	// 2. 댓글 목록
	public List<ReplyVO> list(Integer bno);

    // 3. 댓글 상세보기
    public ReplyVO detail(Integer rno);
    
	// 4. 댓글 수정
	public void update(ReplyVO vo);

	// 5. 댓글 삭제
	public void delete(Integer rno);

}
