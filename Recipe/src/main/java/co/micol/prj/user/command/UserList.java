package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class UserList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원리스트 출력
		UserService userDAO = new UserServiceImpl();
		request.setAttribute("users", userDAO.selectUserList());
		System.out.println(userDAO.selectUserList());
		return "user/userList";
	}

}
