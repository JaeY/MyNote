package egovframework.example.townhall.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.townhall.service.HanqVO;

import egovframework.example.townhall.service.TownHallService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("townHallService")
public class TownHallServiceImpl extends EgovAbstractServiceImpl implements TownHallService {
	
	@Resource(name="townHallMapper")
	private TownHallMapper townHallMapper;
	

	

	
	
	@Override
	public List<Map> selectWelcomeWebServiceList() throws Exception {
		return townHallMapper.selectWelcomeWebServiceList();
	}
	
	

}