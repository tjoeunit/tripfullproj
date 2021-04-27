package com.tjoeunit.biz.payment;

import java.util.List;


public interface PaymentService {
	
	int insertPayment(PaymentVO vo);
	
	List<PaymentVO> getPayList(PaymentVO vo);
}
