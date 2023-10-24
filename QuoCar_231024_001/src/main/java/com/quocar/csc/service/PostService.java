package com.quocar.csc.service;

import java.util.List;

import com.quocar.csc.vo.PostVo;

public interface PostService {

	List<PostVo> getPostList(PostVo vo);

	void insertPost(PostVo vo);

	PostVo getView(PostVo vo);

	void deletePost(PostVo vo);

}
