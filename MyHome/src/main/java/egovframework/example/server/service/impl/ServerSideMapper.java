package egovframework.example.server.service.impl;

import egovframework.example.server.service.ServerSideVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper("serverSideMapper")
public interface ServerSideMapper {

	public void insertMber(ServerSideVO serverSideVO) throws Exception;
	
	
}