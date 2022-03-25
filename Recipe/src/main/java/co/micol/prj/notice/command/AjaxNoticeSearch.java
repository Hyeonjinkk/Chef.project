package co.micol.prj.notice.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.micol.prj.comm.Command;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.service.NoticeVO;
import co.micol.prj.notice.serviceImpl.NoticeServiceImpl;

public class AjaxNoticeSearch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		NoticeService noticeDao = new NoticeServiceImpl();
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		System.out.println(val);
		List<NoticeVO> list = noticeDao.noticeSelectSearchList(key, val);
		String data = null;
		
		try {
			data = new ObjectMapper().writeValueAsString(list);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + data;
	}

}
