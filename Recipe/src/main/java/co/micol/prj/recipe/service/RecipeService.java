package co.micol.prj.recipe.service;

import java.util.List;

import co.micol.prj.user.service.UserVO;

public interface RecipeService {
	
	List<RecipeVO> selectRecipeList();		// 레시피 전체조회
	RecipeVO selectRecipe(RecipeVO vo);		// 레시피 상세조회
	List<RecipeVO> selectLikeList(); // 레시피 좋아요 순

	
	
	int insertRecipe(RecipeVO vo);			// 레시피 등록
	int updateRecipe(RecipeVO vo);			// 레시피 수정
	int deleteRecipe(RecipeVO vo);			// 레시피 삭제
	
	int updateHit(int recipeSeq);			// 조회수 증가
	
	
	
//	게시글 전체 수 조회
	int countRecipeList();
	
// 냉장고 레시피 검색
	List<RecipeVO> searchBkRecipe(String[] keywords);
}
