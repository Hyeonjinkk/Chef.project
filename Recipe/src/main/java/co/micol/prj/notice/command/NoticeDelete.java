package co.micol.prj.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.service.NoticeVO;
import co.micol.prj.notice.serviceImpl.NoticeServiceImpl;

public class NoticeDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		NoticeService noticeDao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		
		vo.setNoticeNo(Integer.parseInt(request.getParameter("noticeNo")));
		
		int n = noticeDao.noticeDelete(vo);
		
		if(n != 0) {
			return "noticeList.do";
		}else {
			request.setAttribute("message", "삭제가 정상적으로 이루어지지 않았습니다.");
			return "notice/noticeList";
		}
	}

}
