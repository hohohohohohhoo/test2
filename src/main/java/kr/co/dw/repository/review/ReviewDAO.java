package kr.co.dw.repository.review;

import java.util.List;
import java.util.Map;

import kr.co.dw.domain.ReviewDTO;

public interface ReviewDAO {

	void insert(Map<String, Object> map);

	List<ReviewDTO> list(int iId);


}
