package com.tjoeunit.biz.payment;

import java.util.List;

public interface PaymentService {
	//결제 등록
	int insertPayment(PaymentVO vo);
	
	List<PaymentVO> getPaymentList(int members_no);
}
