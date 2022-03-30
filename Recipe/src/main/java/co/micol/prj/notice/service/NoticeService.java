package co.micol.prj.notice.service;

import java.util.List;

public interface NoticeService {
	
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	int noticeUpdateHit(int id);
	List<NoticeVO> noticeSelectSearchList(String key, String val);
	List<NoticeVO> noticeSortList(String key);
	
//	notice 게시물 수
	int noticeCount();
}
