package egovframework.example.board.service.impl;

import java.util.List;



import java.util.Map;

import egovframework.example.board.service.BoardPagingVO;
import egovframework.example.board.service.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("freeBoardMapper")
public interface FreeBoardMapper {

	List<EgovMap> selectBoardList(BoardPagingVO boardPagingVO)throws Exception;

	BoardVO boardDetail(int hnoInt)throws Exception;

	void insertBoardList(BoardVO boardVO)throws Exception;

	int getBoardHno()throws Exception;

	void updateBoardList(BoardVO boardVO)throws Exception;

	void deleteBoardList(int hno)throws Exception;

	void updateViewCnt(int hno)throws Exception;

	int selectFavoriteTotCnt(Map<String, Object> paramMap)throws Exception;

	int selectFavoriteOwnCnt(Map<String, Object> paramMap)throws Exception;

	void insertFavorite(Map<String, Object> paramMap)throws Exception;

	void deleteFavorite(Map<String, Object> paramMap)throws Exception;

	EgovMap selectBoardListCnt(BoardPagingVO boardPagingVO)throws Exception;

	int getPreviousHno(int hno)throws Exception;

	int getNextHno(int hno)throws Exception;

	List<EgovMap> selectReplyList(Map<String, Object> paramMap)throws Exception;

	void insertReply(Map<String, Object> replyParam)throws Exception;

	Map<String, Object> getReplyItem(Map<String, Object> replyParam)throws Exception;

	void deleteReplyItem(Map<String, Object> replyParam)throws Exception;

	void updateReplyItem(Map<String, Object> replyParam)throws Exception;


	
	
	

}

