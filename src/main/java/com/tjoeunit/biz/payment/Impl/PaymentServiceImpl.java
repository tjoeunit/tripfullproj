package com.tjoeunit.biz.payment.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.flight.FlightVO;
import com.tjoeunit.biz.payment.PaymentService;
import com.tjoeunit.biz.payment.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	//결제 정보 입력	
	@Override
	public int insertPayment(PaymentVO vo) {
		return paymentDAO.insertPayment(vo);
	}
	
	//결제 정보 리스트 : 항공	
	@Override
	public List<PaymentVO> getPayList(PaymentVO vo) {
		List<PaymentVO> list = paymentDAO.getPayList(vo);
		return list;
	}

}
