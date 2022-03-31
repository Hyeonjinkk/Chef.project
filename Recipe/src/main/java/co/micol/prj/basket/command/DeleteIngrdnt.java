package co.micol.prj.basket.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.basket.service.BasketService;
import co.micol.prj.basket.service.BasketVO;
import co.micol.prj.basket.serviceImpl.BasketServiceImpl;
import co.micol.prj.comm.Command;

public class DeleteIngrdnt implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 냉장고 재료 선택 삭제
		BasketService basketDAO = new BasketServiceImpl();
		BasketVO vo = new BasketVO();
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("userId");
		String[] chked = request.getParameterValues("chked");
		String result;
		
		if(chked !=null && chked.length > 0) {
			for(int i=0; i<chked.length; i++) {
				vo.setUserId(id);
				vo.setIngredient(chked[i]);
				basketDAO.deleteBasket(vo);
			}
			result = "ajax:0";
		} else {
			result = "ajax:1";
		}
		return result;
	}

}
