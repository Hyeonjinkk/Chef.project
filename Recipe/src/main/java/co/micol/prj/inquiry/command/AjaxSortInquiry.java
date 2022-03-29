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

public class AjaxSortInquiry implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		InquiryService inquiryDao = new InquiryServiceImpl();
		String key = request.getParameter("key");
		
		List<InquiryVO> list = inquiryDao.inquirySortList(key);
		String data = null;
		
		try {
			data = new ObjectMapper().writeValueAsString(list);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + data;
	}

}
