/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.popup.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.popup.service.PopService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("popService")
public class PopServiceImpl extends EgovAbstractServiceImpl implements PopService {

	@Resource(name="popMapper")
	private PopMapper popMapper;
	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectPopUserInfo(Map params) throws Exception {

		return popMapper.selectPopUserInfo(params);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectCmbnList(Map<String, String> param) throws Exception {

		return popMapper.selectCmbnList(param);
	}

	@Override
	public void checkRadioSaveTx(HttpServletRequest request) throws Exception {
		
		String mainInfo = request.getParameter("mainInfo");
		String qustList = request.getParameter("qustList");
		String signTgrNo = request.getParameter("signTrgNo");
		
		System.out.println(mainInfo);
		System.out.println(qustList);
		System.out.println(signTgrNo);
		
		mainInfo = mainInfo.replaceAll("&quot;", "\"");
		qustList = qustList.replaceAll("&quot;", "\"");
		
		System.out.println(mainInfo);
		System.out.println(qustList);
		
		Map<String, Object> mainInfoMap = JsonUtil.JsonToMap(mainInfo);
		
		List<Map<String, Object>> qustMapList = JsonUtil.JsonToList(qustList);
		
		String stringChange = mainInfoMap.get("wrtmnUtakBizsCode").toString();
		
		System.out.println(stringChange);
		
		stringChange = stringChange.replace("[", "");
		System.out.println(stringChange);
		
		stringChange = stringChange.replace("]", "");
		System.out.println(stringChange);
		
		stringChange = stringChange.replace(" ", "");
		System.out.println(stringChange);
		
		mainInfoMap.put("wrtmnUtakBizsCode", stringChange);
		
		mainInfoMap.put("signTrgNo", signTgrNo);		

		popMapper.insertTsmIndInfoEduMgt(mainInfoMap);

		for(int i = 0; i < qustMapList.size(); i++) {
			
			Map<String, Object> qustMap = new HashMap<String, Object>();
			
			qustMap.put("qustCode", 	qustMapList.get(i).get("qustCode"));
			qustMap.put("qustCodeNm", 	qustMapList.get(i).get("qustCodeNm"));
			qustMap.put("signTrgNo", 	signTgrNo);

			popMapper.insertTsmIndInfoEduDtl(qustMap);
		}
		
		popMapper.updateUserInfo(mainInfoMap);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectTsmIndInfoEduMgtInfo(Map<String, String> param)
			throws Exception {

		return popMapper.selectTsmIndInfoEduMgtInfo(param);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectTsmIndInfoEduDtlList(Map<String, String> param)
			throws Exception {

		return popMapper.selectTsmIndInfoEduDtlList(param);
	}
}