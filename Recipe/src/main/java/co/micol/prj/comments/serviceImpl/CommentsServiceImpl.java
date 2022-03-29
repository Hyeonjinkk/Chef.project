package co.micol.prj.comments.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.comm.DataSource;
import co.micol.prj.comments.service.CommentsMapper;
import co.micol.prj.comments.service.CommentsService;
import co.micol.prj.comments.service.CommentsVO;

public class CommentsServiceImpl implements CommentsService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private CommentsMapper map = sqlSession.getMapper(CommentsMapper.class);

	@Override
	public List<CommentsVO> selectCommentsList() {
		// TODO Auto-generated method stub
		return map.selectCommentsList();
	}

	@Override
	public CommentsVO selectComments(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.selectComments(vo);
	}

	@Override
	public int insertComments(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.insertComments(vo);
	}

	@Override
	public int updateComments(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.updateComments(vo);
	}

	@Override
	public int deleteComments(CommentsVO vo) {
		// TODO Auto-generated method stub
		return map.deleteComments(vo);
	}

}
