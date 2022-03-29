package co.micol.prj.subscribe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.subscribe.service.SubsService;
import co.micol.prj.subscribe.service.SubsVO;
import co.micol.prj.subscribe.serviceImpl.SubsServiceImpl;

public class Unfollowing implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 구독 취소 처리
		SubsService subsDAO = new SubsServiceImpl();
		SubsVO vo = new SubsVO();
		HttpSession session = request.getSession();
	
		vo.setUserId((String)session.getAttribute("userId"));
		vo.setFollowing(request.getParameter("following"));
		int n = subsDAO.deleteFollowing(vo);
		
		if(n != 0) {
			System.out.println("구독취소성공");
			return "followingList.do";
		} else {
			System.out.println("구독취소실패");
			return "followingList.do";
		}
	}

}
