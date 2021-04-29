package com.tjoeunit.biz.payment;

import java.util.List;

import com.tjoeunit.biz.common.PagingVO;

public interface PaymentService {
	//결제 등록
	int insertPayment(PaymentVO vo);
	
	List<PaymentVO> getPaymentList(int members_no);
	
	//페이징처리를 위해 생성 : 게시물 총 개수
	int countPayment();
		
	//페이징처리를 위해 생성 : 항공권 조회
	List<PaymentVO> selectPayment(PagingVO vo);
}
