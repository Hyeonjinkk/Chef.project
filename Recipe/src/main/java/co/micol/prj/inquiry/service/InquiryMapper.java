package co.micol.prj.inquiry.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface InquiryMapper {
	List<InquiryVO> inquirySelectList();
	InquiryVO inquirySelect(InquiryVO vo);
	int inquiryInsert(InquiryVO vo);
	int inquiryUpdate(InquiryVO vo);
	int inquiryDelete(InquiryVO vo);
	int inquiryUpdateHit(int id);
	List<InquiryVO> inquirySelectSearchList(@Param("key")String key, @Param("val")String val);
	List<InquiryVO> inquirySortList(String key);
}
