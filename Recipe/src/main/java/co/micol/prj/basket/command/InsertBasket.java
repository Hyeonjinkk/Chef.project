package co.micol.prj.basket.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.basket.service.BasketService;
import co.micol.prj.basket.service.BasketVO;
import co.micol.prj.basket.serviceImpl.BasketServiceImpl;
import co.micol.prj.comm.Command;

public class InsertBasket implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 냉장고에 식재료 입력 처리
		BasketService basketDAO = new BasketServiceImpl();
		BasketVO vo = new BasketVO();
		HttpSession session = request.getSession();
		
		vo.setUserId((String)session.getAttribute("userId"));
		vo.setIngredient(request.getParameter("ingredient"));
		
		int n = basketDAO.insertBasket(vo);
	
		if(n != 0) {
			return "myBasketList.do";			
		} else {
			request.setAttribute("message", "정상적으로 입력되지 않았습니다.");
			return "basket/myBasket";		
		}
	}

}
