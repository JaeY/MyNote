package egovframework.example.jqgrid.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.jqgrid.service.JqgridService;
import egovframework.example.jqgrid.service.JqgridVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("jqgridService")
public class JqgridServiceImpl implements JqgridService {
	
	@Resource(name="jqgridMapper")
	private JqgridMapper jqgridMapper;

	@Override
	public List<EgovMap> selectJqgridList(JqgridVO jqgridVo) throws Exception {
		return jqgridMapper.selectJqgridList(jqgridVo);
	}

	@Override
	public EgovMap selectJqgridListCnt(JqgridVO jqgridVo) throws Exception {
		return jqgridMapper.selectJqgridListCnt(jqgridVo);
	}

	@Override
	public void saveJqGridTx(JSONArray jsonArray) throws Exception {
		int iLength1 = jsonArray.length();
		
		try {
			for(int i=0; i<iLength1; i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				
				Map<String, Object> param = JsonUtil.JsonToMap(jsonObject.toString());
				//json 을 맵으로 변환 시킨다 왜? sql 에서 parametertype이 map 이라서.
				if("I".equals(param.get("editType"))) {
					jqgridMapper.insertJqgridList(param); //mapper 로 param 보내기
				} else if ("D".equals(param.get("editType"))) {
					jqgridMapper.deleteJqgridList(param); //mapper 로 param 보내기
				}
			}
		} catch (Exception ex) {
			throw ex;
		}
	}
	/*@Override
	public void deleteJqgridTx(JSONArray jsonArray) throws Exception {

	int iLength1 = jsonArray.length();

	        try {
	            
	        for(int i=0; i<iLength1; i++) {
	        
	                JSONObject jsonObject = jsonArray.getJSONObject(i);

	                Map<String, Object> param = JsonUtil.JsonToMap(jsonObject.toString());
	                
	                if("U".equals(param.get("editType"))) {
	                
	                jqgridMapper.deleteJqgridList(param);
	                }
	            }
	} catch (Exception e) {
	            
	throw e;
	}
	}*/

	@Override
	public void deleteJqgridTx(JSONArray jsonArray) throws Exception {
		// TODO Auto-generated method stub
		
	}
}
