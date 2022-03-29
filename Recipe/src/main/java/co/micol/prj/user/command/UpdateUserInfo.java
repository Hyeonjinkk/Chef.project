package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class UpdateUserInfo implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원정보 변경 처리
		UserService userDAO = new UserServiceImpl();
		UserVO vo = new UserVO();
		
		vo.setUserId(request.getParameter("userId"));
		vo.setUserAlias(request.getParameter("userAlias"));
		vo.setUserAddress(request.getParameter("userAddress"));
		vo.setUserTel(request.getParameter("userTel"));
		
		int n = userDAO.updateUser(vo);
		
		if(n != 0) {
			return "userUpdateForm.do";
		} else {
			request.setAttribute("message", "회원정보가 정상적으로 변경되지 않았습니다. 다시 시도해주시기 바랍니다." );
		}
		return "user/userLogin";
	}

}
