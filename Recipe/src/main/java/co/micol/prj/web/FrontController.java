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

import co.micol.prj.basket.command.AjaxBasketInCheck;
import co.micol.prj.basket.command.DeleteAll;
import co.micol.prj.basket.command.DeleteIngrdnt;
import co.micol.prj.basket.command.InsertBasket;
import co.micol.prj.basket.command.MyBasketList;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.micol.prj.border.command.AjaxBorderSearch;
import co.micol.prj.border.command.AjaxSortBorder;
import co.micol.prj.border.command.BorderDelete;
import co.micol.prj.border.command.BorderInsert;
import co.micol.prj.border.command.BorderInsertForm;
import co.micol.prj.border.command.BorderList;
import co.micol.prj.border.command.BorderUpdate;
import co.micol.prj.border.command.BorderView;
import co.micol.prj.border.service.BorderService;
import co.micol.prj.border.service.PagingVO;
import co.micol.prj.border.serviceImpl.BorderServiceImpl;
import co.micol.prj.comm.Command;
import co.micol.prj.comments.command.DeleteComments;
import co.micol.prj.comments.command.InsertComments;
import co.micol.prj.comments.command.UpdateComments;
import co.micol.prj.inquiry.command.AjaxInquirySearch;
import co.micol.prj.inquiry.command.AjaxSortInquiry;
import co.micol.prj.inquiry.command.InquiryDelete;
import co.micol.prj.inquiry.command.InquiryInsert;
import co.micol.prj.inquiry.command.InquiryInsertForm;
import co.micol.prj.inquiry.command.InquiryList;
import co.micol.prj.inquiry.command.InquiryUpdate;
import co.micol.prj.inquiry.command.InquiryUpdateForm;
import co.micol.prj.inquiry.command.InquiryView;
import co.micol.prj.main.command.HomeCommand;
import co.micol.prj.notice.command.AjaxNoticeSearch;
import co.micol.prj.notice.command.AjaxSortNotice;
import co.micol.prj.notice.command.NoticeDelete;
import co.micol.prj.notice.command.NoticeInsert;
import co.micol.prj.notice.command.NoticeInsertForm;
import co.micol.prj.notice.command.NoticeList;
import co.micol.prj.notice.command.NoticeUpdate;
import co.micol.prj.notice.command.NoticeUpdateForm;
import co.micol.prj.notice.command.NoticeView;
import co.micol.prj.qna.command.AjaxQnaSearch;
import co.micol.prj.qna.command.QnaList;
import co.micol.prj.qna.command.qnaDelete;
import co.micol.prj.qna.command.qnaInsert;
import co.micol.prj.qna.command.qnaInsertForm;
import co.micol.prj.question.command.AjaxQuestionSearch;
import co.micol.prj.question.command.AjaxSortQuestion;
import co.micol.prj.question.command.QuestionDelete;
import co.micol.prj.question.command.QuestionInsert;
import co.micol.prj.question.command.QuestionInsertForm;
import co.micol.prj.question.command.QuestionList;
import co.micol.prj.question.command.QuestionUpdate;
import co.micol.prj.question.command.QuestionView;
import co.micol.prj.recipe.command.DeleteRecipe;
import co.micol.prj.recipe.command.RecipeInsert;
import co.micol.prj.recipe.command.RecipeInsertForm;
import co.micol.prj.recipe.command.RecipeList;
import co.micol.prj.recipe.command.RecipeUpdate;
import co.micol.prj.recipe.command.RecipeView;
import co.micol.prj.recipe.command.SearchBkRecipe;
import co.micol.prj.recipe.command.UpdateRecipeForm;
import co.micol.prj.subscribe.command.FollowerList;
import co.micol.prj.subscribe.command.FollowingList;
import co.micol.prj.subscribe.command.Unfollowing;
import co.micol.prj.user.command.AdminDeleteUser;
import co.micol.prj.user.command.AjaxUserIdCheck;
import co.micol.prj.user.command.AjaxUserOldPwdCheck;
import co.micol.prj.user.command.DeleteUser;
import co.micol.prj.user.command.UpdatePwd;
import co.micol.prj.user.command.UpdateUserInfo;
import co.micol.prj.user.command.UserJoin;
import co.micol.prj.user.command.UserJoinForm;
import co.micol.prj.user.command.UserList;
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
//--------------------------------------		Page 처리
		map.put("/home.do", new HomeCommand()); // 처음 들어오는 페이지

		map.put("/userJoinForm.do", new UserJoinForm()); // 회원가입폼 호출


		map.put("/qnaList.do", new QnaList()); // 자주듣는 질문 페이지 호출

////-------------------------------------- -------------------------------------- 기능처리(user)
		map.put("/userJoin.do", new UserJoin()); // 회원가입 처리
		map.put("/ajaxUserIdCheck.do", new AjaxUserIdCheck()); // 아이디 중복체크
		map.put("/userLoginForm.do", new UserLoginForm()); // 로그인폼 호출
		map.put("/userLogin.do", new UserLogin()); // 로그인 처리
		map.put("/userLogout.do", new UserLogout()); // 로그아웃 처리
		map.put("/userMypage.do", new UserMypage()); // 마이페이지 출력
		map.put("/userUpdateForm.do", new UserUpdateForm()); // 회원정보수정폼 출력
		map.put("/ajaxUserOldPwdCheck.do", new AjaxUserOldPwdCheck()); // 패스워드 변경 시 패스워드 재확인
		map.put("/updatePwd.do", new UpdatePwd()); // 패스워드 변경
		map.put("/updateUserInfo.do", new UpdateUserInfo()); // 회원정보 변경 처리
		map.put("/deleteUser.do", new DeleteUser()); //회원탈퇴 처리
		map.put("/userList.do", new UserList()); //관리자용 회원리스트 호출
		map.put("/adminDeleteUser.do", new AdminDeleteUser()); //관리자용 회원삭제 처리

////--------------------------------------	기능처리(border)			
		map.put("/borderInsert.do", new BorderInsert()); // 공지사항 등록
		map.put("/borderUpdate.do", new BorderUpdate()); // 공지사항 수정
		map.put("/borderDelete.do", new BorderDelete()); // 공지사항 삭제

		map.put("/borderInsertForm.do", new BorderInsertForm()); // 공지사항 작성폼 호출
		map.put("/borderList.do", new BorderList()); // 공지사항목록 보기
		map.put("/borderView.do", new BorderView()); // 공지사항 상세보기
		map.put("/ajaxBorderSearch.do", new AjaxBorderSearch()); // 공지사항 리스트에서 검색
		map.put("/ajaxSortBorder.do", new AjaxSortBorder()); // 공지사항 정렬
		//map.put("/borderListPaging.do", new BorderListPaging()); // 공지사항 목록
////--------------------------------------		기능처리(notice) - 자유게시판
		map.put("/noticeList.do", new NoticeList()); // 목록
		map.put("/noticeInsertForm.do", new NoticeInsertForm()); // 작성폼 호출
		map.put("/noticeInsert.do", new NoticeInsert()); // 게시물 등록
		map.put("/noticeUpdateForm.do", new NoticeUpdateForm()); // 게시물 수정폼
		map.put("/noticeUpdate.do", new NoticeUpdate()); // 게시물 수정
		map.put("/noticeDelete.do", new NoticeDelete()); // 게시물 삭제
		map.put("/noticeView.do", new NoticeView()); // 게시물 보기
		map.put("/ajaxNoticeSearch.do", new AjaxNoticeSearch()); // 검색
		map.put("/ajaxSortNotice.do", new AjaxSortNotice()); // 정렬

////--------------------------------------		기능처리(inquiry) - 레시피/재료 문의게시판
		map.put("/inquiryList.do", 			new InquiryList()); // 목록
		map.put("/inquiryInsertForm.do", 	new InquiryInsertForm()); // 등록 폼
		map.put("/inquiryInsert.do", 		new InquiryInsert()); // 등록
		map.put("/inquiryView.do", 			new InquiryView()); // 보기
		map.put("/inquiryUpdateForm.do", 	new InquiryUpdateForm()); // 수정폼
		map.put("/inquiryUpdate.do", 		new InquiryUpdate()); // 수정
		map.put("/inquiryDelete.do", 		new InquiryDelete()); // 삭제
		
		map.put("/ajaxInquirySearch.do", new AjaxInquirySearch()); // 검색
		map.put("/ajaxSortInquiry.do", new AjaxSortInquiry()); // 정렬

////--------------------------------------		기능처리(recipe) - 레시피
		map.put("/recipeList.do", new RecipeList()); // 레시피 페이지
		map.put("/recipeView.do", new RecipeView()); // 레시피 상세 과정 보기
		map.put("/recipeInsertForm.do", new RecipeInsertForm()); // 레시피 등록 페이지
		map.put("/recipeInsert.do", new RecipeInsert()); // 레시피 등록처리
		map.put("/updateRecipeForm.do", new UpdateRecipeForm()); // 레시피 수정폼
		map.put("/recipeUpdate.do", new RecipeUpdate()); // 레시피 수정처리
		map.put("/deleteRecipe.do", new DeleteRecipe()); // 레시피 삭제처리

////--------------------------------------		기능처리(QnA)
		map.put("/qnaInsertForm.do", new qnaInsertForm()); // QnA 작성폼 호출
		map.put("/qnaInsert.do", new qnaInsert()); // QnA 등록
		map.put("/qnaDelete.do", new qnaDelete()); // QNA 삭제
		map.put("/ajaxQnaSearch.do", new AjaxQnaSearch()); // 검색
		
//		기능처리(질문&답변)
		map.put("/questionList.do", new QuestionList()); // 질문 리스트
		map.put("/questionInsert.do", new QuestionInsert()); // 공지사항 등록
		map.put("/questionUpdate.do", new QuestionUpdate()); // 공지사항 수정
		map.put("/questionDelete.do", new QuestionDelete()); // 공지사항 삭제
		map.put("/ajaxQuestionSearch.do", new AjaxQuestionSearch()); // 공지사항 리스트에서 검색
		map.put("/ajaxSortQuestion.do", new AjaxSortQuestion()); // 공지사항 정렬
		map.put("/questionInsertForm.do", new QuestionInsertForm()); // 공지사항 작성폼 호출
		map.put("/questionView.do", new QuestionView()); // 공지사항 상세보기
		
////--------------------------------------		댓글처리(comments)
		map.put("/insertComments.do", new InsertComments()); // 댓글 등록
		map.put("/updateComments.do", new UpdateComments()); // 댓글 수정
		map.put("/deleteComments.do", new DeleteComments()); // 댓글 삭제

////--------------------------------------		기능처리(Subscribe) - 팔로잉/팔로워 기능
		map.put("/followingList.do", new FollowingList()); //구독한 유저 리스트 출력
		map.put("/followerList.do", new FollowerList());   //나를 구독하는 유저 리스트 출력
		map.put("/unfollowing.do", new Unfollowing());     //구독취소 처리

////--------------------------------------		기능처리(basket) - 나의 냉장고 
		map.put("/myBasketList.do", new MyBasketList());  //나의 냉장고 리스트 출력
		map.put("/insertBasket.do", new InsertBasket());  //냉장고에 식재료 입력 처리
		map.put("/ajaxBasketInCheck.do", new AjaxBasketInCheck()); //냉장고 재료 중복체크
		map.put("/deleteAll.do", new DeleteAll()); //냉장고 전체 비우기
		map.put("/deleteIngrdnt.do", new DeleteIngrdnt()); //냉장고 재료 선택 삭제
		map.put("/searchBkRecipe.do", new SearchBkRecipe());   //냉장고 레시피 검색
		
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
