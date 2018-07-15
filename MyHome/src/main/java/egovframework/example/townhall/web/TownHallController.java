package egovframework.example.townhall.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import egovframework.example.townhall.service.TownHallService;

@Controller
public class TownHallController {
	
	@Resource(name = "townHallService")
	   private TownHallService townHallService;
	

	
	@ModelAttribute("townHallList")
	public List<Map> welcomeWebList(ModelMap model) throws Exception {
	return townHallService.selectWelcomeWebServiceList();
	}
		


	
	@RequestMapping(value = "townHall.do")
	public String townHall(HttpServletRequest request,ModelMap model) throws Exception {
	
		
		String[] arr = request.getParameterValues("hanq"); 
		model.addAttribute("arr",arr);
		
		return "townHall/townHall.tiles";
	}
	
	


}
