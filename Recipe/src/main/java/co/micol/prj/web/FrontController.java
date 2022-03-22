package co.micol.prj.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.border.command.BorderList;
import co.micol.prj.comm.Command;
import co.micol.prj.main.command.HomeCommand;
import co.micol.prj.user.command.AjaxUserIdCheck;
import co.micol.prj.user.command.UserJoin;
import co.micol.prj.user.command.UserJoinForm;



@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		map.put("/home.do", new HomeCommand()); // 첫 페이지
		map.put("/borderList.do", new BorderList()); //공지사항 목록
		
		
		
		map.put("/userJoinForm.do", new UserJoinForm()); //회원가입폼 호출
		map.put("/ajaxUserIdCheck.do", new AjaxUserIdCheck()); //아이디 중복체크
		map.put("/userJoin.do", new UserJoin());    //회원가입 처리
	}  

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length());

		Command comm = map.get(page);
		String viewPage = comm.exec(request, response);

		if (!viewPage.endsWith(".do")) {
			if (viewPage.startsWith("ajax:")) {
				// aJax 처리
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(viewPage.substring(5)); // ajax: 총 5글자
				return;
			} else {
				// viewPage = "WEB-INF/views/" + viewPage + ".jsp";
				viewPage = viewPage + ".tiles";
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
