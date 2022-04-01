package co.micol.prj.qna.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.qna.service.QnaService;
import co.micol.prj.qna.service.QnaVO;
import co.micol.prj.qna.serviceImpl.QnaServiceImpl;

public class qnaDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QnaService qnaDao = new QnaServiceImpl();
		QnaVO vo = new QnaVO();
		System.out.println(request.getParameter("qnaNo"));
		vo.setQnaNo(Integer.parseInt(request.getParameter("qnaNo")));
		
		int n = qnaDao.qnaDelete(vo);
		System.out.println(n);
		if(n != 0) {
			return "qnaList.do";
		}else {
			request.setAttribute("message", "삭제가 정상적으로 이루어지지 않았습니다.");
			return "qna/qnaList";
		}
	}

}
