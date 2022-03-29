package co.micol.prj.question.command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.question.service.QuestionService;
import co.micol.prj.question.service.QuestionVO;
import co.micol.prj.question.serviceImpl.QuestionServiceImpl;
import co.micol.prj.comm.Command;


public class QuestionDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
				QuestionService questionDao = new QuestionServiceImpl();
				QuestionVO vo = new QuestionVO();
				System.out.println(Integer.parseInt(request.getParameter("questionId")));
				vo.setQuestionId(Integer.parseInt(request.getParameter("questionId")));
				
				int n = questionDao.questionDelete(vo);
				if(n != 0) {
					return "questionList.do";
				}else {
					request.setAttribute("message", "삭제가 정상적으로 이루어지지 않았다.");
					return "question/questionList";
				}	
			}
		}
