package egovframework.example.townhall.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.townhall.service.HanqVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("townHallMapper")
public interface TownHallMapper {


	
	List<Map> selectWelcomeWebServiceList()throws Exception;
	
	

}

