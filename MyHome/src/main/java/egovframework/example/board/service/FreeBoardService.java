package egovframework.example.board.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;


public interface FreeBoardService {

	List<EgovMap> selectBoardList(BoardPagingVO boardPagingVO)throws Exception;

	BoardVO boardDetail(int hnoInt)throws Exception;

	void insertBoardList(BoardVO boardVO)throws Exception;

	int getBoardHno()throws Exception;

	void updateBoardList(BoardVO boardVO)throws Exception;

	void deleteBoardList(int hno)throws Exception;

	void updateViewCnt(int hno)throws Exception;

	void changeFavorite(Map<String, Object> paramMap)throws Exception;

	int selectFavoriteTotCnt(Map<String, Object> paramMap)throws Exception;

	int selectFavoriteOwnCnt(Map<String, Object> paramMap)throws Exception;

	EgovMap selectBoardListCnt(BoardPagingVO boardPagingVO)throws Exception;

	int getPreviousHno(int hno)throws Exception;

	int getNextHno(int hno)throws Exception;

	List<EgovMap> selectReplyList(Map<String, Object> paramMap)throws Exception;

	void insertReply(Map<String, Object> replyParam)throws Exception;

	Map<String, Object> getReplyItem(Map<String, Object> replyParam)throws Exception;

	void deleteReplyItem(Map<String, Object> replyParam)throws Exception;

	void updateReplyItem(Map<String, Object> replyParam)throws Exception;



	
	


	

}

