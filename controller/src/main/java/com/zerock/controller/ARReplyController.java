package com.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zerock.domain.ARReplyVO;
import com.zerock.domain.Criteria;
import com.zerock.service.ARReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replyAR/")
@Log4j
@AllArgsConstructor
public class ARReplyController {

	private ARReplyService service;

	// 댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ARReplyVO reply) {
		log.info("UIReplyVO : " + reply);
		int insertCount = service.register(reply);
		log.info("Reply INSERT COUNT : " + insertCount);

		// 삼항 연산자 처리
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 페이징 처리
	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ARReplyVO>> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {
		log.info("getList...............");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK);
	}

	// 댓글 조회하기
	@GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ARReplyVO> get(@PathVariable("rno") Long rno) {
		log.info("get : " + rno);
		return new ResponseEntity<ARReplyVO>(service.get(rno), HttpStatus.OK);
	}

	// 댓글 삭제하기
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		log.info("remove : " + rno);
		return service.remove(rno) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 수정하기
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{rno}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody ARReplyVO reply, @PathVariable("rno") Long rno){
		reply.setRno(rno);
		log.info("rno : " + rno);
		log.info("modify : " + reply);
		return service.modify(reply) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) :
			  							 new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}