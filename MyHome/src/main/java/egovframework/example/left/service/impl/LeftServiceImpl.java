package egovframework.example.left.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.left.service.LeftService;

@Service("leftService")
public class LeftServiceImpl implements LeftService {

	@Resource(name="leftMapper")
	private LeftMapper leftMapper;
	@Override
	public List<?> selectMainMenu() throws Exception {
		return leftMapper.selectMainMenu();
	}
	
	@Override
	public List<?> selectSubMenu(String menuId) throws Exception {
		return leftMapper.selectSubMenu(menuId);
	}
}
