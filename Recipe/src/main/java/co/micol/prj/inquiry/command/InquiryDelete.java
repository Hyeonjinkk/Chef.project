package co.micol.prj.inquiry.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.inquiry.service.InquiryService;
import co.micol.prj.inquiry.service.InquiryVO;
import co.micol.prj.inquiry.serviceImpl.InquiryServiceImpl;

public class InquiryDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		InquiryService inquiryDao = new InquiryServiceImpl();
		InquiryVO vo = new InquiryVO();
		
		vo.setInquiryNo(Integer.parseInt(request.getParameter("inquiryNo")));
		
		int n = inquiryDao.inquiryDelete(vo);
		
		if(n != 0) {
			return "inquiryList.do";
		}else {
			request.setAttribute("message", "삭제가 정상적으로 이루어지지 않았습니다.");
			return "inquiry/inquiryError";
		}
	}

}
