package co.micol.prj.basket.service;

import java.util.List;

public interface BasketService {

	List<BasketVO> basketList(BasketVO vo); //나의 냉장고에 추가한 재료 리스트
	int insertBasket(BasketVO vo); //냉장고에 재료 추가
	int deleteBasket(BasketVO vo); //냉장고에 있는 재료 선택삭제
	int emptyBasket(BasketVO vo);  //냉장고 재료 전체삭제
	boolean bkCheck(String str1, String str2);   //냉장고에 있는 재료 중복체크
	
}
