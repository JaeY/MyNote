package egovframework.example.server.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.server.service.ServerSideService;
import egovframework.example.server.service.ServerSideVO;

@Controller
public class ServerSideController {
	@Resource
	Validator validator;
	
	@Resource(name = "serverSideService")
	private ServerSideService serverSideService;
	
	@InitBinder /*각 메서드에 파리미터를 바인딩 하기 전에 호출된다.*/
	public void initBinder(WebDataBinder dataBinder) {
		dataBinder.setValidator(this.validator);
	}
	
	
	@RequestMapping(value = "/serverSide.do")
	public String serverSide(ServerSideVO serverSideVO) throws Exception {
		
		return "serverSide/serverSide";
	}
	
	@RequestMapping(value = "/serverSideCheck.do")
	/*벨리데이트 어노테이션이 붙은 메서드만 벨리데이터 검사를 한다(두개가 짝궁이다)*/
	public String serverSideCheck(@Validated ServerSideVO serverSideVO
			, BindingResult bindingResult, ModelMap model) throws Exception {
		
		/*bindingResult에 hasErrors는 벨리데이션 체크의 결과값을 불린 으로준다*/
		if (bindingResult.hasErrors()) {
			model.addAttribute("eSangMu", "N");
		} else {
			model.addAttribute("eSangMu", "Y");
		}
		
		return "serverSide/serverSide";
	}
	
	@RequestMapping(value = "/serverSideInsert.do", method = RequestMethod.POST)
	   public String serverSideInsert(ServerSideVO serverSideVO) throws Exception {
	      
	      serverSideService.insertMber(serverSideVO);

	      return "forward:/egovLoginUsr.do";
	   }
	
	@RequestMapping(value = "/egovLoginUsr.do")
	public String loginUsrView(ServerSideVO serverSideVO) throws Exception {
		System.out.println("포워드를 하면 "+serverSideVO.getMberId());
		
		return "login/login";
	}
}
