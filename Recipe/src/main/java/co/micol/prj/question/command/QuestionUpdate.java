package co.micol.prj.question.command;



import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.question.service.QuestionService;
import co.micol.prj.question.service.QuestionVO;
import co.micol.prj.question.serviceImpl.QuestionServiceImpl;
import co.micol.prj.comm.Command;

public class QuestionUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		QuestionService questionDao = new QuestionServiceImpl();
		QuestionVO vo = new QuestionVO();
		System.out.println(request.getParameter("questionDate"));
		System.out.println(request.getParameter("questionId"));
		System.out.println(Integer.parseInt(request.getParameter("questionId")));
		vo.setQuestionId(Integer.parseInt(request.getParameter("questionId")));
		vo.setUserAlias(request.getParameter("userAlias"));
		vo.setQuestionDate(Date.valueOf(request.getParameter("questionDate")));
		vo.setQuestionTitle(request.getParameter("questionTitle"));
		vo.setQuestionContents(request.getParameter("questionContents"));
		int n = questionDao.questionUpdate(vo);
		System.out.println(n);
		if(n != 0 ) {
			return "questionList.do";
		}else {
			request.setAttribute("message", "게시글 등록이 실패했습니다.");
			return "question/questionError";
		}
		
		
	}

}
