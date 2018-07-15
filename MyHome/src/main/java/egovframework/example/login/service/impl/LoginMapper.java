package egovframework.example.login.service.impl;



import egovframework.example.login.service.LoginVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("loginMapper")
public interface LoginMapper {

	LoginVO actionLogin(LoginVO loginVO);
	
}
