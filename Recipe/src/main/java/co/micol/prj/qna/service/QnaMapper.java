package co.micol.prj.qna.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface QnaMapper {

	List<QnaVO> qnaSelectList();
	QnaVO qnaSelect(QnaVO vo);
	int qnaInsert(QnaVO vo);
	int qnaUpdate(QnaVO vo);
	int qnaDelete(QnaVO vo);
	int qnaUpdateHit(int id);
	List<QnaVO> qnaSelectSearchList(@Param("key") String key, @Param("val") String val); //검색할 항목, 검색할 내용
	List<QnaVO> qnaSortList(String key);
}