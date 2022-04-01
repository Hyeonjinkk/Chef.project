package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class DeleteUser implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원탈퇴 처리
		UserService userDAO = new UserServiceImpl();
		UserVO vo = new UserVO();
		HttpSession session = request.getSession();

		vo.setUserId((String) session.getAttribute("userId"));
		int n = userDAO.deleteUser(vo);

		if (n != 0) {
			session.removeAttribute("userId");
			session.removeAttribute("userAuthor");
			session.removeAttribute("userAlias");
			session.invalidate(); // 세션삭제
			request.setAttribute("message", "탈퇴가 정상적으로 처리되었습니다.");
		} else {
			request.setAttribute("message", "정상적으로 처리되지 않았습니다.");
		}

		return "home.do";
	}

}
