package co.micol.prj.recipe.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.service.RecipeVO;
import co.micol.prj.recipe.serviceImpl.ReicpeServiceImpl;
import co.micol.prj.user.service.UserService;
import co.micol.prj.user.service.UserVO;
import co.micol.prj.user.serviceImpl.UserServiceImpl;

public class RecipeList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO RECIPE 페이지 처리하면서 전체리스트 끌고 들어오기
		RecipeService RecipeDao = new ReicpeServiceImpl();
		
		
		
		
		
		request.setAttribute("recipes", RecipeDao.selectRecipeList());
		return "recipe/recipeList";
	}

}
