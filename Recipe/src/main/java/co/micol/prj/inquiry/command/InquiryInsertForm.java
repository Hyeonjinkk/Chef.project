package co.micol.prj.inquiry.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.inquiry.service.InquiryService;
import co.micol.prj.inquiry.serviceImpl.InquiryServiceImpl;

public class InquiryInsertForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		return "inquiry/inquiryInsertForm";
	}

}
