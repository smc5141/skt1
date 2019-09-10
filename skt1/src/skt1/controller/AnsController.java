package skt1.controller;

import java.io.IOException; 
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import skt1.daos.AnsDao;
import skt1.daos.LoginDao;
import skt1.dtos.AnsDto;
import skt1.dtos.LoginDto;
import skt1.utils.Paging;




@WebServlet("/AnsController.do")
public class AnsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session=request.getSession();
		
		String command=request.getParameter("command");
		
		AnsDao dao=new AnsDao();
		LoginDao ldao=new LoginDao();
		if(command.equals("boardlistpage")) {
			//요청 페이지 번호 받기
			String pnum=request.getParameter("pnum");
			String opt=request.getParameter("opt");
			String condition=request.getParameter("condition");
			String id=null;
			String title=null;
			String content=null;
			if(opt!=null) {
				if(opt.equals("id")) {
					id=condition;
				}
				if(opt.equals("title")) {
					title=condition;
				}
				if(opt.equals("content")) {
					content=condition;
				}
			}
			//list 요청페이지에 해당하는 글목록 가져오기
			//String id=request.getParameter("id");
			//글목록을 요청할때 따로 pnum 파라미터를 전달하지 않아도 목륵을 볼 수 있게 전에 담긴pnum을 사용
			if(pnum==null) {
				pnum=(String)request.getSession().getAttribute("pnum");
			}else {
				request.getSession().setAttribute("pnum", pnum);
			}
			
			List<AnsDto> list=dao.getAllListPage(pnum, id, title, content);
			//페이지의 개수를 구하기
			int pcount=dao.getPcount(id, title, content);
			LoginDto ldto=ldao.userinfo(id);
			
			Map<String, Integer> map=Paging.pagingValue(pcount, pnum, 5);
			request.setAttribute("ldto", ldto);
			request.setAttribute("pmap", map);
			request.setAttribute("list", list);
			dispatch("boardlist.jsp", request, response);	
		
		}else if(command.equals("boardlist")) {
			
			//"readcount"값을 삭제한다. 
			request.getSession().removeAttribute("readcount");
			
			
			List<AnsDto> list=dao.getAllList();
			request.setAttribute("list", list);
//			request.getRequestDispatcher("boardlist.jsp").forward(request, response);
			dispatch("boardlist.jsp", request, response);
		}else if(command.equals("boarddetail")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			
			//세션에 "readcount"가 있는지 가져와 본다
			String rSeq=(String)request.getSession().getAttribute("readcount");
			
			if(rSeq==null) {
				//조회수 올리기
				dao.readCount(seq);
				//현재 조회된 글에 번호를 세션에 "readcount"라는 이름으로 담아두기
				request.getSession().setAttribute("readcount", seq+"");
			}
			
			
			AnsDto dto=dao.getBoard(seq);
			request.setAttribute("dto", dto);
			dispatch("boarddetail.jsp", request, response);
		}else if(command.equals("muldel")) {
			String [] seqs=request.getParameterValues("chk");
			boolean isS=dao.mulDel(seqs);
			if(isS) {
				response.sendRedirect("AnsController.do?command=boardlistpage&pnum=1");
			}else {
				request.setAttribute("msg", "글여러개삭제실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("insertForm")) {		
			 dispatch("insertboard.jsp", request, response);
		}else if(command.equals("insertboard")) {
			String id=request.getParameter("id");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			boolean isS=dao.insertBoard(new AnsDto(id,title,content));
			if(isS) {
				response.sendRedirect("AnsController.do?command=boardlistpage&pnum=1");
			}else {
				request.setAttribute("msg", "글추가실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("updateForm")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			AnsDto dto=dao.getBoard(seq);
			request.setAttribute("dto", dto);
			dispatch("updateboard.jsp", request, response);
		}else if(command.equals("updateboard")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			boolean isS=dao.updateBoard(new AnsDto(seq,title,content));
			if(isS) {
				response.sendRedirect("AnsController.do?command=boarddetail&seq="+seq);
			}else {
				request.setAttribute("msg", "글수정하기 실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("replyboard")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			String id=request.getParameter("id");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			boolean isS=dao.replyBoard(new AnsDto(seq,id,title,content));
			if(isS) {
				response.sendRedirect("AnsController.do?command=boardlistpage&pnum=1");
			}else {
				request.setAttribute("msg", "답글달기실패");
				dispatch("error.jsp", request, response);
			}
		}
	}//doPost()종료
	
	//RequestDispatcher객체를 구해서 forward()할 수 있도록 구현한 메서드
	//                        --> request scope에 담은 객체를 전달할때 이동하는 방식
	public void dispatch(String url, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(url).forward(request, response);
	}

}







