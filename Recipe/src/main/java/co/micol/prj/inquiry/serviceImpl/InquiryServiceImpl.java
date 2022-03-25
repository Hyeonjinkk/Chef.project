package co.micol.prj.inquiry.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.comm.DataSource;
import co.micol.prj.inquiry.service.InquiryMapper;
import co.micol.prj.inquiry.service.InquiryService;
import co.micol.prj.inquiry.service.InquiryVO;



public class InquiryServiceImpl implements InquiryService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private InquiryMapper map = sqlSession.getMapper(InquiryMapper.class);
	
	@Override
	public List<InquiryVO> inquirySelectList() {
		// TODO Auto-generated method stub
		return map.inquirySelectList();
	}

	@Override
	public InquiryVO inquirySelect(InquiryVO vo) {
		// TODO Auto-generated method stub
		return map.inquirySelect(vo);
	}

	@Override
	public int inquiryInsert(InquiryVO vo) {
		// TODO Auto-generated method stub
		return map.inquiryInsert(vo);
	}

	@Override
	public int inquiryUpdate(InquiryVO vo) {
		// TODO Auto-generated method stub
		return map.inquiryUpdate(vo);
	}

	@Override
	public int inquiryDelete(InquiryVO vo) {
		// TODO Auto-generated method stub
		return map.inquiryDelete(vo);
	}

	@Override
	public int inquiryUpdateHit(int id) {
		// TODO Auto-generated method stub
		return map.inquiryUpdateHit(id);
	}

	@Override
	public List<InquiryVO> inquirySelectSearchList(String key, String val) {
		// TODO Auto-generated method stub
		return map.inquirySelectSearchList(key, val);
	}

	@Override
	public List<InquiryVO> inquirySortList(String key) {
		// TODO Auto-generated method stub
		return map.inquirySortList(key);
	}

}
