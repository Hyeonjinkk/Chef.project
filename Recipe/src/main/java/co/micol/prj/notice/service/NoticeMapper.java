package co.micol.prj.notice.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface NoticeMapper {
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	int noticeUpdateHit(int id);
	List<NoticeVO> noticeSelectSearchList(@Param("key")String key, @Param("val")String val);
	List<NoticeVO> noticeSortList(String key);
}
