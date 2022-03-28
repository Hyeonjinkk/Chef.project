package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class UserJoin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원가입 처리

		UserService userDAO = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setUserId(request.getParameter("userId"));
		vo.setUserPassword(request.getParameter("userPassword"));
		vo.setUserName(request.getParameter("userName"));
		vo.setUserAlias(request.getParameter("userAlias"));
		vo.setUserTel(request.getParameter("userTel"));
		vo.setUserAddress(request.getParameter("userAddress"));
		int n = userDAO.insertUser(vo);
		if (n != 0) {
			request.setAttribute("message", "냉장고를 부탁해의 회원이 되신 것을 환영합니다.");
		} else {
			request.setAttribute("message", "회원가입이 정상적으로 이루어지지 않았습니다.");
		}
		return "user/userJoin";
	}

}
