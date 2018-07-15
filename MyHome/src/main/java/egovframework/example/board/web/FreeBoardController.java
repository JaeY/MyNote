package egovframework.example.board.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.board.service.BoardPagingVO;
import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.FreeBoardService;
import egovframework.example.cmmn.JsonUtil;
import egovframework.example.login.service.LoginVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class FreeBoardController {
	
	@Resource(name = "freeBoardService")
	   private FreeBoardService freeBoardService;
	
	@ModelAttribute("userName")
	public LoginVO user(HttpServletRequest request) throws Exception{
		return (LoginVO)request.getSession().getAttribute("loginVO");
	}
	
	
	@RequestMapping(value = "/boardList.do")
	public String freeBoardList(HttpServletRequest request,ModelMap model, BoardPagingVO boardPagingVO) throws Exception {
		
		List<EgovMap> freeBoardList = null;
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			freeBoardList = freeBoardService.selectBoardList(boardPagingVO);
			EgovMap pagingList = freeBoardService.selectBoardListCnt(boardPagingVO);
			
			resMap.put("page",	 	boardPagingVO.getPage());
			resMap.put("pageScale", boardPagingVO.getPageScale());
			resMap.put("totalPage", pagingList.get("totalPage"));
			int pageGroup = (int)Math.ceil((double)boardPagingVO.getPage()/boardPagingVO.getPageScale());
			
			long startPage = (pageGroup - 1) * boardPagingVO.getPageScale() + 1;   
			boardPagingVO.setStartPage(startPage); 
		    resMap.put("startPage", boardPagingVO.getStartPage());
		    
		    long endPage = startPage + boardPagingVO.getPageScale() - 1; 
		    boardPagingVO.setEndPage(endPage);
		    resMap.put("endPage", boardPagingVO.getEndPage()); 
		    
		    long prePage = (pageGroup - 2) * boardPagingVO.getPageScale() + 1;
		    long nextPage = pageGroup * boardPagingVO.getPageScale() + 1;  
			
		    resMap.put("nextPage", nextPage);
		    resMap.put("prePage", prePage);
		    resMap.put("pageGroup", pageGroup);
			
		} catch(Exception e) {
			System.out.println("에러입니다");
			e.printStackTrace();
		}
		
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("resMap",    resMap);
		return "board/boardList.tiles";
	}
	
	
	@RequestMapping(value = "/boardDetail.do")
	public String boardDetail(HttpServletRequest request, ModelMap model) throws Exception {
		BoardVO boardVO = boardGetOneRow(request, model);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String writer = boardVO.getWriter();
		List<EgovMap> replyList = new ArrayList<EgovMap>();
		
		int 	favoriteTotCnt = 0,
			    favoriteOwnCnt = 0,
			hno				   = boardVO.getHno(),
			previousHno		   = 0,
			nextHno			   = 0;
		
		LoginVO userName = (LoginVO)model.get("userName");
		System.out.println(writer);
		try{
			if(!writer.equals(userName.getId())){
				freeBoardService.updateViewCnt(hno);
			}
			paramMap.put("hno", hno);
			paramMap.put("memberNm", userName.getId());
			
			favoriteTotCnt = freeBoardService.selectFavoriteTotCnt(paramMap);
			favoriteOwnCnt = freeBoardService.selectFavoriteOwnCnt(paramMap);
			previousHno = freeBoardService.getPreviousHno(hno);
			nextHno =  freeBoardService.getNextHno(hno);
			
			replyList = freeBoardService.selectReplyList(paramMap);
			
		} catch (Exception e) {
			
		}
		model.addAttribute("replyList", replyList);
		model.addAttribute("favoriteTotCnt", favoriteTotCnt);
		model.addAttribute("favoriteOwnCnt", favoriteOwnCnt);
		model.addAttribute("previousHno", previousHno);
		model.addAttribute("nextHno", nextHno);
		
		return "board/boardDetail.tiles";
		
	}
	
	
	@RequestMapping(value = "/boardInsertForm.do")
	public String boardInsertForm(ModelMap model)throws Exception{
		return "board/boardInsertForm.tiles";
	}
	
	
	@RequestMapping(value = "/boardInsert.do")
	public String boardInsert(@ModelAttribute BoardVO boardVO, ModelMap model)throws Exception {
		int hno = 0;
		try{
			hno = freeBoardService.getBoardHno();
			boardVO.setHno(hno);
			
			freeBoardService.insertBoardList(boardVO);
			System.out.println("model : " + model.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/boardDetail.do?hno=" + hno;
	}
	
	
	@RequestMapping(value = "/boardUpdateForm.do")
	public String boardUpdateForm(HttpServletRequest request, ModelMap model) throws Exception {
		
		boardGetOneRow(request, model);
		
		return "board/boardUpdateForm.tiles";
	}


	private BoardVO boardGetOneRow(HttpServletRequest request, ModelMap model) {
		String hno = request.getParameter("hno");
		int hnoInt = Integer.parseInt(hno);
		
		BoardVO boardVO = new BoardVO();
		
		try{
			boardVO = freeBoardService.boardDetail(hnoInt);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("boardVO", boardVO);
		return boardVO;
	}
	
	@RequestMapping(value = "/boardUpdate.do")
	public String boardUpdate(@ModelAttribute BoardVO boardVO, ModelMap model) throws Exception {
		System.out.println("boardVO : " + boardVO);
		try{
			freeBoardService.updateBoardList(boardVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		int hno = boardVO.getHno();
		return "redirect:/boardDetail.do?hno=" + hno;
	}
	
	@RequestMapping(value = "/boardDelete.do")
	public String boardDelete(@ModelAttribute BoardVO boardVO) throws Exception{
		int hno = boardVO.getHno();
		try{
			freeBoardService.deleteBoardList(hno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/boardList.do";
	}
	
	
	@RequestMapping(value="/changeFavorite.do")
	public void changeFavorite(@RequestBody String param,HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {
		System.out.println("changeFavorite param : " + param);
		LoginVO userName = (LoginVO)model.get("userName");
		
		try{
			System.out.println("JsonUtil.JsonTOMap 사용 전 : " + param);
			Map<String, Object> paramMap = JsonUtil.JsonToMap(param);
			System.out.println("JsonUtil.JsonTOMap 사용 후 : " + paramMap);
			System.out.println("paramMap : " + paramMap);
			
			paramMap.put("memberNm", userName.getId());
			System.out.println("paramMap : " + paramMap);
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			try{
				freeBoardService.changeFavorite(paramMap);
				
				int favoriteTotCnt = freeBoardService.selectFavoriteTotCnt(paramMap);
				
				resultMap.put("result", "SUCCESS");
				resultMap.put("favoriteTotCnt", favoriteTotCnt);
				
			} catch (Exception e) {
				e.printStackTrace();
				resultMap.put("result", "FAIL");
			}
			/*ajax 응답 값 출력 밑에 3줄*/
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			
			System.out.println(resultMap);
			out.write(JsonUtil.HashMapToJson(resultMap));
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/insertReply.do")
	public void insertReply(@RequestBody String param, HttpServletResponse response, ModelMap model) throws Exception {
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		Map<String, Object> replyParam = JsonUtil.JsonToMap(param);
		LoginVO userName = (LoginVO)model.get("userName");
		
		try{
			replyParam.put("repWriter", userName.getId());
			System.out.println("before : " + replyParam);
			freeBoardService.insertReply(replyParam);
			System.out.println("after : " + replyParam);
			Map<String, Object> newReplyItem = freeBoardService.getReplyItem(replyParam);
			
			result.put("result", "SUCCESS");
			result.put("data", newReplyItem);
		} catch(Exception e) {
			result.put("result", "FAIL");
			
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.write(JsonUtil.HashMapToJson(result));
	}
	
	
	
	@RequestMapping(value = "/deleteReply.do")
	public void deleteHanqReply(@RequestBody String param, HttpServletResponse response, ModelMap model) throws Exception {
	System.out.println("deleteHanqReply param : " + param);

	HashMap<String, Object> result = new HashMap<String, Object>();

	Map<String, Object> replyParam = JsonUtil.JsonToMap(param);
	LoginVO userName = (LoginVO)model.get("userName");
	try {
		replyParam.put("repWriter", userName.getId());

		freeBoardService.deleteReplyItem(replyParam);

		result.put("result", "SUCCESS");
	} catch(Exception e) {
		result.put("result", "FAIL");

		e.printStackTrace();
	}

	response.setCharacterEncoding("utf-8");

	PrintWriter out = response.getWriter();

	out.write(JsonUtil.HashMapToJson(result));
}
	
	@RequestMapping(value = "/updateReply.do")
	public void updateHanqReply(@RequestBody String param, HttpServletResponse response, ModelMap model) throws Exception {
	System.out.println("updateHanqReply param : " + param);

	HashMap<String, Object> result = new HashMap<String, Object>();

	Map<String, Object> replyParam = JsonUtil.JsonToMap(param);

	try {
		freeBoardService.updateReplyItem(replyParam);

		Map<String, Object> replyItem = freeBoardService.getReplyItem(replyParam);

		result.put("result", "SUCCESS");
		result.put("data", replyItem);
	} catch(Exception e) {
		result.put("result", "FAIL");

	e.printStackTrace();
	}

	response.setCharacterEncoding("utf-8");

	PrintWriter out = response.getWriter();

	out.write(JsonUtil.HashMapToJson(result));
	}

	
	
	
	
	
	

}
