package co.micol.prj.question.service;

import java.util.List;

public interface QuestionService {

	List<QuestionVO> questionSelectList();
	QuestionVO questionSelect(QuestionVO vo);
	int questionInsert(QuestionVO vo);
	int questionUpdate(QuestionVO vo);
	int questionDelete(QuestionVO vo);
	int questionUpdateHit(int id);
	List<QuestionVO> questionSelectSearchList(String key, String val); //검색할 항목, 검색할 내용
	List<QuestionVO> questionSortList(String key);
	
}
