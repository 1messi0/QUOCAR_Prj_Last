package com.quocar.reply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.quocar.reply.service.ReplyService;
import com.quocar.reply.vo.ReplyVO;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	// 1. 댓글 입력
	@RequestMapping("insert.do")
	public void insert(@ModelAttribute ReplyVO vo, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		vo.setReplyer(userid);
		replyService.create(vo);
		
	}

	// 2_1. 댓글 목록(@Controller방식 : veiw(화면)를 리턴)
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam int bno, ModelAndView mav) {
		List<ReplyVO> list = replyService.list(bno);
		// 뷰이름 지정
		mav.setViewName("board/replyList");
		// 뷰에 전달할 데이터 지정
		mav.addObject("list", list);
		// replyList.jsp로 포워딩
		return mav;
	}

	// 2_2. 댓글 목록(@RestController Json방식으로 처리 : 데이터를 리턴)
	@RequestMapping("listJson.do")
	@ResponseBody // 리턴데이터를 json으로 변환(생략가능)
	public List<ReplyVO> listJson(@RequestParam int bno) {
		List<ReplyVO> list = replyService.list(bno);
		return list;
	}
	
    // 3. 댓글 상세 보기
    @RequestMapping(value="/detail/{rno}", method=RequestMethod.GET)
    public ModelAndView replyDetail(@PathVariable("rno") Integer rno, ModelAndView mav){
        ReplyVO vo = replyService.detail(rno);
        // 뷰이름 지정
        mav.setViewName("board/replyDetail");
        // 뷰에 전달할 데이터 지정
        mav.addObject("vo", vo);
        // replyDetail.jsp로 포워딩
        return mav;
    }
    
    // 4. 댓글 수정 처리 - PUT:전체 수정, PATCH:일부수정
    // RequestMethod를 여러 방식으로 설정할 경우 {}안에 작성
    @RequestMapping(value="/update/{rno}", method={RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> replyUpdate(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo){
        ResponseEntity<String> entity = null;
        try {
            vo.setRno(rno);
            replyService.update(vo);
            // 댓글 수정이 성공하면 성공 상태메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글 수정이 실패하면 실패 상태메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 수정 처리 HTTP 상태 메시지 리턴
        return entity;
    }
    
    // 5. 댓글 삭제처리
    @RequestMapping(value="/delete/{rno}")
    public ResponseEntity<String> replyDelete(@PathVariable("rno") Integer rno){
        ResponseEntity<String> entity = null;
        try {
            replyService.delete(rno);
            // 댓글 삭제가 성공하면 성공 상태메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글 삭제가 실패하면 실패 상태메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 삭제 처리 HTTP 상태 메시지 리턴
        return entity;
    }
	
	
}
