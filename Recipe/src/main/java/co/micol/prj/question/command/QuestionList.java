package co.micol.prj.question.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.question.service.QuestionService;
import co.micol.prj.question.serviceImpl.QuestionServiceImpl;
import co.micol.prj.comm.Command;

public class QuestionList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		QuestionService questionDao = new QuestionServiceImpl();
		request.setAttribute("questions", questionDao.questionSelectList());
		
		return "question/questionList";
	}

}