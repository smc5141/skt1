package skt1.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import skt1.config.SqlMapConfig;
import skt1.dtos.LoginDto;

public class LoginDao extends SqlMapConfig {
	
	private String nameSpace="skt1.loginboard.";
	
	//회원가입
	public boolean insertuser(LoginDto dto) {
		int count=0;
		SqlSession sqlSession=null;
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.insert(nameSpace+"insertuser", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return count>0?true:false;
	}
	public boolean insertadmin(LoginDto dto) {
		int count=0;
		SqlSession sqlSession=null;
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.insert(nameSpace+"insertadmin", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return count>0?true:false;
	}
	//로그인
	public LoginDto Login(String id,String password) {
		LoginDto dto=new LoginDto();
		SqlSession sqlSession=null;
		Map<String,String> map=new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			dto=sqlSession.selectOne(nameSpace+"Login", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return dto;
	}
	public LoginDto userinfo(String id) {
		LoginDto dto=new LoginDto();
		SqlSession sqlSession=null;
		
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			dto=sqlSession.selectOne(nameSpace+"userinfo", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return dto;
	}public boolean updateinfo(String id,String address,String phone,String email) {
		int count=0;
		SqlSession sqlSession=null;
		Map<String,String> map=new HashMap<>();
		map.put("id", id);
		map.put("address", address);
		map.put("phone", phone);
		map.put("email", email);
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.update(nameSpace+"updateinfo", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}
	public List<LoginDto> alluserlist(){
		List<LoginDto> list=null;
		SqlSession sqlSession=null;
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			list=sqlSession.selectList(nameSpace+"alluserlist");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}
	public LoginDto idChk(String id) {
		LoginDto dto=new LoginDto();
		SqlSession sqlSession=null;
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			dto=sqlSession.selectOne(nameSpace+"idChk", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return dto;
	}
	public LoginDto loginChk(String id,String password) {
		LoginDto dto=new LoginDto();
		Map<String,String> map=new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		SqlSession sqlSession=null;
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			dto=sqlSession.selectOne(nameSpace+"loginChk", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return dto;
	}
}
