package co.micol.prj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;

public class UserLogout implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 로그아웃 처리
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userAuthor");
		session.removeAttribute("userAlias");
		session.removeAttribute("userNo");
		session.invalidate(); // 세션삭제
		
		request.setAttribute("message", "정상적으로 로그아웃되었습니다.");
		
		return "main/home";
	}

}
