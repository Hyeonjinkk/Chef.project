package co.micol.prj.inquiry.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.micol.prj.comm.Command;
import co.micol.prj.inquiry.service.InquiryService;
import co.micol.prj.inquiry.service.InquiryVO;
import co.micol.prj.inquiry.serviceImpl.InquiryServiceImpl;

public class AjaxInquirySearch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		InquiryService inquiryDao = new InquiryServiceImpl();
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		
		List<InquiryVO> list = inquiryDao.inquirySelectSearchList(key, val);
		String data = null;
		
		try {
			data = new ObjectMapper().writeValueAsString(list);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + data;
	}

}
