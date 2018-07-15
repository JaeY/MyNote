package egovframework.example.popup.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface PopService {

	@SuppressWarnings("rawtypes")
	Map selectPopUserInfo(Map params) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectCmbnList(Map<String, String> param) throws Exception;

	void checkRadioSaveTx(HttpServletRequest request) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map selectTsmIndInfoEduMgtInfo(Map<String, String> param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectTsmIndInfoEduDtlList(Map<String, String> param) throws Exception;
}
