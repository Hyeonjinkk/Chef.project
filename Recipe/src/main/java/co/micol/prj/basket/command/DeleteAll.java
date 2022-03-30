package co.micol.prj.basket.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.basket.service.BasketService;
import co.micol.prj.basket.service.BasketVO;
import co.micol.prj.basket.serviceImpl.BasketServiceImpl;
import co.micol.prj.comm.Command;

public class DeleteAll implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 냉장고 비우기 처리
		BasketService basketDAO = new BasketServiceImpl();
		BasketVO vo = new BasketVO();
		HttpSession session = request.getSession();
		
		vo.setUserId((String)session.getAttribute("userId"));
		int n = basketDAO.emptyBasket(vo);
		
		if(n != 0) {
			return "myBasketList.do";
		} else {
			
			return "basket/myBasket";
		}
	}

}
