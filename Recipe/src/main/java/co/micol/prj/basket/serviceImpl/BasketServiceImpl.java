package co.micol.prj.basket.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.basket.service.BasketMapper;
import co.micol.prj.basket.service.BasketService;
import co.micol.prj.basket.service.BasketVO;
import co.micol.prj.comm.DataSource;


public class BasketServiceImpl implements BasketService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private BasketMapper map = sqlSession.getMapper(BasketMapper.class);
	
	@Override
	public List<BasketVO> basketList(BasketVO vo) {

		return map.basketList(vo);
	}

	@Override
	public int insertBasket(BasketVO vo) {

		return map.insertBasket(vo);
	}

	@Override
	public int deleteBasket(BasketVO vo) {

		return map.deleteBasket(vo);
	}

	@Override
	public int emptyBasket(BasketVO vo) {
		
		return map.emptyBasket(vo);
	}

	@Override
	public boolean bkCheck(String str1, String str2) {

		return map.bkCheck(str1, str2);
	}


}
