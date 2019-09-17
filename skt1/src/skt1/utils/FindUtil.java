package skt1.utils;


public class FindUtil {

	public static String getNewPwd() throws Exception{
		char[] charSet = {'0','1','2','3','4','5','6','7','8','9',
						'A','B','C','D','E','F','G','H','I','J','K',
						'L','M','N','O','P','Q','R','S','T','U','V',
						'W','X','Y','Z',
						'!','@','#','$','%','^','&','*'};
		
		StringBuffer newkey= new StringBuffer();
		
		for(int i =0; i<10; i++) {
			int idx=(int) (charSet.length * Math.random());
			newkey.append(charSet[idx]);
		}
		
		
		return newkey.toString();
		}
}
