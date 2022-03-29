package co.micol.prj.comments.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.comments.service.CommentsService;
import co.micol.prj.comments.service.CommentsVO;
import co.micol.prj.comments.serviceImpl.CommentsServiceImpl;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.service.RecipeVO;
import co.micol.prj.recipe.serviceImpl.ReicpeServiceImpl;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class insertRecipeViewComments implements Command {

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
			case 1:
				request.setAttribute("recipeComments", "댓글이 성공적으로 등록되었습니다!");

				RecipeService recipeDao = new ReicpeServiceImpl();

				RecipeVO recipeVO = new RecipeVO();

				recipeVO.setRecipeSeq(vo.getComSeq());

				request.setAttribute("recipe", recipeDao.selectRecipe(recipeVO));

				
				break;

			case 2:
			case 3:
			}
			return "main/home";
		} else {

			return "";
		}
	}
}