package egovframework.example.unit.web;



import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class unitController {
	

	

	/*유닛 리스트*/
	@RequestMapping(value = "elixirUnit.do")
	public String elixirunit(ModelMap model) throws Exception {
		return "unit/elixirunitList.tiles";
	}
	
	@RequestMapping(value = "darkElixirUnit.do")
	public String darkelixirunit(ModelMap model) throws Exception {
		return "unit/darkElixirUnitList.tiles";
	}
	
	/*엘릭서 유닛*/
	@RequestMapping(value = "archer.do")
	public String archer(ModelMap model) throws Exception {
		return "unit/archer.tiles";
	}
	@RequestMapping(value = "balloon.do")
	public String balloon(ModelMap model) throws Exception {
		return "unit/balloon.tiles";
	}
	@RequestMapping(value = "babyDragon.do")
	public String babyDragon(ModelMap model) throws Exception {
		return "unit/babyDragon.tiles";
	}
	@RequestMapping(value = "babarian.do")
	public String babarian(ModelMap model) throws Exception {
		return "unit/babarian.tiles";
	}
	@RequestMapping(value = "dragon.do")
	public String dragon(ModelMap model) throws Exception {
		return "unit/dragon.tiles";
	}
	@RequestMapping(value = "giant.do")
	public String giant(ModelMap model) throws Exception {
		return "unit/giant.tiles";
	}
	@RequestMapping(value = "goblin.do")
	public String goblin(ModelMap model) throws Exception {
		return "unit/goblin.tiles";
	}
	@RequestMapping(value = "hiller.do")
	public String hiller(ModelMap model) throws Exception {
		return "unit/hiller.tiles";
	}
	@RequestMapping(value = "miner.do")
	public String miner(ModelMap model) throws Exception {
		return "unit/miner.tiles";
	}
	@RequestMapping(value = "pekka.do")
	public String pekka(ModelMap model) throws Exception {
		return "unit/pekka.tiles";
	}
	@RequestMapping(value = "wallBreak.do")
	public String wallBreak(ModelMap model) throws Exception {
		return "unit/wallBreak.tiles";
	}
	@RequestMapping(value = "wizard.do")
	public String wizard(ModelMap model) throws Exception {
		return "unit/wizard.tiles";
	}
	
	/*다크엘릭서 유닛*/
	

	@RequestMapping(value = "baller.do")
	public String baller(ModelMap model) throws Exception {
		return "unit/baller.tiles";
	}
	@RequestMapping(value = "golem.do")
	public String golem(ModelMap model) throws Exception {
		return "unit/golem.tiles";
	}
	@RequestMapping(value = "hog.do")
	public String hog(ModelMap model) throws Exception {
		return "unit/hog.tiles";
	}
	@RequestMapping(value = "lava.do")
	public String lava(ModelMap model) throws Exception {
		return "unit/lava.tiles";
	}
	@RequestMapping(value = "minian.do")
	public String minian(ModelMap model) throws Exception {
		return "unit/minian.tiles";
	}
	@RequestMapping(value = "valkyrie.do")
	public String valkyrie(ModelMap model) throws Exception {
		return "unit/valkyrie.tiles";
	}
	@RequestMapping(value = "witch.do")
	public String witch(ModelMap model) throws Exception {
		return "unit/witch.tiles";
	}
	
	
	

	
	
}
