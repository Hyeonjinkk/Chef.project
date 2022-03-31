package co.micol.prj.recipe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.service.RecipeVO;
import co.micol.prj.recipe.serviceImpl.ReicpeServiceImpl;

public class SearchBkRecipe implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 냉장고 레시피 검색
		RecipeService recipeDAO = new ReicpeServiceImpl();

		String[] keywords = request.getParameterValues("ingredient");

		if (keywords != null && keywords.length > 0) {
			request.setAttribute("recipes", recipeDAO.searchBkRecipe(keywords));
			return "recipe/bkRecipeList";
			
		} else {
			return "home.do";
		}
//		vo.setRecipeParts(request.getParameter("ingredient"));
//		recipeDAO.searchBkRecipe(m);
	}

}
