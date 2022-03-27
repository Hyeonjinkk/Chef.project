package co.micol.prj.user.service;

import java.util.List;

public interface UserService {

	List<UserVO> selectUserList(); //전체 사용자 리스트
	UserVO selectUser(UserVO vo);  //데이터 1건 출력, 로그인 처리
	
	UserVO selectAlias(UserVO vo);	// recipe 페이지 alias출력
	
	int insertUser(UserVO vo);     //등록
	int updateUser(UserVO vo);     //수정
	int deleteUser(UserVO vo);     //삭제
	boolean isIdCheck(String str); //아이디 중복체크
	
}
