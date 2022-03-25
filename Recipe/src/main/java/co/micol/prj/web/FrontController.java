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

import co.micol.prj.border.command.AjaxBorderSearch;
import co.micol.prj.border.command.AjaxSortBorder;
import co.micol.prj.border.command.BorderDelete;
import co.micol.prj.border.command.BorderInsert;
import co.micol.prj.border.command.BorderInsertForm;
import co.micol.prj.border.command.BorderList;
import co.micol.prj.border.command.BorderUpdate;
import co.micol.prj.border.command.BorderView;
import co.micol.prj.comm.Command;
import co.micol.prj.main.command.HomeCommand;
import co.micol.prj.notice.command.AjaxNoticeSearch;
import co.micol.prj.notice.command.AjaxSortNotice;
import co.micol.prj.notice.command.NoticeInsert;
import co.micol.prj.notice.command.NoticeInsertForm;
import co.micol.prj.notice.command.NoticeList;
import co.micol.prj.qna.command.QnaList;

import co.micol.prj.recipe.command.RecipeList;

import co.micol.prj.notice.command.NoticeView;
import co.micol.prj.user.command.AjaxUserIdCheck;
import co.micol.prj.user.command.UserJoin;
import co.micol.prj.user.command.UserJoinForm;
import co.micol.prj.user.command.UserLogin;
import co.micol.prj.user.command.UserLoginForm;
import co.micol.prj.user.command.UserLogout;
import co.micol.prj.user.command.UserMypage;
import co.micol.prj.user.command.UserUpdateForm;

@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init(ServletConfig config) throws ServletException {
//		Page 처리
		map.put("/home.do", new HomeCommand()); // 처음 들어오는 페이지

		map.put("/userJoinForm.do", new UserJoinForm()); // 회원가입폼 호출
		
		map.put("/borderInsertForm.do", new BorderInsertForm()); // 공지사항 작성폼 호출
		map.put("/borderList.do", new BorderList()); // 공지사항목록 보기
		map.put("/borderView.do", new BorderView()); // 공지사항 상세보기
		
		map.put("/qnaList.do", new QnaList()); //자주듣는 질문 페이지 호출
		map.put("/recipeList.do", new RecipeList()); // 레시피 페이지
		
		
		
//		기능처리(user)
		map.put("/userJoin.do", new UserJoin()); // 회원가입 처리
		map.put("/ajaxUserIdCheck.do", new AjaxUserIdCheck()); // 아이디 중복체크
		map.put("/userLoginForm.do", new UserLoginForm()); //로그인폼 호출
		map.put("/userLogin.do", new UserLogin()); //로그인 처리
		map.put("/userLogout.do", new UserLogout()); //로그아웃 처리
		map.put("/userMypage.do", new UserMypage()); //마이페이지 출력
		map.put("/userUpdateForm.do", new UserUpdateForm()); //회원정보수정폼 출력
		
		
		

//		기능처리(border)			
		map.put("/borderInsert.do", new BorderInsert()); // 공지사항 등록
		map.put("/borderUpdate.do", new BorderUpdate()); // 공지사항 수정
		map.put("/borderDelete.do", new BorderDelete()); // 공지사항 삭제
		map.put("/ajaxBorderSearch.do", new AjaxBorderSearch()); // 공지사항 리스트에서 검색
		map.put("/ajaxSortBorder.do", new AjaxSortBorder()); // 공지사항 정렬
		
		
//		기능처리(notice) - 자유게시판
		map.put("/noticeList.do", new NoticeList()); // 목록
		map.put("/noticeInsertForm.do", new NoticeInsertForm()); // 작성폼 호출
		map.put("/noticeInsert.do", new NoticeInsert()); // 게시물 등록
		map.put("/noticeView.do", new NoticeView()); // 게시물 보기
		map.put("/ajaxNoticeSearch.do", new AjaxNoticeSearch()); // 검색
		map.put("/ajaxSortNotice.do", new AjaxSortNotice()); // 정렬
		
		

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
				// ajax 처리
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(viewPage.substring(5));
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
