package egovframework.example.jqgrid.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.jqgrid.service.JqgridService;
import egovframework.example.jqgrid.service.JqgridVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class JqgridController {
	
	@Resource(name="jqgridService")
	private JqgridService jqgridService;
	
	@RequestMapping(value = "jqgridStart.do")
	public String jqgridStart() throws Exception {

		return "jqgrid/jqgridStart";
	}
	
	@RequestMapping(value = "jqgridUID.do")
	public String jqgridUID() throws Exception {

		return "jqgrid/jqgridUID";
	}
	
	@RequestMapping(value="jqgridStartMain.do")
	public void jqgridStartMain(HttpServletRequest request, HttpServletResponse response, @ModelAttribute JqgridVO jqgridVO, ModelMap model) throws Exception {
		System.out.println("enter");
		PrintWriter out = null;
		response.setCharacterEncoding("UTF-8");
		
		String quotZero = request.getParameter("param");
		System.out.println(quotZero);
		
		quotZero = quotZero.replaceAll("&quot;", "\"");
		System.out.println(quotZero);
		
		Map<String, Object> castMap = new HashMap<String, Object>();
		//castMap 은  serviceimplYn을 json string으로 받았으니 맵인 자바객체로 바꿔준다.
		castMap = JsonUtil.JsonToMap(quotZero);
		
		jqgridVO.setServiceImplYn((String) castMap.get("serviceImplYn"));
		
		List<EgovMap> jqGridList = jqgridService.selectJqgridList(jqgridVO);
		//jqGridList 는 그리드에 붙을 한줄 한줄이다.
		EgovMap jqGridListCnt = jqgridService.selectJqgridListCnt(jqgridVO);
		//jqGridListCnt 는 그리드의 총 갯수를 가져온다.
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put("records", jqGridListCnt.get("totaltotcnt"));
		resMap.put("rows", jqGridList);
		resMap.put("page", request.getParameter("page"));
		resMap.put("total", jqGridListCnt.get("totalpage"));
		System.out.println("dd"+jqGridListCnt.get("totalpage")); // 전부소문자 egovMap이 다 변환시킴
		
		out = response.getWriter();
		
		out.write(JsonUtil.HashMapToJson(resMap).toString());
		
		System.out.println(resMap);
		System.out.println(JsonUtil.HashMapToJson(resMap).toString()); // ajax는 json으로 보내고 받아야한다.

	}
	/*@RequestMapping(value = "deleteJqgrid.do")
	public @ResponseBody String deleteJqgrid(@RequestParam String param1) throws Exception {

	String result = "";

	try {
	param1 = param1.replaceAll("&quot;", "\"");

	        JSONArray jsonArray = new JSONArray(param1);
	        
	        jqgridService.deleteJqgridTx(jsonArray);

	result = "SUCCESS";

	} catch (Exception e) {

	result = "FAIL";
	}

	    return  result;
	}*/
	
	@RequestMapping(value = "saveJqgrid.do")
	public @ResponseBody String saveJqgrid(@RequestParam String param1) throws Exception {
		// @ResponseBody 는 그대로 내려줘서 타입을 바꿔주지 않아도 된다.
		//@ResponseBody 는 param1이 json 이기때문에 설정해준것이다 jackson 라이브러리를 메이븐에 넣어서 할수 있지만.
		//스프링 4.0부터는 기본적으로 jackson 라이브러리가 포함되어 있다 그래서 기존의 jackson 라이브러리를 메이븐에 추가해주는 작업을 하지않아도된다.
		//스피링 4.0 부터는 @RestController 를 사용할수 있다. @ResponseBody를 안붙여도 알아서 json 방식으로 파싱된다.
		//@ResponseBody 안써주면 인자로 받아오는 param1에서 에러가 발생함.
		
		String result = ""; //스크립트쪽에 응답할때 넣을 문자열이다.(성공인지 실패인지)
		System.out.println("save진입");
		// param1은 jsonObject이지만 string이다
		try {
			System.out.println("try");
			param1 = param1.replaceAll("&quot;", "\"");
			System.out.println("param1: " +param1);
			
			JSONArray jsonArray = new JSONArray(param1); //JSON 배열 만든다. 
			
			System.out.println(jsonArray);
			System.out.println("saveJqgrid.do : "+jsonArray);
			
			jqgridService.saveJqGridTx(jsonArray); //JSON배열을 서비스에 태운다. 
			//saveJqgridTx 의 Tx는 트랜잭션을 담당하는 이름이다.
			//서비스에 void saveJqGridTx 가 있어야 한다.
			//서비스 임플에서 정보를 뜯게된다.
			result = "SUCCESS";//다음 result success 를 스크립트쪽으로 넘겨준다.
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
}