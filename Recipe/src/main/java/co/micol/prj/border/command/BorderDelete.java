package co.micol.prj.border.command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.border.service.BorderService;
import co.micol.prj.border.service.BorderVO;
import co.micol.prj.border.serviceImpl.BorderServiceImpl;
import co.micol.prj.comm.Command;
import co.micol.prj.comments.service.CommentsService;
import co.micol.prj.comments.service.CommentsVO;
import co.micol.prj.comments.serviceImpl.CommentsServiceImpl;


public class BorderDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
				BorderService borderDao = new BorderServiceImpl();
				BorderVO vo = new BorderVO();
				System.out.println(Integer.parseInt(request.getParameter("borderId")));
				vo.setBorderId(Integer.parseInt(request.getParameter("borderId")));
				
				CommentsService commentDao = new CommentsServiceImpl();
				CommentsVO Cvo = new CommentsVO();
				Cvo.setComSeq(vo.getBorderId());
				commentDao.deleteComments(Cvo);
				int n = borderDao.borderDelete(vo);
				if(n != 0) {
					return "borderList.do";
				}else {
					request.setAttribute("message", "삭제가 정상적으로 이루어지지 않았다.");
					return "border/borderList";
				}	
			}
		}
