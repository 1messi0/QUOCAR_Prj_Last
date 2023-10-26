package com.quocar.reply.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quocar.reply.dao.ReplyDAO;
import com.quocar.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
    
	// 1. 댓글 작성
	@Override
	public void create(ReplyVO vo) {
		sqlSession.insert("reply.insertReply", vo);
	}
    // 2. 댓글 목록
    @Override
    public List<ReplyVO> list(Integer bno) {
        return sqlSession.selectList("reply.listReply", bno);
    }
    // 3. 댓글 상세보기
    @Override
    public ReplyVO detail(Integer rno) {
    	ReplyVO vo = sqlSession.selectOne("reply.detailReply", rno);
    	System.out.println("resuolt = " + vo);		
        return vo;
    }
    // 4. 댓글 수정
    @Override
    public void update(ReplyVO vo) {
    	sqlSession.update("reply.updateReply", vo);
    }
    // 5. 댓글 삭제
    @Override
    public void delete(Integer rno) {
    	sqlSession.delete("reply.deleteReply", rno);
    }

}
