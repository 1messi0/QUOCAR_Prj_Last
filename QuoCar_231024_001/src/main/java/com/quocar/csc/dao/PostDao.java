package com.quocar.csc.dao;

import java.util.List;

import com.quocar.csc.vo.PostVo;

public interface PostDao {

	List<PostVo> getPostList(PostVo vo);

	void insertPost(PostVo vo);

	PostVo getView(PostVo vo);

	void deletePost(PostVo vo);

}
