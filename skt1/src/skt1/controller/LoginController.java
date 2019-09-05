package skt1.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import skt1.daos.LoginDao;
import skt1.dtos.LoginDto;


@WebServlet("/LoginController.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String command = request.getParameter("command");
		
		LoginDao dao=new LoginDao();
		
		HttpSession session=request.getSession();
		
		if(command.equals("insert")){
			response.sendRedirect("singup.jsp");
		}else if(command.equals("insertuser")) {
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			String name=request.getParameter("name");
			String address=request.getParameter("address");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			
			boolean isS=dao.insertuser(new LoginDto(id,password,name,address,phone,email,null));
			if(isS) {
				jsFoward("회원가입 성공", "index.jsp", response);
			}else {
				request.setAttribute("msg", "회원가입실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("login")) {
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			LoginDto dto=dao.Login(id, password);
			
			request.setAttribute("dto", dto);
			dispatch("index.jsp", request, response);
			
		}
	}
	public void dispatch(String url,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch=request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	public void jsFoward(String msg, String url, HttpServletResponse response) throws IOException {
		String str="<script type='text/javascript'>"
		+"alert('"+msg+"');"
		+"location.href='"+url+"';"
		+"</script>";
		PrintWriter pw=response.getWriter();
		pw.print(str);
		
	}
}
