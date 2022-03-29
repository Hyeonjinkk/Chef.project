package co.micol.prj.subscribe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.subscribe.service.SubsService;
import co.micol.prj.subscribe.service.SubsVO;
import co.micol.prj.subscribe.serviceImpl.SubsServiceImpl;

public class FollowingList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 내가 구독한 셰프 리스트 출력
		SubsService subsDAO = new SubsServiceImpl();
		SubsVO vo = new SubsVO();
		HttpSession session = request.getSession();
		
		vo.setUserId((String)session.getAttribute("userId"));
		request.setAttribute("subs", subsDAO.followingList(vo));
		
		return "subs/followingList";
	}

}
