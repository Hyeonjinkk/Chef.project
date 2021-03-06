package co.micol.prj.recipe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.comments.service.CommentsService;
import co.micol.prj.comments.service.CommentsVO;
import co.micol.prj.comments.serviceImpl.CommentsServiceImpl;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.service.RecipeVO;
import co.micol.prj.recipe.serviceImpl.ReicpeServiceImpl;

public class DeleteRecipe implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 레시피 삭제처리
		RecipeService recipeDao = new ReicpeServiceImpl();
		RecipeVO vo = new RecipeVO();
		
		CommentsService commentsDao = new CommentsServiceImpl();
		CommentsVO commentsVo = new CommentsVO();
		
		commentsVo.setComSeq(vo.getRecipeSeq());
		int cascade = commentsDao.cascadeComments(commentsVo);
		vo.setRecipeSeq(Integer.parseInt(request.getParameter("recipeSeq")));
		
		int result = recipeDao.deleteRecipe(vo);
		if(result != 0 && cascade != 0) {
			request.setAttribute("message", "해당 게시글이 정상적으로 삭제되었습니다.");
			
		}
		
		return "recipe/recipeList";
	}

}
