package com.quocar.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.quocar.chat.service.AnswerService;
import com.quocar.chat.service.CmodelService;
import com.quocar.chat.service.MechanicService;
import com.quocar.chat.vo.AnswersVo;
import com.quocar.chat.vo.CmodelVo;
import com.quocar.chat.vo.MechanicVo;

@Controller
@RequestMapping("/Chat")
public class AnswersController {
	
	@Autowired
	private AnswerService answerService;
	@Autowired
	private CmodelService cmodelService;
	@Autowired
	private MechanicService mechanicService;
	
	//답변
	@RequestMapping("/List3")
	public ModelAndView list3(AnswersVo vo) {
		
		//차량목록
		List<CmodelVo> cmodelList = cmodelService.getCmodelList();
		// 차량목록 이름
		String         model_id   = vo.getModel_id();
		String         model_name = cmodelService.getCmodelName(model_id);
		 
		//답변 목록
		List<AnswersVo>  answerList  = answerService.getAnswerList(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("model_name", model_name);
		mv.addObject("cmodelList", cmodelList);
		mv.addObject("answerList", answerList);
		mv.setViewName("chat/list3");
		return mv;
 	}
	
	// /Chat/View?mechanic_id=MC01&model_id=MD01
			@RequestMapping("/View")
			public  ModelAndView   view( AnswersVo vo ) {
				
				//차량목록
				List<CmodelVo> cmodelList = cmodelService.getCmodelList();
				// 차량목록 이름
				String         model_id   = vo.getModel_id();
				String         model_name = cmodelService.getCmodelName(model_id);
				
				/*정비목록*/ 
				List<MechanicVo> mechanicList = mechanicService.getMechanicList();
				/* 정비목록 이름 */ 
				String mechanic_id   = vo.getMechanic_id(); 
				String Mechanic_name = mechanicService.getMechanicName(mechanic_id);

				// 보여줄 게시물 내용을 조회
				AnswersVo       answersVo  =   answerService.getView( vo );
				
				String        ans_cont     =   answersVo.getAns_cont().replace("\n", "<br>") ;
				answersVo.setAns_cont(ans_cont);
				
				ModelAndView  mv  =  new ModelAndView();
				mv.addObject("cmodelList",  cmodelList);
				mv.addObject("model_name", model_name);
				mv.addObject("Mechanic_name", Mechanic_name);
				mv.addObject("mechanicList", mechanicList);
				mv.addObject("vo", answersVo);
				mv.setViewName("chat/view");
				return mv;
				
			}
}



















