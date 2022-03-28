package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class AjaxUserOldPwdCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 기존 패스워드 체크
		 UserService userDAO = new UserServiceImpl(); 
		 UserVO vo = new UserVO();
		 HttpSession session = request.getSession();
		 
		 vo.setUserId((String)session.getAttribute("userId"));
		 
		 String pwd = userDAO.pwCheck(vo);
		 String oldPwd = request.getParameter("str");
		 String result;
		 
		 if(pwd.equals(oldPwd)) {
			 System.out.println("비번일치");
			 result = "ajax:true";
		 } else {
			 System.out.println("비번불일치");
			 result = "ajax:false";
		 }
		 			
		return result;
	}

}
