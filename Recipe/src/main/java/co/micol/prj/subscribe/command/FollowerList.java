package co.micol.prj.subscribe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;
import co.micol.prj.subscribe.service.SubsService;
import co.micol.prj.subscribe.service.SubsVO;
import co.micol.prj.subscribe.serviceImpl.SubsServiceImpl;

public class FollowerList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 나를 구독하는 유저 리스트 출력
		SubsService subsDAO = new SubsServiceImpl();
		SubsVO vo = new SubsVO();
		HttpSession session = request.getSession();
		
		vo.setFollowing((String)session.getAttribute("userId"));
		request.setAttribute("subs2", subsDAO.followerList(vo));
		System.out.println(subsDAO.followerList(vo));
		return "subs/followerList";
	}

}
