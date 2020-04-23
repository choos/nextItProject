package com.zero.purchase.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.common.exception.BizException;
import com.zero.purchase.dao.IPurchaseDao;
import com.zero.purchase.vo.PurchaseSearchVO;
import com.zero.purchase.vo.PurchaseVO;

@Service
public class PurchaseServiceImpl implements IPurchaseService {

	@Autowired
	private IPurchaseDao purDao;
	
	@Override
	public List<PurchaseVO> getPurchaseList(PurchaseSearchVO searchVO) {
		try {
			/*
			 * int rowCount = purDao.getBoardCount(searchVO);
			 * searchVO.setTotalRowCount(rowCount); searchVO.setting();
			 */
			return purDao.getPurchaseList(searchVO);
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}

	@Override
	public void registPurchase(PurchaseVO member) {
		try {
			purDao.insertList(member);
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}


	@Override
	public int getPurchaseQty(PurchaseSearchVO searchVO) {
		try {
			return purDao.getPurchaseQty(searchVO);
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}

	@Override
	public void purchaseInvenList(PurchaseVO purchaseVO) {
		try {
			purDao.purchaseInvenList(purchaseVO);
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}

	@Override
	public boolean getListReviewYN(PurchaseVO vo) {
		boolean YN = true;
		if(Integer.parseInt(purDao.getReviewYN(vo)) > 0) {
			YN =false;
		}
		return YN;
	}

	@Override
	public void updatePurchase(PurchaseVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removePurchase(PurchaseVO member) {
		// TODO Auto-generated method stub
		
	}

	


	
	
}
