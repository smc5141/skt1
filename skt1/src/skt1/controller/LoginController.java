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
import skt1.utils.FindUtil;
import skt1.utils.MailUtil;


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
		}else if(command.equals("admin")){
			response.sendRedirect("adminsignup.jsp");
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
		}else if(command.equals("insertadmin")){
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			String name=request.getParameter("name");
			String address=request.getParameter("address");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			
			boolean isS=dao.insertadmin(new LoginDto(id,password,name,address,phone,email,null));
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
			if(ldto==null) {
				jsFoward("아이디와 비밀번호가 틀리거나 없는 아이디입니다.", "login.jsp", response);
			}else {
				session.setAttribute("ldto", ldto);
				session.setMaxInactiveInterval(10*60);
				dispatch("index.jsp", request, response);
			}
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
		}else if(command.equals("pwch")) {
			String id=request.getParameter("id");
			LoginDto ldto=dao.pwinfo(id);
			request.setAttribute("ldto", ldto);
			dispatch("pwch.jsp", request, response);
			
		}else if(command.equals("pwcheck")) {
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			String chpassword=request.getParameter("passwordch");
			LoginDto ldto=dao.Login(id, password);
			if(ldto==null) {
				jsFoward("현재 비밀번호가 일치하지 않습니다.", "LoginController.do?command=pwch&id="+id, response);
			}else {
				boolean isS=dao.Pwch(id, chpassword);
				if(isS) {
					jsFoward("비밀번호 변경 성공", "LoginController.do?command=info", response);
				}else {
					jsFoward("비밀번호 변경 실패", "LoginController.do?command=pwch", response);
				}
			}
		}else if(command.equals("searchpw")) {
				String id=request.getParameter("id");
				LoginDto ldto=dao.userinfo(id);
				try {
					findPwd(ldto.getEmail(), ldto.getId());
				} catch (Exception e) {
					e.printStackTrace();
				}
				jsFoward("이메일 발송", "login.jsp", response);
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
	public String findPwd(String email,String id) throws Exception {
		String newPwd = FindUtil.getNewPwd();
		LoginDao dao=new LoginDao();
		boolean isS=dao.changePw(newPwd, id);
		
		String subject = "[하하하하하] 임시 비밀번호 발급 안내";
		
		String msg="";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color:blue;'><strong>"+id;
		msg += "님</strong>의 임시비밀번호 입니다. 로그인후 비밀번호를 변경해주세요.</h3>";
		msg += "<p>임시 비밀번호 : <strong>" + newPwd + "<strong></p></div>";
		
		MailUtil.sendMail(email, subject, msg);
		
		return "success";
		
	}

}
