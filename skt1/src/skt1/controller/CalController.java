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
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import skt1.daos.CalDao;
import skt1.daos.LoginDao;
import skt1.dtos.CalDto;
import skt1.dtos.LoginDto;
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
		LoginDao ldao=new LoginDao();
		HttpSession session=request.getSession();
		
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
			
			String yyyyMM=year+Util.isTwo(month+"");//"201908"
			List<CalDto>list=dao.getCalViewList(yyyyMM);
			request.setAttribute("list", list);
			dispatch("calendar.jsp", request, response);

			}else if(command.equals("callist")) {
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			String date=request.getParameter("date");
			
			String yyyyMMdd=year+Util.isTwo(month)+Util.isTwo(date);//8자리
			List<CalDto>list=dao.getCalList(yyyyMMdd);
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
			String teamname=request.getParameter("teamname");
			boolean isS=dao.insertCal(new CalDto(0,id,title,content,mdate,null,teamname));
			if(isS) {
				response.sendRedirect("CalController.do?command=calendar");
			}else{
				request.setAttribute("msg", "일정추가실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("insertcalform")) {
			LoginDto ldto=(LoginDto)session.getAttribute("ldto");
			if(ldto==null) {
				jsFoward1("LoginController.do?command=login", response);
			}
			if(ldto.getRole().equals("ADMIN")) {
				dispatch("calwrite.jsp", request, response);
			}else{
				jsFoward("관리자만 일정추가 가능합니다.", "calendar.jsp", response);
			}
		}else if(command.equals("caldetail")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			CalDto dto=dao.getCalBoard(seq);
			request.setAttribute("dto", dto);
			dispatch("caldetail.jsp", request, response);
		}else if(command.equals("muldel")) {
			LoginDto ldto=(LoginDto)session.getAttribute("ldto");
			if(ldto==null) {
				jsFoward1("LoginController.do?command=login", response);
			}
			if(ldto.getRole().equals("ADMIN")) {
			String[]seqs=request.getParameterValues("chk");
			boolean isS=dao.muldelCal(seqs);
			if(isS) {
				response.sendRedirect("CalController.do?command=calendar");
			}else {
				request.setAttribute("msg", "글삭제실패");
				dispatch("error.jsp", request, response);
			}
			}else{
				jsFoward("관리자만 일정삭제가 가능합니다.", "calendar.jsp", response);
			}
			
			
		}else if(command.equals("calupdateform")) {
			LoginDto ldto=(LoginDto)session.getAttribute("ldto");
			if(ldto==null) {
				jsFoward1("LoginController.do?command=login", response);
			}
			if(ldto.getRole().equals("ADMIN")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			CalDto dto=dao.getCalBoard(seq);
			request.setAttribute("dto", dto);
			dispatch("calupdate.jsp", request, response);
			}else{
				int seq=Integer.parseInt(request.getParameter("seq"));
				jsFoward("관리자만 일정수정이 가능합니다.", "CalController.do?command=caldetail&seq="+seq, response);
			}
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
			
			boolean isS=dao.updateCal(new CalDto(seq,null,title,content,mdate,null,null));
			if(isS) {
				response.sendRedirect("CalController.do?command=caldetail&seq="+seq);
			}else {
				request.setAttribute("msg", "일정수정실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("calcount")) {
			String yyyyMMdd=request.getParameter("yyyyMMdd");
			int count=dao.getCalViewCount(yyyyMMdd);
			PrintWriter pw=response.getWriter();
			pw.print(count);
		}
		
		
		
		
	}//dopost

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher(url).forward(request, response);
	}

	
	public void jsFoward(String msg, String url, HttpServletResponse response) throws IOException {
		String str="<script type='text/javascript'>"
		+"alert('"+msg+"');"
		+"location.href='"+url+"';"
		+"</script>";
		PrintWriter pw=response.getWriter();
		pw.print(str);
	}
	
	public void jsFoward1(String url, HttpServletResponse response) throws IOException {
		String str="<script type='text/javascript'>"
				+"location.href='"+url+"';"
				+"</script>";
				PrintWriter pw=response.getWriter();
				pw.print(str);
		
		
	}
	
}
