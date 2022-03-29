package co.micol.prj.comments.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.comments.service.CommentsService;
import co.micol.prj.comments.service.CommentsVO;
import co.micol.prj.comments.serviceImpl.CommentsServiceImpl;
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
		vo.setComSeq(Integer.parseInt(request.getParameter("comSeq")));
		int result = commentsDao.deleteComments(vo);

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

			case 3:
			case 4:
			case 5:
			}
			return "main/home";
		} else {

			return "";
		}
	}

}
