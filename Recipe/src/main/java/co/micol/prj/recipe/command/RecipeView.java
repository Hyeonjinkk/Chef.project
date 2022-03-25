package co.micol.prj.recipe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.service.RecipeVO;
import co.micol.prj.recipe.serviceImpl.ReicpeServiceImpl;

public class RecipeView implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 레시피 상세과정 보기
		RecipeService recipeDao = new ReicpeServiceImpl();
		RecipeVO vo = new RecipeVO();
		vo.setRecipeSeq(Integer.parseInt(request.getParameter("recipeSeq")));
		
		request.setAttribute("recipe", recipeDao.selectRecipe(vo));
		
		

		return "recipe/recipeView";
	}

}
