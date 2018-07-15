package egovframework.example.jqgrid.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.jqgrid.service.JqgridVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("jqgridMapper")
public interface JqgridMapper {
	
	List<EgovMap> selectJqgridList(JqgridVO jqgridVo) throws Exception;
	
	EgovMap selectJqgridListCnt(JqgridVO jqgridVo) throws Exception;

	void insertJqgridList(Map<String, Object> param) throws Exception;

	void updateJqgridList(Map<String, Object> param) throws Exception;

	void deleteJqgridList(Map<String, Object> param)throws Exception;
}
