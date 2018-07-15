package egovframework.example.login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cmmn.CaptchaUtil;
import egovframework.example.cmmn.EgovMessageSource;
import egovframework.example.cmmn.EgovUserDetailsHelper;
import egovframework.example.cmmn.service.Globals;
import egovframework.example.login.service.LoginService;
import egovframework.example.login.service.LoginVO;


@Controller
public class LoginController {

	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	EgovMessageSource egovMessageSource;
	/** log*/
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = "actionLogin.do")
	public String actionLogin(LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		String getAnswer = (String) request.getSession().getAttribute("captcha");
		String answer = request.getParameter("answer");
		
		
		
		
		LoginVO resultVO = loginService.actionLogin(loginVO);
		if(resultVO != null && !resultVO.getId().equals("") && !resultVO.getPassword().equals("")&& getAnswer.equals(answer)) {
			request.getSession().setAttribute("loginVO", resultVO);
			return "redirect:/actionMain.do";
			
		} else {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.msg"));
			
			return "login/login";
		}
	}
	
	@RequestMapping(value = "actionMain.do")
	public String actionMain(ModelMap model) throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", "로그인에 실패하였습니다.");
			return "login/login";
		}
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		LOGGER.debug("User Id : {}", user.getId());
		String main_page = Globals.MAIN_PAGE;
		
		LOGGER.debug("Globals.MAIN_PAGE > " + Globals.MAIN_PAGE);
		LOGGER.debug("main_page > {}", main_page);
		
		return "forward:" + main_page;
	}
	
	@RequestMapping(value = "logoutGo.do")
	public String logoutGo(HttpServletRequest request, ModelMap model) throws Exception{
		request.getSession().setAttribute("loginVO", null);
		
		
		return "redirect:/main.do";
	}
	
	@RequestMapping(value = "captchaImg.do")
	public void cpatchaImg(HttpServletRequest request, HttpServletResponse response) throws Exception{
		new CaptchaUtil().captchaImg(request, response);
	}
	@RequestMapping(value = "captchaAudio.do")
	public void cpatchaAudio(HttpServletRequest request, HttpServletResponse response) throws Exception{
		new CaptchaUtil().captchaAudio(request, response);
	}
	
	
	
	
	
}
