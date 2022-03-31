package co.micol.prj.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.border.service.BorderService;
import co.micol.prj.border.serviceImpl.BorderServiceImpl;
import co.micol.prj.comm.Command;
import co.micol.prj.inquiry.service.InquiryService;
import co.micol.prj.inquiry.serviceImpl.InquiryServiceImpl;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.serviceImpl.NoticeServiceImpl;
import co.micol.prj.recipe.service.RecipeService;
import co.micol.prj.recipe.serviceImpl.ReicpeServiceImpl;

public class HomeCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		RecipeService recipeDao = new ReicpeServiceImpl();
		NoticeService noticeDao = new NoticeServiceImpl();
		InquiryService inquiryDao = new InquiryServiceImpl();
		BorderService borderDao = new BorderServiceImpl();
		
		
		request.removeAttribute("message");
		
		request.setAttribute("recipeLike", recipeDao.selectLikeList());
		
		request.setAttribute("recipeCnt", recipeDao.countRecipeList());
		request.setAttribute("noticeCnt", noticeDao.noticeCount());
		request.setAttribute("inquiryCnt", inquiryDao.inquiryCount());
		request.setAttribute("borderCnt", borderDao.countBoard());
		
		
		return "main/home";
	}

}
