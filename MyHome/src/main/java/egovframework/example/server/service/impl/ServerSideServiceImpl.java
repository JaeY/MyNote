package egovframework.example.server.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.EgovFileScrty;
import egovframework.example.server.service.ServerSideService;
import egovframework.example.server.service.ServerSideVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("serverSideService")
public class ServerSideServiceImpl extends EgovAbstractServiceImpl implements ServerSideService {

	/** 유일키 제공 서비스*/
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;
	
	@Resource(name="serverSideMapper")
	private ServerSideMapper serverSideMapper;
	
	@Override
	   public void insertMber(ServerSideVO serverSideVO) throws Exception {
	      
	      String uniqId = idgenService.getNextStringId();

	      serverSideVO.setUniqId(uniqId);
	      
	      String pass = EgovFileScrty.encryptPassword(serverSideVO.getPassword(), serverSideVO.getMberId());
	      
	      serverSideVO.setPassword(pass);

	      serverSideMapper.insertMber(serverSideVO);
	   }
	
}