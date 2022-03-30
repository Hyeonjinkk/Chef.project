package co.micol.prj.basket.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.basket.service.BasketService;
import co.micol.prj.basket.service.BasketVO;
import co.micol.prj.basket.serviceImpl.BasketServiceImpl;
import co.micol.prj.comm.Command;

public class MyBasketList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 나의 냉장고 식재료 리스트 출력
		BasketService basketDAO = new BasketServiceImpl();
		BasketVO vo = new BasketVO();
		HttpSession session = request.getSession();
		
		vo.setUserId((String)session.getAttribute("userId"));
		basketDAO.basketList(vo);
		
		String a = (String)session.getAttribute("userId");
		
		if(a != null) {
			//session.setAttribute("userId", vo.getUserId());
			request.setAttribute("basket", basketDAO.basketList(vo));			
			return "basket/myBasket";
		} else {
			request.setAttribute("message", "로그인이 필요한 서비스입니다.");
			return "main/home";
		}
		
	}
}



