package kr.co.dw.repository.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="kr.co.dw.review";

	@Override
	public void insert(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE+".insert", map);
		
	}

	@Override
	public List<ReviewDTO> list(int iId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".list", iId);
	}


}
