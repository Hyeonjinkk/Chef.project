package co.micol.prj.inquiry.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.inquiry.service.InquiryService;
import co.micol.prj.inquiry.service.InquiryVO;
import co.micol.prj.inquiry.serviceImpl.InquiryServiceImpl;

public class InquiryUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		InquiryService inquiryDao = new InquiryServiceImpl();
		InquiryVO vo = new InquiryVO();
		
		vo.setUserAlias(request.getParameter("userAlias"));
		vo.setInquiryTitle(request.getParameter("inquiryTitle"));
		vo.setInquiryDate(Date.valueOf(request.getParameter("inquiryDate")));
		vo.setInquiryContent(request.getParameter("inquiryContent"));
		vo.setInquiryCategory(request.getParameter("inquiryCategory"));
		vo.setInquiryImage1(request.getParameter("inquiryImage1"));
		vo.setInquiryImage1(request.getParameter("inquiryImage2"));
		vo.setInquiryImage1(request.getParameter("inquiryImage3"));
		
		int n = inquiryDao.inquiryUpdate(vo);
		
		if(n != 0) {
			return "inquiryList.do";
		}else {
			request.setAttribute("message", "게시물이 등록되지 않았습니다.");
			return "inquiry/inquiryError";
		}
	}

}
