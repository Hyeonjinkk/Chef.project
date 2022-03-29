package co.micol.prj.comments.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.comments.service.CommentsService;
import co.micol.prj.comments.service.CommentsVO;
import co.micol.prj.comments.serviceImpl.CommentsServiceImpl;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.service.RecipeVO;
import co.micol.prj.recipe.serviceImpl.ReicpeServiceImpl;

public class UpdateComments implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 
		CommentsService commentDao = new CommentsServiceImpl();
		CommentsVO vo = new CommentsVO();
		vo.setComNo(Integer.parseInt(request.getParameter("comNo")));
		vo.setComDate(Date.valueOf(request.getParameter("updateDate")));
		vo.setComContents(request.getParameter("afterValue"));
		vo.setComCategory(Integer.parseInt(request.getParameter("comCategory")));
		vo.setComSeq(Integer.parseInt(request.getParameter("comSeq")));
		int result = commentDao.updateComments(vo);
		

		if (result != 0) {
			switch (vo.getComCategory()) {
			case 1:
				request.setAttribute("recipeComments", "댓글이 성공적으로 수정되었습니다");

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
