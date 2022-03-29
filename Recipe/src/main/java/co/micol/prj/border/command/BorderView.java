package co.micol.prj.border.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.border.service.BorderService;
import co.micol.prj.border.service.BorderVO;
import co.micol.prj.border.serviceImpl.BorderServiceImpl;
import co.micol.prj.comm.Command;
import co.micol.prj.comments.service.CommentsService;
import co.micol.prj.comments.serviceImpl.CommentsServiceImpl;

public class BorderView implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		BorderService borderDao = new BorderServiceImpl();
		BorderVO vo = new BorderVO();
		String borderId = request.getParameter("borderId").trim();
		vo.setBorderId(Integer.parseInt(borderId));
		
		CommentsService commentsDao = new CommentsServiceImpl();
		
		request.setAttribute("border", borderDao.borderSelect(vo));
		request.setAttribute("comments", commentsDao.selectCommentsList());
		borderDao.borderUpdateHit(vo.getBorderId()); // 조회수 증가
		return "border/borderView";
	}

}
