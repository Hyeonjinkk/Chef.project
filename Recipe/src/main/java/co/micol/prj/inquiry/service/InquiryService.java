package co.micol.prj.inquiry.service;

import java.util.List;


public interface InquiryService {

	List<InquiryVO> inquirySelectList();
	InquiryVO inquirySelect(InquiryVO vo);
	int inquiryInsert(InquiryVO vo);
	int inquiryUpdate(InquiryVO vo);
	int inquiryDelete(InquiryVO vo);
	int inquiryUpdateHit(int id);
	List<InquiryVO> inquirySelectSearchList(String key, String val);
	List<InquiryVO> inquirySortList(String key);
}
