package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class UserLogin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 처리
		UserService userDAO = new UserServiceImpl();
		UserVO vo = new UserVO();
		HttpSession session = request.getSession();	
		
		vo.setUserId(request.getParameter("userId"));
		vo.setUserPassword(request.getParameter("userPassword"));
		vo = userDAO.selectUser(vo);
		
		if(vo != null) {
			session.setAttribute("userId", vo.getUserId());
			session.setAttribute("userAlias", vo.getUserAlias());
			session.setAttribute("userAuthor", vo.getUserAuthor());
			session.setAttribute("userNo", vo.getUserNo());
			
			request.setAttribute("LoginMessage", vo.getUserAlias() + "님 환영합니다.");
		} else {
			request.setAttribute("LoginMessage", "아이디 또는 패스워드가 틀립니다.");
		}
		
		return "main/home";
	}

}
