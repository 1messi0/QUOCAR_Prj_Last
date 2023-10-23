package com.quocar.csc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quocar.csc.dao.PostDao;
import com.quocar.csc.vo.PostVo;

@Repository("postDao")
public class PostDaoImpl implements PostDao {
	
	@Autowired
	private  SqlSession  sqlSession;
	@Override
	public List<PostVo> getPostList(PostVo vo) {
		List<PostVo>  postList  =  sqlSession.selectList("Post.PostList", vo);
		return postList;
	}

	@Override
	public void insertPost(PostVo vo) {
		
		if( vo.getCsc_bnum() == 0) { //문의사항 쓰기 
			sqlSession.insert("Post.PostInsert", vo);
		} else { //답변 쓰기
			sqlSession.update("Post.StepUpdate", vo); //기존글 step + 1
			sqlSession.insert("Post.PostReply",  vo); //답글추가
		}
	}

	@Override
	public PostVo getView(PostVo vo) {
		PostVo postVo = sqlSession.selectOne("Post.PostView", vo);
		return postVo;
	}

	@Override
	public void deletePost(PostVo vo) {
		sqlSession.delete("Post.PostDelete", vo);
		
	}
}
