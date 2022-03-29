package co.micol.prj.question.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.micol.prj.question.service.QuestionService;
import co.micol.prj.question.service.QuestionVO;
import co.micol.prj.question.serviceImpl.QuestionServiceImpl;
import co.micol.prj.comm.Command;


public class AjaxSortQuestion implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QuestionService questionDao = new QuestionServiceImpl();
		

		String key = request.getParameter("key");
				
		List<QuestionVO> list = questionDao.questionSortList(key);
		String data = null;
		try {
			data = new ObjectMapper().writeValueAsString(list);  //json 객체로 변환 한다.
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println(data.toString());
		return "ajax:"+data;

	}

}
