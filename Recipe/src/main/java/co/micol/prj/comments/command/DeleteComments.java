package co.micol.prj.comments.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

public class DeleteComments implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 댓글 삭제
		CommentsService commentsDao = new CommentsServiceImpl();
		CommentsVO vo = new CommentsVO();
		vo.setComNo(Integer.parseInt(request.getParameter("comNo")));
		vo.setComCategory(Integer.parseInt(request.getParameter("comCategory")));
		vo.setComSeq(Integer.parseInt(request.getParameter("recipeSeq")));
		int result = commentsDao.deleteComments(vo);
		System.out.println(vo.getComNo());

		if (result != 0) {
			switch (vo.getComCategory()) {
			case 1:
				request.setAttribute("recipeComments", "댓글이 성공적으로 삭제되었습니다");

				RecipeService recipeDao = new ReicpeServiceImpl();

				RecipeVO recipeVO = new RecipeVO();

				recipeVO.setRecipeSeq(vo.getComSeq());

				request.setAttribute("recipe", recipeDao.selectRecipe(recipeVO));

				break;
//				자유게시판 View
			case 2:
				request.setAttribute("noticeComments", "댓글이 성공적으로 삭제되었습니다!");

				NoticeService noticeDao = new NoticeServiceImpl();

				NoticeVO noticeVO = new NoticeVO();

				noticeVO.setNoticeNo(vo.getComSeq());

				request.setAttribute("nt", noticeDao.noticeSelect(noticeVO));

				break;
//				Inquiry 게시판 View	
			case 3:
				request.setAttribute("inquiryComments", "댓글이 성공적으로 삭제되었습니다!");

				InquiryService inquiryDao = new InquiryServiceImpl();

				InquiryVO inquiryVO = new InquiryVO();

				inquiryVO.setInquiryNo(vo.getComSeq());

				request.setAttribute("iq", inquiryDao.inquirySelect(inquiryVO));

				break;
			case 4:
				
				request.setAttribute("borderComments", "댓글이 성공적으로 삭제되었습니다!");

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
