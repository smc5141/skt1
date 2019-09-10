package skt1.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
			LoginDto ldto=(LoginDto)session.getAttribute("ldto");
			if(ldto!=null) {
				jsFoward("현재 로그인 상태입니다.", "index.jsp", response);
			}else {
				response.sendRedirect("login.jsp");
			}
		}else if(command.equals("userlogin")) {
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			LoginDto ldto=dao.Login(id, password);
			
			session.setAttribute("ldto", ldto);
			session.setMaxInactiveInterval(10*60);
			dispatch("index.jsp", request, response);
			
		}else if(command.equals("info")) {
			LoginDto ldto=(LoginDto)session.getAttribute("ldto");
			if(ldto==null) {
				jsFoward("로그인후 사용가능합니다", "login.jsp", response);
			}else {
				String id=ldto.getId();
				ldto=dao.userinfo(id);
				if(ldto.getRole().equals("USER")) {
				request.setAttribute("ldto",ldto);
				dispatch("userinfo.jsp", request, response);
				}else {
					request.setAttribute("ldto",ldto);
					dispatch("admininfo.jsp", request, response);
				}
			}
			
		}else if(command.equals("logout")) {
			LoginDto ldto=(LoginDto)session.getAttribute("ldto");
			if(ldto!=null) {
				session.invalidate();
				jsFoward("로그아웃 하였습니다", "index.jsp", response);
			}else {
				jsFoward("로그인 상태가 아닙니다", "index.jsp", response);
			}
		}else if(command.equals("updateinfo")) {
			String id=request.getParameter("id");
			LoginDto ldto=dao.userinfo(id);
			request.setAttribute("ldto", ldto);
			dispatch("updateinfo.jsp", request, response);
			
		}else if(command.equals("update")) {
			String id=request.getParameter("id");
			String address=request.getParameter("address");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			
			boolean isS=dao.updateinfo(id,address,phone,email);
			if(isS) {
				jsFoward("정보수정  성공", "LoginController.do?command=info", response);
			}else {
				jsFoward("정보수정 실패", "LoginController.do?command=update", response);
			}
		}else if(command.equals("alluser")) {
			List<LoginDto> list=dao.alluserlist();
			request.setAttribute("list", list);
			dispatch("alluserlist.jsp", request, response);
		}else if(command.equals("idChk")) {
			String id=request.getParameter("id");
			LoginDto ldto=dao.idChk(id);
			request.setAttribute("ldto", ldto);
			dispatch("idChkform.jsp", request, response);
		}else if(command.equals("loginChk")) {
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			boolean isS=dao.loginChk(id, password);
			if(isS) {
				jsFoward("아이디 비밀번호를 확인하세요", "login.jsp", response);
			}else {
				request.setAttribute("id", id);
				request.setAttribute("password", password);
				dispatch("LoginController.do?command=userlogin", request, response);
			}
			
			
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
