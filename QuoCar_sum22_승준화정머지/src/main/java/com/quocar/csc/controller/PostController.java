package com.quocar.csc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.quocar.csc.service.CmenuService;
import com.quocar.csc.service.PostService;
import com.quocar.csc.vo.CmenuVo;
import com.quocar.csc.vo.PostVo;

@Controller
@RequestMapping("/Csc")
public class PostController {
	
	@Autowired
	private PostService postService;
	@Autowired
	private CmenuService cmenuService;
	
	//문의 사항 목록
	@RequestMapping("/List2") 
	public ModelAndView list2( PostVo vo) {

		//CmenuList - 고객센터 목록
		List<CmenuVo> cmenuList = cmenuService.getCmenuList();

		//고객센터 목록이름
		String        csc_id    = vo.getCsc_id();
		String        csc_name  = cmenuService.getCscName(csc_id);
		
		//PostList  - 문의사항 목록
		List<PostVo>  postList  = postService.getPostList(vo);
		
		ModelAndView  mv = new ModelAndView();
		mv.addObject("csc_name",  csc_name);
		mv.addObject("cmenuList", cmenuList);
		mv.addObject("postList",  postList);
		mv.setViewName("csc/list2");
		return mv;
	}
	
	//문의사항 쓰기
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(PostVo vo) {
		//CmenuList - 고객센터 메뉴
		List<CmenuVo>  cmenuList  =  cmenuService.getCmenuList();
		// 답글이 경우 : 내용을 조회하여 출력
				if( vo.getCsc_bnum() > 0 ) {
					PostVo  postVo = postService.getView(vo);
					vo             = postVo;
					vo.setCsc_cont( vo.getCsc_cont() + "\n\n------------------\n");
				}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("cmenuList", cmenuList);
		mv.addObject("vo"       , vo);
		mv.setViewName("csc/write");
		return mv;
	}

	
	//문의사항 등록
	@RequestMapping("/Write")
	public ModelAndView write(PostVo vo) {
		
		postService.insertPost(vo);
		 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Csc/List2?csc_id=" + vo.getCsc_id());
		return mv;
	}
	
	// /Csc/View?csc_idx=4&csc_id=CSC01
		@RequestMapping("/View")
		public  ModelAndView   view( PostVo vo ) {
			
			// 메뉴 목록 조회
			List<CmenuVo>  cmenuList  =  cmenuService.getCmenuList();
			
			// 보여줄 게시물 내용을 조회
			PostVo       postVo  =   postService.getView( vo );
			
			String        csc_cont     =   postVo.getCsc_cont().replace("\n", "<br>") ;
			postVo.setCsc_cont(csc_cont);
			
			ModelAndView  mv  =  new ModelAndView();
			mv.addObject("cmenuList",  cmenuList);
			mv.addObject("vo", postVo);
			mv.setViewName("csc/view");
			return mv;
			
		}
		
		// /Board/Delete?csc_id=CSC01&csc_idx=#{csc_idx}
		@RequestMapping("/Delete")
		public ModelAndView delete(PostVo vo) {
			//csc_idx로 게시물 삭제
			postService.deletePost(vo);
			 
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/Csc/List2?csc_id=" + vo.getCsc_id());
			return mv;
		}
	
}






















