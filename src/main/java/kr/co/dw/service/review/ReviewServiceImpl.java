package kr.co.dw.service.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dw.domain.ReviewDTO;
import kr.co.dw.repository.review.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO rDao;

	@Override
	public void insert(Map<String, Object> map) {
		rDao.insert(map);
		
	}

	@Override
	public List<ReviewDTO> list(int iId) {
		// TODO Auto-generated method stub
		return rDao.list(iId);
	}


}
