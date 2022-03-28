package co.micol.prj.qna.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.qna.service.QnaService;
import co.micol.prj.qna.service.QnaVO;
import co.micol.prj.qna.serviceImpl.QnaServiceImpl;

public class qnaInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		QnaService qnaDao = new QnaServiceImpl();
		QnaVO vo = new QnaVO();
		System.out.println();
		vo.setQnaTitle(request.getParameter("qnaTitle"));
		vo.setQnaContents(request.getParameter("qnaContents"));
		int n = qnaDao.qnaInsert(vo);

		
		if(n != 0 ) {
			return "qnaList.do";
		}else {
			request.setAttribute("message", "게시글 등록이 실패했습니다.");
			return "qna/qnaError";
		}
		
		
	}

}
		