package egovframework.example.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.board.service.BoardPagingVO;
import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.FreeBoardService;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("freeBoardService")
public class FreeBoardServiceImpl  implements FreeBoardService {
	
	@Resource(name="freeBoardMapper")
	private FreeBoardMapper freeBoardMapper;

	@Override
	public List<EgovMap> selectBoardList(BoardPagingVO boardPagingVO) throws Exception {
		return freeBoardMapper.selectBoardList(boardPagingVO);
	}

	@Override
	public BoardVO boardDetail(int hnoInt) throws Exception {
		return freeBoardMapper.boardDetail(hnoInt);
	}

	@Override
	public void insertBoardList(BoardVO boardVO) throws Exception {
		freeBoardMapper.insertBoardList(boardVO);
	}

	@Override
	public int getBoardHno() throws Exception {
		return freeBoardMapper.getBoardHno();
	}

	@Override
	public void updateBoardList(BoardVO boardVO) throws Exception {
		freeBoardMapper.updateBoardList(boardVO);
		
	}

	@Override
	public void deleteBoardList(int hno) throws Exception {
		freeBoardMapper.deleteBoardList(hno);
		
	}

	@Override
	public void updateViewCnt(int hno) throws Exception {
		freeBoardMapper.updateViewCnt(hno);
		
	}
	@Override
	public void changeFavorite(Map<String, Object> paramMap) throws Exception {
		if("I".equals(paramMap.get("status"))){
			freeBoardMapper.insertFavorite(paramMap);
		} else if ("D".equals(paramMap.get("status"))){
			freeBoardMapper.deleteFavorite(paramMap);
		
		}
	}

	@Override
	public int selectFavoriteTotCnt(Map<String, Object> paramMap)
			throws Exception {
		
		return freeBoardMapper.selectFavoriteTotCnt(paramMap);
	}

	@Override
	public int selectFavoriteOwnCnt(Map<String, Object> paramMap)
			throws Exception {
		return freeBoardMapper.selectFavoriteOwnCnt(paramMap);
	}

	@Override
	public EgovMap selectBoardListCnt(BoardPagingVO boardPagingVO)
			throws Exception {
		return freeBoardMapper.selectBoardListCnt(boardPagingVO);
	}

	@Override
	public int getPreviousHno(int hno) throws Exception {
		return freeBoardMapper.getPreviousHno(hno);
	}

	@Override
	public int getNextHno(int hno) throws Exception {
		return freeBoardMapper.getNextHno(hno);
	}

	@Override
	public List<EgovMap> selectReplyList(Map<String, Object> paramMap)
			throws Exception {
		return freeBoardMapper.selectReplyList(paramMap);
	}

	@Override
	public void insertReply(Map<String, Object> replyParam) throws Exception {
		freeBoardMapper.insertReply(replyParam);
		
	}

	@Override
	public Map<String, Object> getReplyItem(Map<String, Object> replyParam)
			throws Exception {
		return freeBoardMapper.getReplyItem(replyParam);
	}

	@Override
	public void deleteReplyItem(Map<String, Object> replyParam)
			throws Exception {
		freeBoardMapper.deleteReplyItem(replyParam);
		
	}

	@Override
	public void updateReplyItem(Map<String, Object> replyParam)
			throws Exception {
		freeBoardMapper.updateReplyItem(replyParam);
		
	}



	

	
	

}