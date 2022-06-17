package kr.co.dw.repository.member;

import java.util.List;

import kr.co.dw.domain.MemberDTO;

public interface MemberDAO {
	
	MemberDTO login(MemberDTO mDto);

	void delete(MemberDTO dto);

	void update(MemberDTO dto);

	MemberDTO updateUI(String id);

	MemberDTO read(String id);

	void insert(MemberDTO dto);

	List<MemberDTO> list();

}
