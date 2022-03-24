package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class UserUpdateForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원정보수정폼 출력
		UserService userDAO = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setUserId(request.getParameter("userId"));
		request.setAttribute("mypage", userDAO.selectUser(vo));
		
		System.out.println(request.getParameter("userId"));
		System.out.println(vo);
		
		return "user/userUpdateForm";
	}

}
