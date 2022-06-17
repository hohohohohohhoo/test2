package kr.co.dw.controller.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import kr.co.dw.domain.ReviewDTO;
import kr.co.dw.service.review.ReviewService;

@RestController
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	@RequestMapping(value = "/{iId}/all", method = RequestMethod.GET)
	public List<ReviewDTO> list(@PathVariable("iId") int iId){
		List<ReviewDTO> list= rService.list(iId);
		System.out.println(list);
		return list;
		
	}
	
	
	

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody Map<String, Object> map) {
		ResponseEntity<String> entity =null;
	
		
		try {
			rService.insert(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	};
}
