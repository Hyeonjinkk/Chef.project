package co.micol.prj.subscribe.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.comm.DataSource;
import co.micol.prj.subscribe.service.SubsMapper;
import co.micol.prj.subscribe.service.SubsService;
import co.micol.prj.subscribe.service.SubsVO;

public class SubsServiceImpl implements SubsService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private SubsMapper map = sqlSession.getMapper(SubsMapper.class);
	
	@Override
	public List<SubsVO> followingList(SubsVO vo) {
		
		return map.followingList(vo);
	}

	@Override
	public List<SubsVO> followerList(SubsVO vo) {
		
		return map.followerList(vo);
	}

	@Override
	public int insertFollowing(SubsVO vo) {
		
		return map.insertFollowing(vo);
	}

	@Override
	public int deleteFollowing(SubsVO vo) {
		
		return map.deleteFollowing(vo);
	}

}
