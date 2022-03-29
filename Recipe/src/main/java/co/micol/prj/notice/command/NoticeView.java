package co.micol.prj.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.comments.service.CommentsService;
import co.micol.prj.comments.serviceImpl.CommentsServiceImpl;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.service.NoticeVO;
import co.micol.prj.notice.serviceImpl.NoticeServiceImpl;

public class NoticeView implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		NoticeService noticeDao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		
		CommentsService commentsDao = new CommentsServiceImpl();
		
		vo.setNoticeNo(Integer.parseInt(request.getParameter("noticeNo")));
		request.setAttribute("nt", noticeDao.noticeSelect(vo));
		
		request.setAttribute("comments", commentsDao.selectCommentsList());
		
		noticeDao.noticeUpdateHit(vo.getNoticeNo());
		return "notice/noticeView";
	}

}
