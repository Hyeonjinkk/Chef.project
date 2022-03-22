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
		// 회원가입
		
		UserService userDAO = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setUserId(request.getParameter("user_id"));
		vo.setUserPassword(request.getParameter("user_password"));
		vo.setUserName(request.getParameter("user_name"));
		vo.setUserAlias(request.getParameter("user_alias"));
		vo.setUserTel(request.getParameter("user_tel"));
		vo.setUserAddress(request.getParameter("user_address"));
		int n = userDAO.insertUser(vo);
		if(n != 0) {
			request.setAttribute("message", "냉장고를 부탁해의 회원이 되신 것을 환영합니다.");
		} else {
			request.setAttribute("messaget", "회원가입이 정상적으로 이루어지지 않았습니다.");
		}
		return "user/userJoin";
	}

}
