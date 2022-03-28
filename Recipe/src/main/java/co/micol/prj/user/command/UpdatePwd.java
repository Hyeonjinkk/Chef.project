package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class UpdatePwd implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 패스워드 변경 처리
		
		  UserService userDAO = new UserServiceImpl(); 
		  UserVO vo = new UserVO();
		  HttpSession session = request.getSession();
		  
		  vo.setUserId(request.getParameter("userId"));
		  vo.setUserPassword(request.getParameter("userPassword"));

		  int n = userDAO.updateUser(vo);
		  System.out.println(n);
		  if(n != 0) { 
			  session.removeAttribute("userId");
			  session.removeAttribute("userAuthor"); 
			  session.removeAttribute("userAlias");
			  session.invalidate(); // 세션삭제 
			  
			  request.setAttribute("message", "패스워드가 변경되었습니다. 변경된 패스워드로 다시 로그인 해주시기 바랍니다."); 
			  
			  
		  } 
		  	else {
		  	  request.setAttribute("message", "정상적으로 변경 처리되지 않았습니다."); 
		  	  
		  	}
		 
		
		return "user/userLogin";
	
	}

}
