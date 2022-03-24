package co.micol.prj.qna.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.qna.service.QnaService;
import co.micol.prj.qna.serviceImpl.QnaServiceImpl;
import co.micol.prj.comm.Command;

public class QnaList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		QnaService qnaDao = new QnaServiceImpl();
		request.setAttribute("qnas", qnaDao.qnaSelectList());
		
		return "qna/qnaList";
	}

}