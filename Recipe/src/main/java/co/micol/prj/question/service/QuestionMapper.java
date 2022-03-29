package co.micol.prj.question.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface QuestionMapper {

	List<QuestionVO> questionSelectList();
	QuestionVO questionSelect(QuestionVO vo);
	int questionInsert(QuestionVO vo);
	int questionUpdate(QuestionVO vo);
	int questionDelete(QuestionVO vo);
	int questionUpdateHit(int id);
	List<QuestionVO> questionSelectSearchList(@Param("key") String key, @Param("val") String val); //검색할 항목, 검색할 내용
	List<QuestionVO> questionSortList(String key);
}