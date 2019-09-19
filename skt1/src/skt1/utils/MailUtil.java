package skt1.utils;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
	
	public static void sendMail(String email, String subject, String msg) throws Exception{
		//메일 서버 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "minrr12";
		String hostSMTPpwd = "a1s2d3q4w5";
		
		//보내는 사람
		String fromEmail="minrr12@naver.com";
		String fromName="운영자";
		
		try {
			HtmlEmail mail  = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);  
			
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);
			
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
