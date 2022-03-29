package co.micol.prj.user.service;

import java.util.List;

public interface UserMapper {

	List<UserVO> selectUserList(); //전체리스트
	UserVO selectUser(UserVO vo);
	
	
	int insertUser(UserVO vo);
	int updateUser(UserVO vo);
	int deleteUser(UserVO vo);
	boolean isIdCheck(String str);
	
	String pwCheck(UserVO vo); //기존 패스워드 체크
	
}
