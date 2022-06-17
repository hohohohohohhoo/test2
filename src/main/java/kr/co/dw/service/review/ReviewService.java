package kr.co.dw.service.review;

import java.util.List;
import java.util.Map;

import kr.co.dw.domain.ReviewDTO;

public interface ReviewService {

	void insert(Map<String, Object> map);

	List<ReviewDTO> list(int iId);


}
