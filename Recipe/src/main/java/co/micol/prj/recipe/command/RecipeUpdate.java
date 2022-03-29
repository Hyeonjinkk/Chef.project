package co.micol.prj.recipe.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.service.RecipeVO;
import co.micol.prj.recipe.serviceImpl.ReicpeServiceImpl;

public class RecipeUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 레시피 수정처리
		RecipeVO vo = new RecipeVO();
		RecipeService recipeDao = new ReicpeServiceImpl();
		HttpSession session = request.getSession();
		vo.setRecipeName(request.getParameter("recipeName"));
		vo.setRecipeKind(request.getParameter("recipeKinds"));
		vo.setRecipeDate(Date.valueOf(request.getParameter("rDate")));
		vo.setRecipeParts(request.getParameter("recipeParts"));

		vo.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		vo.setRecipeSeq(Integer.parseInt(request.getParameter("recipeSeq")));
		vo.setRecipeWay(request.getParameter("recipeWay"));
		vo.setRecipeImageSm(request.getParameter("recipeImgSm"));
		vo.setRecipeImageLg(request.getParameter("recipeImgLg"));

		vo.setManual1(request.getParameter("manual1"));
		vo.setManual2(request.getParameter("manual2"));
		vo.setManual3(request.getParameter("manual3"));
		vo.setManual4(request.getParameter("manual4"));
		vo.setManual5(request.getParameter("manual5"));
		vo.setManual6(request.getParameter("manual6"));
		vo.setManual7(request.getParameter("manual7"));
		vo.setManual8(request.getParameter("manual8"));
		vo.setManual9(request.getParameter("manual9"));
		vo.setManual10(request.getParameter("manual10"));
		vo.setManual11(request.getParameter("manual11"));
		vo.setManual12(request.getParameter("manual12"));
		vo.setManual13(request.getParameter("manual13"));
		vo.setManual14(request.getParameter("manual14"));
		vo.setManual15(request.getParameter("manual15"));
		vo.setManual16(request.getParameter("manual16"));
		vo.setManual17(request.getParameter("manual17"));
		vo.setManual18(request.getParameter("manual18"));
		vo.setManual19(request.getParameter("manual19"));
		vo.setManual20(request.getParameter("manual20"));
		vo.setManualImage1(request.getParameter("manualImage1"));
		vo.setManualImage2(request.getParameter("manualImage2"));
		vo.setManualImage3(request.getParameter("manualImage3"));
		vo.setManualImage4(request.getParameter("manualImage4"));
		vo.setManualImage5(request.getParameter("manualImage5"));
		vo.setManualImage6(request.getParameter("manualImage6"));
		vo.setManualImage7(request.getParameter("manualImage7"));
		vo.setManualImage8(request.getParameter("manualImage8"));
		vo.setManualImage9(request.getParameter("manualImage9"));
		vo.setManualImage10(request.getParameter("manualImage10"));
		vo.setManualImage11(request.getParameter("manualImage11"));
		vo.setManualImage12(request.getParameter("manualImage12"));
		vo.setManualImage13(request.getParameter("manualImage13"));
		vo.setManualImage14(request.getParameter("manualImage14"));
		vo.setManualImage15(request.getParameter("manualImage15"));
		vo.setManualImage16(request.getParameter("manualImage16"));
		vo.setManualImage17(request.getParameter("manualImage17"));
		vo.setManualImage18(request.getParameter("manualImage18"));
		vo.setManualImage19(request.getParameter("manualImage19"));
		vo.setManualImage20(request.getParameter("manualImage20"));

		int result = recipeDao.updateRecipe(vo);
		if (result != 0) {
			request.setAttribute("recipe", recipeDao.selectRecipe(vo));
			request.setAttribute("message", "수정완료되었습니다.");
			return "recipe/recipeView";
		} else {

			return "recipe/recipeUpdateForm";
		}
	}

}
