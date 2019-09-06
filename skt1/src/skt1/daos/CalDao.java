package skt1.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import skt1.config.SqlMapConfig;
import skt1.dtos.CalDto;


public class CalDao extends SqlMapConfig{

	private String nameSpace="skt1.calboard.";

	//일정 목록조회 : 반환List,파라미터(id, 년월일8자리)
	public List<CalDto> getCalList(String id,String yyyyMMdd){
		List<CalDto> list=null;
		Map<String, String>map=new HashMap<String, String>();
		map.put("id", id);
		map.put("yyyyMMdd", yyyyMMdd);
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			list=sqlSession.selectList(nameSpace+"getCalList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}

	//일정추가
	public boolean insertCal(CalDto dto) {
		int count=0;
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.insert(nameSpace+"insertCal", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}

	//일정상세보기
	public CalDto getCalBoard(int seq) {
		CalDto dto=new CalDto();
		SqlSession sqlSession=null;

		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			dto=sqlSession.selectOne(nameSpace+"caldetail", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}

		return dto;
	}

	//일정수정하기
	public boolean updateCal(CalDto dto) {
		int count=0;
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.update(nameSpace+"calupdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}

	//일정삭제하기
	public boolean muldelCal(String[] seqs) {
		int count=0;
		SqlSession sqlSession=null;
		Map<String, String[]> map=new HashMap<>();
		map.put("seqs", seqs);

		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.delete(nameSpace+"muldel", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}

	//달력에 일정 3개씩 보여주는 기능
	public List<CalDto> getCalViewList(String id,String yyyyMM){
		List<CalDto> list=null;
		Map<String, String>map=new HashMap<String, String>();
		map.put("id", id);
		map.put("yyyyMM", yyyyMM);
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			list=sqlSession.selectList(nameSpace+"calviewlist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}		

	//하루에 대한 일정 개수 구하기
	public int getCalViewCount(String id,String yyyyMMdd){
		int count=0;
		Map<String, String>map=new HashMap<String, String>();
		map.put("id", id);
		map.put("yyyyMMdd", yyyyMMdd);
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.selectOne(nameSpace+"calcount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return count;
	}

	
}
