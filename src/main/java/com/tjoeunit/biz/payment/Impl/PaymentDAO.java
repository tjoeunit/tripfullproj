package com.tjoeunit.biz.payment.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.hotel.HotelVO;
import com.tjoeunit.biz.payment.PaymentVO;

@Repository
public class PaymentDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertPayment(PaymentVO vo){
		return mybatis.insert("paymentDAOTemplate.insertPayment", vo);
	}
	
	public List<PaymentVO> getPaymentList(int members_no) {		  
		return mybatis.selectList("paymentDAOTemplate.getPaymentList", members_no);
	}
}
