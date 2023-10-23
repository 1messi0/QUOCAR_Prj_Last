package com.quocar.csc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quocar.csc.dao.PostDao;
import com.quocar.csc.service.PostService;
import com.quocar.csc.vo.PostVo;

@Service("postService")
public class PostServiceImpl implements PostService {
	
	@Autowired
	private  PostDao  postDao;
	//문의사항 목록
	@Override
	public List<PostVo> getPostList(PostVo vo) {
		List<PostVo>  postList = postDao.getPostList(vo);
		return postList;
	}

	//문의사항 등록
	@Override
	public void insertPost(PostVo vo) {
		postDao.insertPost(vo);
	}

	@Override
	public PostVo getView(PostVo vo) {
		PostVo postVo = postDao.getView(vo);
		return postVo;
	}

	@Override
	public void deletePost(PostVo vo) {
		postDao.deletePost(vo);
	
	}



}
