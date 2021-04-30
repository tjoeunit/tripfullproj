package com.tjoeunit.biz.payment.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.payment.PaymentService;
import com.tjoeunit.biz.payment.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;
	
	@Override
	public int insertPayment(PaymentVO vo) {
		return paymentDAO.insertPayment(vo);
	}

	@Override
	public List<PaymentVO> getPaymentList(int members_no) {
		List<PaymentVO> list = paymentDAO.getPaymentList(members_no);		
		return list;
	}
	
	//페이징처리를 위해 생성
	@Override
	public int countPayment() {		
		return paymentDAO.countPayment();
	}
	
	//페이징처리를 위해 생성
	@Override
	public List<PaymentVO> selectPayment(PagingVO vo) {
		return paymentDAO.selectPayment(vo);
	}
	

}
