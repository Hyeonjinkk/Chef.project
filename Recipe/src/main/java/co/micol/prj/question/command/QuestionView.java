package co.micol.prj.question.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.question.service.QuestionService;
import co.micol.prj.question.service.QuestionVO;
import co.micol.prj.question.serviceImpl.QuestionServiceImpl;
import co.micol.prj.comm.Command;

public class QuestionView implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QuestionService questionDao = new QuestionServiceImpl();
		QuestionVO vo = new QuestionVO();
		String questionId = request.getParameter("questionId").trim();
		vo.setQuestionId(Integer.parseInt(questionId));
		request.setAttribute("question", questionDao.questionSelect(vo));
		questionDao.questionUpdateHit(vo.getQuestionId()); // 조회수 증가
		return "question/questionView";
	}

}
