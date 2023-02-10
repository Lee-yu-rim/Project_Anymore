package com.zerock.service;

import java.util.List;

import com.zerock.domain.Criteria;
import com.zerock.domain.MemberVO;
import com.zerock.domain.PassFindVO;

public interface MemberService {
	
	//경은씨가 추가한 회원정보 수정
	public void update(MemberVO member);
	
	
	//회원 목록 가져오기
	public List<MemberVO> getList();
	
	//회원 가입
	public void register(MemberVO member);
	
	//회원 정보 상세보기
	public MemberVO get(String id);
	
	//회원 정보 수정
	public boolean modify(MemberVO member);
	
	//회원 정보 삭제
	public boolean remove(String id);
	
	//아이디 중복 체크
	public MemberVO idCheck(String id);
	
	//로그인
	public MemberVO login(MemberVO member) throws Exception;
	
	//비밀번호 찾기
	public PassFindVO pass_find(PassFindVO vo);

	//페이지
	public int getTotal(Criteria cri);
	
	public List<MemberVO> getList(Criteria cri);

}
