package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class AdminDeleteUser implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 관리자용 회원 삭제 처리
		UserService userDAO = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setUserId(request.getParameter("userId"));
		int n = userDAO.deleteUser(vo);
		System.out.println(n);
		if (n != 0) {
			return "userList.do";
		} else {			
			return "user/userList";
		}
	}

}
