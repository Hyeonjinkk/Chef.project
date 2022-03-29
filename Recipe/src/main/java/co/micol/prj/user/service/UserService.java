package co.micol.prj.user.service;

import java.util.List;

public interface UserService {

	List<UserVO> selectUserList(); //전체 사용자 리스트
	UserVO selectUser(UserVO vo);  //데이터 1건 출력, 로그인 처리
	
	int insertUser(UserVO vo);     //회원가입
	int updateUser(UserVO vo);     //회원정보 수정
	int deleteUser(UserVO vo);     //회원정보 삭제(탈퇴)
	boolean isIdCheck(String str); //아이디 중복체크
	
	String pwCheck(UserVO vo); //기존 패스워드 체크
	int updatePwd(UserVO vo);  //패스워드 변경
	
}
