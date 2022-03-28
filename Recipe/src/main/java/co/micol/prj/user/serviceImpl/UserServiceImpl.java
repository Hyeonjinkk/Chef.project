package co.micol.prj.user.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.comm.DataSource;
import co.micol.prj.user.service.UserMapper;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;

public class UserServiceImpl implements UserService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private UserMapper map = sqlSession.getMapper(UserMapper.class);

	@Override
	public List<UserVO> selectUserList() {
		
		return map.selectUserList();
	}

	@Override
	public UserVO selectUser(UserVO vo) {
		
		return map.selectUser(vo);
	}

	@Override
	public int insertUser(UserVO vo) {
		
		return map.insertUser(vo);
	}

	@Override
	public int updateUser(UserVO vo) {
		
		return map.updateUser(vo);
	}

	@Override
	public int deleteUser(UserVO vo) {

		return map.deleteUser(vo);
	}

	@Override
	public boolean isIdCheck(String str) {

		return map.isIdCheck(str);
	}

	@Override
	public String pwCheck(UserVO vo) {
		
		return map.pwCheck(vo);
	}

	

}
