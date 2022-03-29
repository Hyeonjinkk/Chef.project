package co.micol.prj.recipe.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.comm.DataSource;
import co.micol.prj.recipe.service.RecipeMapper;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.service.RecipeVO;
import co.micol.prj.user.service.UserVO;

public class ReicpeServiceImpl implements RecipeService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private RecipeMapper map = sqlSession.getMapper(RecipeMapper.class); 
	
	
	
	@Override
	public List<RecipeVO> selectRecipeList() {
		// TODO Auto-generated method stub
		return map.selectRecipeList();
	}

	@Override
	public RecipeVO selectRecipe(RecipeVO vo) {
		// TODO Auto-generated method stub
		return map.selectRecipe(vo);
	}

	@Override
	public int insertRecipe(RecipeVO vo) {
		// TODO Auto-generated method stub
		return map.insertRecipe(vo);
	}

	@Override
	public int updateRecipe(RecipeVO vo) {
		// TODO Auto-generated method stub
		return map.updateRecipe(vo);
	}

	@Override
	public int deleteRecipe(RecipeVO vo) {
		// TODO Auto-generated method stub
		return map.deleteRecipe(vo);
	}

	@Override
	public int updateHit(int recipeSeq) {
		// TODO Auto-generated method stub
		return map.updateHit(recipeSeq);
	}



	

}
