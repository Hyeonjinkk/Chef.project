package co.micol.prj.basket.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BasketMapper {

	List<BasketVO> basketList(BasketVO vo); //냉장고에 추가한 재료 리스트
	
	int insertBasket(BasketVO vo); //냉장고에 재료 추가
	int deleteBasket(BasketVO vo); //냉장고에 있는 재료 선택삭제
	int emptyBasket(BasketVO vo);  //냉장고 재료 전체삭제
	String bkCheck(BasketVO vo);   //냉장고에 있는 재료 중복체크
	boolean bkCheck(@Param("str1") String str1, @Param("str2") String str2);   //냉장고에 있는 재료 중복체크
	
}
