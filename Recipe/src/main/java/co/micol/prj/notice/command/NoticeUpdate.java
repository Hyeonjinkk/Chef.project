package co.micol.prj.notice.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.service.NoticeVO;
import co.micol.prj.notice.serviceImpl.NoticeServiceImpl;

public class NoticeUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		NoticeService noticeDao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		
		vo.setNoticeDate(Date.valueOf(request.getParameter("noticeDate")));
		vo.setUserAlias(request.getParameter("userAlias"));
		vo.setNoticeTitle(request.getParameter("noticeTitle"));
		vo.setNoticeContent(request.getParameter("noticeContent"));
		System.out.println(request.getParameter("userAlias"));
		System.out.println(request.getParameter("noticecontent"));
		int n = noticeDao.noticeUpdate(vo);
		
		if(n != 0) {
			return "noticeList.do";
		}else {
			request.setAttribute("message", "게시물이 등록되지 않았습니다.");
			return "notice/noticeError";
		}
	}

}
