
package egovframework.example.popup.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("popMapper")
public interface PopMapper {
	
	@SuppressWarnings("rawtypes")
	Map selectPopUserInfo(Map params) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectCmbnList(Map<String, String> param) throws Exception;
	
	void insertTsmIndInfoEduMgt(Map<String, Object> mainInfoMap) throws Exception;
	
	void insertTsmIndInfoEduDtl(Map<String, Object> qustMap) throws Exception;

	void updateUserInfo(Map<String, Object> mainInfoMap) throws Exception;;
	
	@SuppressWarnings("rawtypes")
	Map selectTsmIndInfoEduMgtInfo(Map<String, String> param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectTsmIndInfoEduDtlList(Map<String, String> param) throws Exception;
}
