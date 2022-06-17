package kr.co.dw.service.member;

import java.util.List;

import kr.co.dw.domain.MemberDTO;

public interface MemberService {
	
	MemberDTO login(MemberDTO mDto);

	void insert(MemberDTO dto);

	List<MemberDTO> list();

	MemberDTO read(String id);

	MemberDTO updateUI(String id);

	void update(MemberDTO dto);

	void delete(MemberDTO dto);

}
