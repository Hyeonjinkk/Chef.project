package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class AjaxUserAlias implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO
		UserService userDao = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		request.setAttribute("users", userDao.selectAlias(vo)); 
		
		return "recipe/recieList";
	}

}
