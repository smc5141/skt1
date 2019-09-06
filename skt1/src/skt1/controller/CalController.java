package skt1.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import skt1.daos.CalDao;
import skt1.dtos.CalDto;
import skt1.utils.Util;



//test
@WebServlet("/CalController.do")
public class CalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String command=request.getParameter("command");
		CalDao dao=new CalDao();
		
		if(command.equals("calendar")) {
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			if(year==null) {
				Calendar cal=Calendar.getInstance();
				year=cal.get(Calendar.YEAR)+"";
				month=(cal.get(Calendar.MONTH)+1)+"";
			}
			if(year!=null) {
				request.getSession().setAttribute("year", year);
				request.getSession().setAttribute("month", month);
			}
			
			//한달에 대한 일정목록 가져오기(separaiton 패턴)
			String id="hk";//나중에 로그인기능있을때 session에서 구하기
			String yyyyMM=year+Util.isTwo(month+"");//"201908"
			List<CalDto>list=dao.getCalViewList(id, yyyyMM);
			request.setAttribute("list", list);
			
			
			dispatch("calendar.jsp", request, response);
//			response.sendRedirect("calendar.jsp");
		
		
		}else if(command.equals("callist")) {
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			String date=request.getParameter("date");
			
			String yyyyMMdd=year+Util.isTwo(month)+Util.isTwo(date);//8자리
			String id="hk"; //request.getsession.getAttribute("id");
			List<CalDto>list=dao.getCalList(id, yyyyMMdd);
			request.setAttribute("list", list);
			dispatch("calboardlist.jsp", request, response);
			
		}else if(command.equals("insertcal")) {
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			String date=request.getParameter("date");
			String hour=request.getParameter("hour");
			String min=request.getParameter("min");
			
			//mdate에 저장하기 위해 12자리로 변환하는 작업
			String mdate=year+Util.isTwo(month)+Util.isTwo(date)+Util.isTwo(hour)+Util.isTwo(min);
			String id=request.getParameter("id");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			boolean isS=dao.insertCal(new CalDto(0,id,title,content,mdate,null));
			if(isS) {
				response.sendRedirect("CalController.do?command=calendar");
			}else {
				request.setAttribute("msg", "일정추가실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("insertcalform")) {
			dispatch("calwrite.jsp", request, response);
		}else if(command.equals("caldetail")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			CalDto dto=dao.getCalBoard(seq);
			request.setAttribute("dto", dto);
			dispatch("caldetail.jsp", request, response);
		}else if(command.equals("muldel")) {
			String[]seqs=request.getParameterValues("chk");
			boolean isS=dao.muldelCal(seqs);
			if(isS) {
				response.sendRedirect("CalController.do?command=calendar");
			}else {
				request.setAttribute("msg", "글삭제실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("calupdateform")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			CalDto dto=dao.getCalBoard(seq);
			request.setAttribute("dto", dto);
			dispatch("calupdate.jsp", request, response);
		}else if(command.equals("calupdate")) {
			
			
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			String date=request.getParameter("date");
			String hour=request.getParameter("hour");
			String min=request.getParameter("min");
			
			//mdate에 저장하기 위해 12자리로 변환하는 작업
			String mdate=year+Util.isTwo(month)+Util.isTwo(date)+Util.isTwo(hour)+Util.isTwo(min);
			int seq=Integer.parseInt(request.getParameter("seq"));
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			boolean isS=dao.updateCal(new CalDto(seq,null,title,content,mdate,null));
			if(isS) {
				response.sendRedirect("CalController.do?command=caldetail&seq="+seq);
			}else {
				request.setAttribute("msg", "일정수정실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("calcount")) {
			String yyyyMMdd=request.getParameter("yyyyMMdd");
			String id="hk";
			int count=dao.getCalViewCount(id, yyyyMMdd);
			PrintWriter pw=response.getWriter();
			pw.print(count);
		}
		
	}//dopost

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	
}