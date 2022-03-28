package co.micol.prj.qna.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.micol.prj.comm.Command;
import co.micol.prj.qna.service.QnaService;
import co.micol.prj.qna.service.QnaVO;
import co.micol.prj.qna.serviceImpl.QnaServiceImpl;


public class AjaxQnaSearch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QnaService QnaDao = new QnaServiceImpl();
		String data = null;
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		
		List<QnaVO> list = QnaDao.qnaSelectSearchList(key, val);
		
		try {
			data = new ObjectMapper().writeValueAsString(list);  //json 객체로 변환 한다.
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println(data.toString());
		return "ajax:"+data;
	}

}
