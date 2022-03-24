package co.micol.prj.recipe.service;

import java.util.List;

public interface RecipeMapper {
	
	List<RecipeVO> selectRecipeList();		// 레시피 전체조회
	RecipeVO selectRecipe(RecipeVO vo);		// 레시피 상세조회
	int insertRecipe(RecipeVO vo);			// 레시피 등록
	int updateRecipe(RecipeVO vo);			// 레시피 수정
	int deleteRecipe(RecipeVO vo);			// 레시피 삭제
	

}
