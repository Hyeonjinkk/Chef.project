package co.micol.prj.question.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.question.service.QuestionMapper;
import co.micol.prj.question.service.QuestionService;
import co.micol.prj.question.service.QuestionVO;
import co.micol.prj.comm.DataSource;

public class QuestionServiceImpl implements QuestionService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private QuestionMapper map = sqlSession.getMapper(QuestionMapper.class); 
	
	@Override
	public List<QuestionVO> questionSelectList() {

		return map.questionSelectList();
	}

	@Override
	public QuestionVO questionSelect(QuestionVO vo) {
		// TODO Auto-generated method stub
		return map.questionSelect(vo);
	}

	@Override
	public int questionInsert(QuestionVO vo) {
		// TODO Auto-generated method stub
		return map.questionInsert(vo);
	}

	@Override
	public int questionUpdate(QuestionVO vo) {
		// TODO Auto-generated method stub
		return map.questionUpdate(vo);
	}

	@Override
	public int questionDelete(QuestionVO vo) {
		// TODO Auto-generated method stub
		return map.questionDelete(vo);
	}

	@Override
	public List<QuestionVO> questionSelectSearchList(String key, String val) {
		// TODO Auto-generated method stub
		return map.questionSelectSearchList(key, val);
	}

	@Override
	public int questionUpdateHit(int id) {
		
		return map.questionUpdateHit(id);
	}

	@Override
	public List<QuestionVO> questionSortList(String key) {

		return map.questionSortList(key);
	}


}
