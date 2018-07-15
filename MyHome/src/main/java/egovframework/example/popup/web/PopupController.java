package egovframework.example.popup.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cmmn.DateUtil;
import egovframework.example.cmmn.JsonUtil;
import egovframework.example.popup.service.PopService;

@Controller
public class PopupController {
	
	@Resource(name = "popService")
	private PopService popService;
	
	@RequestMapping(value = "/popupStart.do")
	public String popupStart() throws Exception {

		return "popup/popupStart.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/partnerEduVideo.do")
	public String partnerEduVideo(HttpServletRequest request, ModelMap model) throws Exception {

		String clcoStatDivCode = null;
		
		try {
			
			Map params = makeParamsMap(request);
			
			Map userMap = popService.selectPopUserInfo(params);
				
			clcoStatDivCode = userMap.get("clcoStatDivCode").toString();
			
			model.addAttribute("clcoStatDivCode", clcoStatDivCode);
			model.addAttribute("params", params);
		} catch (Exception e) {

		}

		return "popup/popPartnerEduVideo";
	}
	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(value = "/popRe.do")
	public String popRe(HttpServletRequest request, ModelMap model) throws Exception {
		
		try {
			Map params = makeParamsMap(request);
			
			Map userMap = popService.selectPopUserInfo(params);
			
			String tmp = new SimpleDateFormat("yyyy년 M월 d일 ").format(new Date()); 
			
			System.out.println(tmp);
			
			// 현재 요일 구하기
			System.out.println(DateUtil.getWeek());
			
			model.addAttribute("sDate", 	tmp + DateUtil.getWeek() + "요일");

			Map<String, String> param = new HashMap<String, String>();
			
			// 설문조사 항목 공통코드 테이블에서 가져오기
			param.put("cmbnCodeGroupId", "WRTMN_UTAK_BIZS_CODE");
			
			List<Map> bizList = popService.selectCmbnList(param);
			
			// 설문조사 항목 데이터 확인
			System.out.println(bizList);
			
			// 설문문항 항목 공통코드 테이블에서 가져오기
			param.put("cmbnCodeGroupId", "IND_INFO_QUST_CODE");
			
			List<Map> qustList = popService.selectCmbnList(param);
			
			// 설문문항 항목 데이터 확인
			System.out.println(qustList);
			
			// 설문대상 항목 공통코드 테이블에서 가져오기
			param.put("cmbnCodeGroupId", "EDU_TRG_DIV_CODE");
			
			List<Map> trgList = popService.selectCmbnList(param);
			
			// 설문문항 항목 데이터 확인
			System.out.println(trgList);
			
			String trgKey 	= "";
			String trgValue = "";
			
			for(int i = 0; i < trgList.size(); i++) {
				System.out.println(trgList.get(i).get("cmbnCode").toString());
				System.out.println(userMap.get("clcoStatDivCode").toString());
				//낙타등 표기법으로 누가 변환해주나~
				if(trgList.get(i).get("cmbnCode").toString().equals(userMap.get("clcoStatDivCode").toString())) {
					
					trgKey 		= trgList.get(i).get("cmbnCode").toString();
					trgValue 	= trgList.get(i).get("cmbnCodeNm").toString();
				}
			}

			System.out.println("trgKey :"+trgKey);
			System.out.println("trgValue :"+trgValue);
			
			model.addAttribute("userMap", 	userMap);
			model.addAttribute("bizList", 	bizList);
			model.addAttribute("qustList", 	qustList);
			model.addAttribute("trgKey", 	trgKey);
			model.addAttribute("trgValue", 	trgValue);
			
			// 현재날짜를 stirng 으로 번환 yyyymmdd 형태로
			model.addAttribute("nowDate", DateUtil.getShortDateString());
		} catch (Exception e) {

			System.out.println(e);
		}
		
		return "popup/popRe";
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/popVi.do")
	public String popVi(HttpServletRequest request, ModelMap model) throws Exception {
		
		try {
			
			Map params = makeParamsMap(request);
			
			Map userMap = popService.selectPopUserInfo(params);
			
			String tmp = new SimpleDateFormat("yyyy년 M월 d일 ").format(new Date()); 
			
			model.addAttribute("sDate", 	tmp + DateUtil.getWeek() + "요일");

			Map<String, String> param = new HashMap<String, String>();

			param.put("cmbnCodeGroupId", "WRTMN_UTAK_BIZS_CODE");
			
			List<Map> bizList = popService.selectCmbnList(param);

			param.put("cmbnCodeGroupId", "IND_INFO_QUST_CODE");
			
			List<Map> qustList = popService.selectCmbnList(param);

			param.put("cmbnCodeGroupId", "EDU_TRG_DIV_CODE");
			
			List<Map> trgList = popService.selectCmbnList(param);
			
			String trgKey 	= "";
			String trgValue = "";
			
			for(int i = 0; i < trgList.size(); i++) {

				if(trgList.get(i).get("cmbnCode").toString().equals(userMap.get("clcoStatDivCode").toString())) {
					
					trgKey 		= trgList.get(i).get("cmbnCode").toString();
					trgValue 	= trgList.get(i).get("cmbnCodeNm").toString();
				}
			}
			
			// 메인 테이블 정보 가져오기 
			Map tsmIndInfoEduMgtInfo = popService.selectTsmIndInfoEduMgtInfo(params);
			
			// 맵을 String화
			String wrtmnUtakBizsCodeSt = (String) tsmIndInfoEduMgtInfo.get("wrtmnUtakBizsCode");
			
			String[] wrtmnUtakBizsCodeSp = wrtmnUtakBizsCodeSt.split(",");
			
			System.out.println(wrtmnUtakBizsCodeSp.length);
			System.out.println(wrtmnUtakBizsCodeSt);
			
			for(int i = 0; i < bizList.size(); i++) {
				
				System.out.println("bizList.get("+i+").getcmbnCode >>>>"+bizList.get(i).get("cmbnCode"));
				
				for(int j = 0; j < wrtmnUtakBizsCodeSp.length; j++) {
					
					System.out.println("bb.["+j+"] "+ wrtmnUtakBizsCodeSp[j]);
					
					if(bizList.get(i).get("cmbnCode").equals(wrtmnUtakBizsCodeSp[j])) {
						
						bizList.get(i).put("checked", "checked");
						
						System.out.println("checked true");
					}
				}
			}
			
			System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
			System.out.println(bizList);
			System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
			
			// 상세 테이블 정보 가져오기
			List<Map> tsmIndInfoEduDtlList = popService.selectTsmIndInfoEduDtlList(params);
			
			model.addAttribute("userMap", 	userMap);
			model.addAttribute("bizList", 	bizList);
			model.addAttribute("qustList", 	qustList);
			model.addAttribute("trgKey", 	trgKey);
			model.addAttribute("trgValue", 	trgValue);
			model.addAttribute("tsmIndInfoEduMgtInfo", tsmIndInfoEduMgtInfo);
			model.addAttribute("tsmIndInfoEduDtlList", tsmIndInfoEduDtlList);

			model.addAttribute("nowDate", DateUtil.getShortDateString());
		} catch (Exception e) {

		}
		
		return "popup/popVi";
	}
	
	@RequestMapping(value = "/checkRadioSave.do")
	public void checkRadioSave(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		PrintWriter out = null;
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();

		response.setCharacterEncoding("UTF-8");
		
		try {

			popService.checkRadioSaveTx(request);

			resMap.put("result",    true);
			
			out = response.getWriter();
			
			out.write(JsonUtil.HashMapToJson(resMap).toString());
		} catch (Exception e) {

		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static HashMap makeParamsMap(HttpServletRequest request) {
		
        HashMap returnVal = new HashMap();
      
        Enumeration enums = request.getParameterNames();
      
	    while(enums.hasMoreElements()) {
	    	  
	        String paramName = (String)enums.nextElement();
	        
	        String[] parameters = request.getParameterValues(paramName);

	        if(parameters.length > 1) {
	        	
	            returnVal.put(paramName, parameters);
	          
	        } else {
	        	
	            returnVal.put(paramName, parameters[0]);
	        }
	    }

      	return returnVal;
    }
}
