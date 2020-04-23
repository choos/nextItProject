package com.zero.ufboard.service;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.common.exception.BizException;
import com.zero.common.exception.BizNotFoundException;
import com.zero.common.exception.BizRegistFailException;
import com.zero.ufboard.dao.IUFBoardDao;
import com.zero.ufboard.vo.UFBoardVO;
import com.zero.ufboard.vo.UFSearchVO;
import com.zero.util.FileUtils;

@Service
public class UFBoardServiceImpl implements IUFBoardService {

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Inject
	private IUFBoardDao dao;

	@Autowired
	private IUFBoardDao ufBoardDao;

	@Override
	public List<UFBoardVO> getBoardList(UFSearchVO searchVO) throws BizException {
		try {

			int rowCount = ufBoardDao.getBoardCount(searchVO);
			searchVO.setTotalRowCount(rowCount);
			logger.debug("rowCount = {}", rowCount);
			searchVO.setting();
			return ufBoardDao.getBoardList(searchVO);
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}

	@Override
	public UFBoardVO getBoard(String ufCode) throws BizException {
		// TODO Auto-generated method stub
		try {
			UFBoardVO board = ufBoardDao.getBoard(ufCode);
			if (board == null) {
				throw new BizNotFoundException("湲�踰덊샇:" + ufCode + "�쓣 議고쉶�븯吏� 紐삵뻽�땲�떎");
			}
			board.setUfRecipeList(Arrays.asList(board.getUfRecipe1(), board.getUfRecipe2(), board.getUfRecipe3(),
					board.getUfRecipe4(), board.getUfRecipe5(), board.getUfRecipe6(), board.getUfRecipe7(),
					board.getUfRecipe8(), board.getUfRecipe9(), board.getUfRecipe10(), board.getUfRecipe11(),
					board.getUfRecipe12(), board.getUfRecipe13(), board.getUfRecipe14(), board.getUfRecipe15()));
			board.setUfImgList(Arrays.asList(board.getUfImg3(), board.getUfImg4(), board.getUfImg5(), board.getUfImg6(),
					board.getUfImg7(), board.getUfImg8()));
			return board;
		} catch (SQLException e) {
			throw new BizException("", e);
		}
	}

	@Override
	public void registBoard(UFBoardVO board) throws BizException {
		// TODO Auto-generated method stub
		ufBoardDao.insertBoard(board);
	}

	@Override
	public void updateBoard(UFBoardVO board) throws BizException {
		try {
			int res = ufBoardDao.updateBoard(board);

			if (res < 1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			throw new BizException();
		}
	}

	@Override
	public void write(UFBoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.insertBoard(boardVO);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			dao.insertFile(list.get(i));
		}

	}

	@Override
	public void recommend(String ufCode) throws Exception {
		dao.recommend(ufCode);
	}

	@Override
	public void insertLike(UFBoardVO userLike) throws Exception {
		dao.insertLike(userLike);

	}

	@Override
	public int checkLike(UFBoardVO userCheckLike) throws Exception {
		return dao.checkLike(userCheckLike);

	}

	@Override
	public int deleteBoard(UFBoardVO board) throws SQLException {
		return dao.deleteBoard(board);
	}

}