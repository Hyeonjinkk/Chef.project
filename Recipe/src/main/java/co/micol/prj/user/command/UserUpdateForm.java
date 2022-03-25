package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
		vo.setUserId((String) session.getAttribute("userId"));
		vo = userDAO.selectUser(vo);
		
		if (vo != null) {
			session.setAttribute("userPassword", vo.getUserPassword());
			session.setAttribute("userName", vo.getUserName());
			session.setAttribute("userAlias", vo.getUserAlias());
			session.setAttribute("userAddress", vo.getUserAddress());
			session.setAttribute("userTel", vo.getUserTel());
			request.setAttribute("message", "회원정보수정");
		} else {
			request.setAttribute("message", "회원정보수정 화면을 불러오지 못하였습니다. 다시 시도해 주세요.");
		}

		return "user/userUpdateForm";
	}

}
