package com.tjoeunit.view.payment;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.payment.PaymentService;
import com.tjoeunit.biz.payment.PaymentVO;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value="/payment/payment.do", method=RequestMethod.POST)
	@ResponseBody
	public int PaymentPage(PaymentVO vo, Model model, HttpServletRequest request) {
		
				
		String members_no = request.getParameter("members_no");		
		String flight_no = request.getParameter("flight_no");		
		String activity_no = request.getParameter("activity_no");		
		String lantrip_no = request.getParameter("lantrip_no");		
		String hotel_no = request.getParameter("hotel_no");		
		String payment_bookdate = request.getParameter("payment_bookdate");
		String payment_quantity = request.getParameter("payment_quantity");
		String payment_price = request.getParameter("payment_price");
		String flight_title = request.getParameter("flight_title");
		String hotel_title = request.getParameter("hotel_title");
		String activity_title = request.getParameter("activity_title");
		String lantrip_title = request.getParameter("lantrip_title");
		String product_category = request.getParameter("product_category");
		
		vo.setMembers_no(members_no);
		vo.setActivity_no(activity_no);
		vo.setFlight_no(flight_no);
		vo.setLantrip_no(lantrip_no);
		vo.setHotel_no(hotel_no);
		vo.setPayment_bookdate(payment_bookdate);
		vo.setPayment_quantity(payment_quantity);
		vo.setPayment_price(payment_price);
		vo.setFlight_title(flight_title);
		vo.setHotel_title(hotel_title);
		vo.setActivity_title(activity_title);
		vo.setLantrip_title(lantrip_title);
		vo.setProduct_category(product_category);
		
		System.out.println("카카오페이 결제 payment_no = seq");
		System.out.println("카카오페이 결제 vo="+vo);
				
		int result = paymentService.insertPayment(vo);
		
		System.out.println("카카오페이 결제 result="+result);
		
		return result;
	}
	
	// 관리자 결제정보
	@RequestMapping(value="/adminPayment/adminPaymentList.do", method=RequestMethod.GET)
	public String adminPaymentInfoPage(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		
		int total = paymentService.countPayment();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("paymentList", paymentService.selectPayment(vo));
		return "adminPayment/adminPaymentList";
		
	}
	
	
}
