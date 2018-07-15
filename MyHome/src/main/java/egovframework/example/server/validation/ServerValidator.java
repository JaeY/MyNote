package egovframework.example.server.validation;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class ServerValidator implements Serializable {

	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = 354001029809426261L;

	private ServerValidator() {
		// not called
	}
	
	/**
	 * 아이디와 비밀번호 중복 체크
	 *  
	 * @param id
	 * @param passwd
	 * @param overlap
	 * @return
	 */
	public static boolean isValidPasswordOverlap(String id, String passwd, int overlap) {
		
		int length = passwd.length();
		
		// 만약 비밀번호 자릿수가 overlap보다 작다면 
		// 비교할 필요가 없다고 판단
		if(length < overlap) {
			return true;
		}
		
		String group = passwd.substring(0, overlap); // overlap 갯수만큼 글자를 가져옴
		int endIdx = 0;
		
		StringBuilder build = new StringBuilder();
		build.append("("+ group +")");
		
		for(int i = 1; i < length; i++) {
			
			endIdx = (i + overlap);
			
			// endIdx값 비밀번호 자릿수보다 크다면 
			// 더 이상 그룹화 할것이 없다고 판단
			if(endIdx > length) {
				break;
			}
			
			group = passwd.substring(i, endIdx); 
			build.append("|("+ group +")");
		}
		
		Pattern pattern = Pattern.compile(build.toString());
        Matcher matcher = pattern.matcher(id);
        
        if(matcher.find()) {
            
        	// 매칭된 글자의 끝에서 시작을 뺀 값이 
        	// overlap 값과 같다면 중복이 되었다고 판단
        	if((matcher.end() - matcher.start()) == overlap) {
        		return false;
        	}
        }
		
		return true;
	}
	
	/**
	 * 비밀번호 확인 유효성 체크
	 * 
	 * @param passwd
	 * @param passCheck
	 * @return
	 */
	public static boolean isValidPasswordCheck(String passwd, String passCheck) {
		
		return (passCheck != null && passCheck.equals(passwd));
	}
}
