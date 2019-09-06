package skt1.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import skt1.dtos.CalDto;



public class Util {

	//action tag: 
	//      <usebean>  :  값을 담고 꺼내는 객체를 사용할때 쓰임 --> Dto형식으로 만들어야 함
	private String arrowNbsp;//depth의 크기만큼 공백만드는 필드
	                         //"&nbsp;&nbsp;&nbsp;<img >"

	//<setProperty> : setMethod를 실행한다.
	public void setArrowNbsp(String depth) {
		String nbsp="";
		int depthInt=Integer.parseInt(depth);
		for (int i = 0; i < depthInt; i++) {
			nbsp+="&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		//                답글이면 nbsp+<img> 출력: 부모글이면 ""
		this.arrowNbsp = (depthInt>0?nbsp+"<img src='img/aaa.png' alt='답글' />":"");
	}
	//<getPropery> : getMethod를 실행하면서 html에 값을 출력
	public String getArrowNbsp() {
		return arrowNbsp;
	}

	//usebean을 쓰기 위한 구조를 만든다 : dto처럼 멤버필드가 있고, get/set메서드가 있는 구조
		private String toDates;
		
		//화면에서 getproperty태그가 호출해줄 메서드
		public String getToDates() {
			return toDates;
		}
		
		//문자열을 날짜형식으로 표현하는 메서드
		//화면에서 setProperty태그가 호출해주 메서드
		public void setToDates(String mDate) {
			//date형식 : yyyy-MM-dd hh:mm:ss
			//문자열을 date타입으로 변환
			String m=mDate.substring(0,4)+"-"	//year
					+mDate.substring(4, 6)+"-"	//month
					+mDate.substring(6, 8)+" "	//date
					+mDate.substring(8, 10)+":"	//hour
					+mDate.substring(10)+":00"; //min
			
			//문자열 -> date타입으로 변환 실행
			Timestamp tm=Timestamp.valueOf(m);
			
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
			this.toDates = sdf.format(tm);
		}

		//값이 한자릿수일때 두자릿수로 변환해주는 메서드
		public static String isTwo(String s) {
			return s.length()<2?"0"+s:s;
		}

		//달력의 날짜에 대한 요일별 폰트색 적용
		public static String fontColor(int dayOfWeek,int i){
			String color="";
			if((dayOfWeek-1+i)%7==0){//0일땐 토요일
				color="blue";
			}else if((dayOfWeek-1+i)%7==1){
				color="red";
			}else{
				color="black";
			}
			return color;
		}
		
		//달력에 해당날짜에 존재하는 일정 구하는 기능
		//list와 해당날짜를 전달받아서 list에 해당날짜를 확인하는 기능을 구현
		public static String getCalView(List<CalDto> list, int i ) {
			//list에는 mdate에 "201908041130"
			String d=isTwo(String.valueOf(i)); //i+"" --> int형을 String으로 변환
			String titleList=""; //달력에서 일정을 출력해줄 문자열
								//<p>title</p>
			for (CalDto calDto : list) {
				if(calDto.getMdate().substring(6, 8).equals(d)) {
					titleList+="<p title='"+calDto.getTitle()+"'  class='clist'>" // title은 리스트에서 마우스로 보면 풀네임 다 나옴
								+(calDto.getTitle().length()>6?calDto.getTitle().substring(0,6)+"..":calDto.getTitle())
								+"</p>";					
				}
			}
			return titleList;
		}
	
	
}
