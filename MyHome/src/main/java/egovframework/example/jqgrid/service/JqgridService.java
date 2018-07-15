package egovframework.example.jqgrid.service;

import java.util.List;

import org.json.JSONArray;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface JqgridService {
	List<EgovMap> selectJqgridList(JqgridVO jqgridVo) throws Exception;
	
	EgovMap selectJqgridListCnt(JqgridVO jqgridVo) throws Exception;

	void saveJqGridTx(JSONArray jsonArray) throws Exception;

	void deleteJqgridTx(JSONArray jsonArray) throws Exception;
}
