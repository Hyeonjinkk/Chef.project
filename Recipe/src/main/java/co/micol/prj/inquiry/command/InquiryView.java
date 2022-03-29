package co.micol.prj.inquiry.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.inquiry.service.InquiryService;
import co.micol.prj.inquiry.service.InquiryVO;
import co.micol.prj.inquiry.serviceImpl.InquiryServiceImpl;

public class InquiryView implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		InquiryService inquiryDao = new InquiryServiceImpl();
		InquiryVO vo = new InquiryVO();
		
		vo.setInquiryNo(Integer.parseInt(request.getParameter("inquiryNo")));
		request.setAttribute("iq", inquiryDao.inquirySelect(vo));
		
		inquiryDao.inquiryUpdateHit(vo.getInquiryNo());
		
		return "inquiry/inquiryView";
	}

}
