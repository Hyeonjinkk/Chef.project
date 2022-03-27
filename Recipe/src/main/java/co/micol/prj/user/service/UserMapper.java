package co.micol.prj.user.service;

import java.util.List;

public interface UserMapper {

	List<UserVO> selectUserList(); //전체리스트
	UserVO selectUser(UserVO vo);
	
	UserVO selectAlias(UserVO vo);	// recipe 페이지 alias출력
	
	int insertUser(UserVO vo);
	int updateUser(UserVO vo);
	int deleteUser(UserVO vo);
	boolean isIdCheck(String str);
	
}
