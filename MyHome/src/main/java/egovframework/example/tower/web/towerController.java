package egovframework.example.tower.web;



import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class towerController {
	

	

	/*건물 리스트*/
	@RequestMapping(value = "defenseTowerList.do")
	public String defenseTowerList(ModelMap model) throws Exception {
		return "tower/defenseTowerList.tiles";
	}
	
	@RequestMapping(value = "eccTowerList.do")
	public String eccTowerList(ModelMap model) throws Exception {
		return "tower/eccTowerList.tiles";
	}
	
	/*방어타워*/
	@RequestMapping(value = "airDefense.do")
	public String airDefense(ModelMap model) throws Exception {
		return "tower/airDefense.tiles";
	}
	@RequestMapping(value = "airSweeper.do")
	public String airSweeper(ModelMap model) throws Exception {
		return "tower/airSweeper.tiles";
	}
	@RequestMapping(value = "archerTower.do")
	public String archerTower(ModelMap model) throws Exception {
		return "tower/archerTower.tiles";
	}
	@RequestMapping(value = "bombTower.do")
	public String bombTower(ModelMap model) throws Exception {
		return "tower/bombTower.tiles";
	}
	@RequestMapping(value = "cannon.do")
	public String cannon(ModelMap model) throws Exception {
		return "tower/cannon.tiles";
	}
	@RequestMapping(value = "eagleArtillery.do")
	public String eagleArtillery(ModelMap model) throws Exception {
		return "tower/eagleArtillery.tiles";
	}
	@RequestMapping(value = "hiddenTesla.do")
	public String hiddenTesla(ModelMap model) throws Exception {
		return "tower/hiddenTesla.tiles";
	}
	@RequestMapping(value = "infernoTower.do")
	public String infernoTower(ModelMap model) throws Exception {
		return "tower/infernoTower.tiles";
	}
	@RequestMapping(value = "mortar.do")
	public String mortar(ModelMap model) throws Exception {
		return "tower/mortar.tiles";
	}
	@RequestMapping(value = "wizardTower.do")
	public String wizardTower(ModelMap model) throws Exception {
		return "tower/wizardTower.tiles";
	}
	@RequestMapping(value = "xbow.do")
	public String xbow(ModelMap model) throws Exception {
		return "tower/xbow.tiles";
	}
	
	/*기타건물*/
	
	@RequestMapping(value = "setunit.do")
	public String setunit(ModelMap model) throws Exception {
		return "tower/setunit.tiles";
	}
	@RequestMapping(value = "training.do")
	public String training(ModelMap model) throws Exception {
		return "tower/training.tiles";
	}
	@RequestMapping(value = "darktraining.do")
	public String darktraining(ModelMap model) throws Exception {
		return "tower/darktraining.tiles";
	}
	@RequestMapping(value = "clancastle.do")
	public String clancastle(ModelMap model) throws Exception {
		return "tower/clancastle.tiles";
	}
	@RequestMapping(value = "darkmagicfactory.do")
	public String darkmagicfactory(ModelMap model) throws Exception {
		return "tower/darkmagicfactory.tiles";
	}
	@RequestMapping(value = "laboratory.do")
	public String laboratory(ModelMap model) throws Exception {
		return "tower/laboratory.tiles";
	}
	@RequestMapping(value = "magicfactory.do")
	public String magicfactory(ModelMap model) throws Exception {
		return "tower/magicfactory.tiles";
	}
	

	
	

	
	
}
