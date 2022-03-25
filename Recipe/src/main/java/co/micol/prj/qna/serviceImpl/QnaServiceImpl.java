package co.micol.prj.qna.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.qna.service.QnaMapper;
import co.micol.prj.qna.service.QnaService;
import co.micol.prj.qna.service.QnaVO;
import co.micol.prj.comm.DataSource;

public class QnaServiceImpl implements QnaService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private QnaMapper map = sqlSession.getMapper(QnaMapper.class); 
	
	@Override
	public List<QnaVO> qnaSelectList() {

		return map.qnaSelectList();
	}

	@Override
	public QnaVO qnaSelect(QnaVO vo) {
		// TODO Auto-generated method stub
		return map.qnaSelect(vo);
	}

	@Override
	public int qnaInsert(QnaVO vo) {
		// TODO Auto-generated method stub
		return map.qnaInsert(vo);
	}

	@Override
	public int qnaUpdate(QnaVO vo) {
		// TODO Auto-generated method stub
		return map.qnaUpdate(vo);
	}

	@Override
	public int qnaDelete(QnaVO vo) {
		// TODO Auto-generated method stub
		return map.qnaDelete(vo);
	}

	@Override
	public List<QnaVO> qnaSelectSearchList(String key, String val) {
		// TODO Auto-generated method stub
		return map.qnaSelectSearchList(key, val);
	}

	@Override
	public int qnaUpdateHit(int id) {
		
		return map.qnaUpdateHit(id);
	}

	@Override
	public List<QnaVO> qnaSortList(String key) {

		return map.qnaSortList(key);
	}

}
