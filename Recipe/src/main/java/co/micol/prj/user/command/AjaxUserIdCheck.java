package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class AjaxUserIdCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		UserService userDAO = new UserServiceImpl();
		String str = request.getParameter("str");
		boolean b = userDAO.isIdCheck(str);
		String result;
		
		if(!b) {
			result = "ajax:0";
		} else {
			result = "ajax:1";
		}
		return result;
	
	}

}
