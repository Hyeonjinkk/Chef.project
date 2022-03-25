package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class UserMypage implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 마이페이지 출력
		UserService userDAO = new UserServiceImpl();
		UserVO vo = new UserVO();
		HttpSession session = request.getSession();
		vo.setUserId((String)session.getAttribute("userId"));
		vo = userDAO.selectUser(vo);
		
		if(vo != null) {
			session.setAttribute("userId", session.getAttribute("userId"));
			request.setAttribute("message", vo.getUserAlias() + "님의 마이페이지");
		} else {
			request.setAttribute("message", "로그인이 필요한 서비스입니다.");
		}
		
		return "user/mypage";
	}

}
