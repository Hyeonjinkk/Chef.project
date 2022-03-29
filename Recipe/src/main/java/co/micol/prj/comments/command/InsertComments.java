package co.micol.prj.comments.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.border.service.BorderService;
import co.micol.prj.border.service.BorderVO;
import co.micol.prj.border.serviceImpl.BorderServiceImpl;
import co.micol.prj.comm.Command;
import co.micol.prj.comments.service.CommentsService;
import co.micol.prj.comments.service.CommentsVO;
import co.micol.prj.comments.serviceImpl.CommentsServiceImpl;
import co.micol.prj.inquiry.service.InquiryService;
import co.micol.prj.inquiry.service.InquiryVO;
import co.micol.prj.inquiry.serviceImpl.InquiryServiceImpl;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.service.NoticeVO;
import co.micol.prj.notice.serviceImpl.NoticeServiceImpl;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.service.RecipeVO;
import co.micol.prj.recipe.serviceImpl.ReicpeServiceImpl;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class InsertComments implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 레시피 댓글 등록 완료
		CommentsService commentsDao = new CommentsServiceImpl();
		HttpSession session = request.getSession();

		CommentsVO vo = new CommentsVO();

		vo.setComAlias((String) session.getAttribute("userAlias"));
		vo.setComDate(Date.valueOf(request.getParameter("comDate")));
		vo.setComCategory(Integer.parseInt(request.getParameter("comCategory")));
		vo.setComSeq(Integer.parseInt(request.getParameter("comSeq")));
		vo.setComContents(request.getParameter("comContents"));
		int result = commentsDao.insertComments(vo);

		if (result != 0) {
			switch (vo.getComCategory()) {
//			레시피 View
			case 1:
				request.setAttribute("recipeComments", "댓글이 성공적으로 등록되었습니다!");

				RecipeService recipeDao = new ReicpeServiceImpl();

				RecipeVO recipeVO = new RecipeVO();

				recipeVO.setRecipeSeq(vo.getComSeq());

				request.setAttribute("recipe", recipeDao.selectRecipe(recipeVO));

				break;
//			자유게시판 View
			case 2:
				request.setAttribute("noticeComments", "댓글이 성공적으로 등록되었습니다!");
				
				NoticeService noticeDao = new NoticeServiceImpl();
				
				NoticeVO noticeVO = new NoticeVO();
				
				noticeVO.setNoticeNo(vo.getComSeq());
				
				request.setAttribute("nt", noticeDao.noticeSelect(noticeVO));
				
				break;
//			Inquiry 게시판 View				
			case 3:
				request.setAttribute("inquiryComments",  "댓글이 성공적으로 등록되었습니다!");
				
				InquiryService inquiryDao = new InquiryServiceImpl();
				
				InquiryVO inquiryVO = new InquiryVO();
				
				
				inquiryVO.setInquiryNo(vo.getComSeq());
				
				
				request.setAttribute("iq", inquiryDao.inquirySelect(inquiryVO));
				
				break;
//			공지사항 게시판 View
			case 4:
				request.setAttribute("borderComments", "댓글이 성공적으로 등록되었습니다!");
				
				BorderService borderDao = new BorderServiceImpl();
				
				BorderVO borderVO = new BorderVO();
				
				borderVO.setBorderId(vo.getComSeq());
				
				request.setAttribute("border", borderDao.borderSelect(borderVO));
				
				break;
				
			case 5:
			}
			return "main/home";
		} else {

			return "";
		}
	}
}