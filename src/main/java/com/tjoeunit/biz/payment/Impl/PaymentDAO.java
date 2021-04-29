package com.tjoeunit.biz.payment.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.common.PagingVO;
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
	
	//페이징처리를 위해 생성
	public int countPayment() {
		return mybatis.selectOne("paymentDAOTemplate.countPayment");
	}
	
	//페이징처리를 위해 생성
	public List<PaymentVO> selectPayment(PagingVO vo) {
		return mybatis.selectList("paymentDAOTemplate.selectPayment", vo);
	}
}
