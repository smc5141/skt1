package skt1.daos;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import skt1.config.SqlMapConfig;
import skt1.dtos.AnsDto;



public class AnsDao extends SqlMapConfig{

	private String nameSpace="skt1.ansboard.";
	
	public AnsDao() {
		super();
	}
	
	
	
	
	//글목록의 페이지 개수 구하기
		public int getPcount(String id,String title,String content) {			
			Map<String, String> map=new HashMap<>();
			map.put("id", id);
			map.put("title", title);
			map.put("content", content);
			SqlSession sqlSession=null;
			int pcount=0;
			
			try {
				sqlSession=getSqlSessionFactory().openSession(true);
				pcount=sqlSession.selectOne(nameSpace+"pcount",map);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return pcount;
		}
		
		
		//글목록 조회(페이징처리): 파라미터가 필요(페이지번호)
		public List<AnsDto> getAllListPage(String pnum,String id,String title,String content){
			List<AnsDto> list=new ArrayList<>();
			Map<String, String> map=new HashMap<>();
			map.put("pnum", pnum);
			map.put("id", id);
			map.put("title", title);
			map.put("content", content);
			SqlSession sqlSession=null;
			
			try {
				SqlSessionFactory sqlSessionFactory=getSqlSessionFactory();
				sqlSession=sqlSessionFactory.openSession(true);//autocommit->true
				list=sqlSession.selectList(nameSpace+"boardlistpaging",map);//list[hkdto,hkdto...]
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return list;
		}
	
	
	
	
	
	//글목록조회(list를 반환)
	public List<AnsDto> getAllList(){
		List<AnsDto> list=new ArrayList<>();
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			list=sqlSession.selectList(nameSpace+"boardlist");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	
	//새글추가(id,title,content값 전달받음)
	public boolean insertBoard(AnsDto dto) {
		int count=0;
		SqlSession sqlSession=null;
		try {
			//         <--SqlSessionFactory객체에서 sqlSession객체를 구함
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.insert(nameSpace+"insertboard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}
	//글상세보기(AnsDto반환)
	public AnsDto getBoard(int seq){
		AnsDto dto=new AnsDto();
		SqlSession sqlSession=null;
		Map<String, Integer> map=new HashMap<>();
		map.put("seq", seq);
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			dto=sqlSession.selectOne(nameSpace+"boardlist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return dto;
	}
	//글수정하기(seq,title,content값 전달받음)
	public boolean updateBoard(AnsDto dto) {
		int count=0;
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.update(nameSpace+"updateboard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}
	//글삭제하기(seq,여러글/글하나 삭제기능 같이사용)
	public boolean mulDel(String[] seqs) {

		int count=0;
		Map<String, String[]>map=new HashMap<>();
		map.put("seqs", seqs);
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.update(nameSpace+"muldel", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return count>0?true:false;
	}
	//조회수(seq)
	public boolean readCount(int seq) {
		int count=0;
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.update(nameSpace+"readcount", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}
	//답글달기(id,title,content,부모의 seq)
	public boolean replyBoard(AnsDto dto) {
		int count=0;
		SqlSession sqlSession=null;
		try {                                         //transaction처리
			sqlSession=getSqlSessionFactory().openSession(false);//autocommit=false
			sqlSession.update(nameSpace+"replyupdate", dto);//update작업
			count=sqlSession.insert(nameSpace+"replyinsert", dto);//insert작업
			sqlSession.commit();//transaction처리
		} catch (Exception e) {
			sqlSession.rollback();//transaction처리
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}
	
	public AnsDto getContent(int seq) {
		AnsDto dto=new AnsDto();
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			dto=sqlSession.selectOne(nameSpace+"contentAjax", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return dto;
	}

}












