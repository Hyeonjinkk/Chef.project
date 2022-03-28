package co.micol.prj.recipe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.service.RecipeVO;
import co.micol.prj.recipe.serviceImpl.ReicpeServiceImpl;

public class UpdateRecipeForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO
		RecipeVO vo = new RecipeVO();
		RecipeService recipeDao = new ReicpeServiceImpl();
		
		vo.setRecipeSeq(Integer.parseInt(request.getParameter("recipeSeq")));   
		
		request.setAttribute("recipe", recipeDao.selectRecipe(vo));
		return "recipe/recipeUpdateForm";
	}

}
