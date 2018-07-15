package egovframework.example.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.EgovFileScrty;
import egovframework.example.cmmn.EgovMessageSource;
import egovframework.example.login.service.LoginService;
import egovframework.example.login.service.LoginVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("loginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {
	
	@Resource(name="loginMapper")
	private LoginMapper loginMapper;
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Override
	public LoginVO actionLogin(LoginVO loginVO) throws Exception {
	String enpassword = EgovFileScrty.encryptPassword(loginVO.getPassword(), loginVO.getId());
	loginVO.setPassword(enpassword);
	LoginVO loginVOG = loginMapper.actionLogin(loginVO);
	
	if(loginVOG != null && !loginVOG.getId().equals("") && !loginVOG.getPassword().equals("")) {
		return loginVOG;
	} else {
		loginVOG = new LoginVO();
	}
	
	return loginVOG;
	}
}