package co.micol.prj.basket.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.basket.service.BasketService;
import co.micol.prj.basket.service.BasketVO;
import co.micol.prj.basket.serviceImpl.BasketServiceImpl;
import co.micol.prj.comm.Command;

public class AjaxBasketInCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 냉장고 재료 중복 체크
		BasketService basketDAO = new BasketServiceImpl();
		HttpSession session = request.getSession();
		
		String str1 = (String)session.getAttribute("userId");
		String str2 = request.getParameter("str2");
		boolean b = basketDAO.bkCheck(str1, str2);
		String result;
		
		if(!b) 	{
			result = "ajax:0";
		} else {
			result = "ajax:1";
		}
		return result;
	}

}
