package kr.co.dw.repository.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlsession;
	
	private final String NAMESPACE = "kr.co.dw.member";
	
	@Override
	public MemberDTO login(MemberDTO mDto) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".login", mDto);
	}
	
	@Override
	public List<MemberDTO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NAMESPACE+".list");
	}
	
	@Override
	public void insert(MemberDTO dto) {
		sqlsession.insert(NAMESPACE + ".insert", dto);
		
	}

	@Override
	public MemberDTO read(String id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".read", id);
	}

	@Override
	public MemberDTO updateUI(String id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".updateUI", id);
	}

	@Override
	public void update(MemberDTO dto) {
		sqlsession.update(NAMESPACE+".update", dto);
		
	}

	@Override
	public void delete(MemberDTO dto) {
		sqlsession.delete(NAMESPACE+".delete", dto);
		
	}

}
