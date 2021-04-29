<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.footerDiv {
		margin-left: 360px;		
	}
	
	.descDiv {
		color: gray;
		font-size: 13px;
	}
	
	.footerPolicy {
		display:inline-block;
		margin: 10px;
		padding: 10px;
		font-size: 15px;
		font-weight: 600;
		color: gray;
		border-radius: 5px;
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
	}
	
	.footerPolicy:hover {
		color: #87B8FD;
		background-color: #E6F9FE;
		cursor: pointer;
	}
	
</style>

<footer>

	<hr>

	<div class="footerDiv">
		<div>
			<a href="<c:url value='/index/termService.do'/>"><span class="footerPolicy">이용약관</span></a>
			<a href="<c:url value='/index/privacyPolicy.do'/>"><span class="footerPolicy">개인정보 처리방침</span></a>
			<a href="<c:url value='/index/cancelRefund.do'/>"><span class="footerPolicy">취소 및 환불 정책</span></a>
			<a href="<c:url value='/qna/getQnaList.do'/>"><span class="footerPolicy">QNA</span></a>
		</div>		
		
		<div class="descDiv">		
		상호명 (주)트립풀 | 대표 이종로 | 개인정보보호책임자 정종로 | 사업자등록번호 000-00-00000 사업자정보확인 | 통신판매업신고번호 0000-종로종로-0000<br>
		주소 서울특별시 종로구 종로대로 000, 종로종로타워 18층(종로동) | 이메일 tripfull@tripfull.com | 마케팅/제휴 문의 tripfull@tripfull.com<br>
		자사는 서울특별시종로협회 종로영업종로보험에 가입되어 있습니다. 트립풀은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품·거래정보 및 거래에 대하여 책임을 지지않습니다.<br>
		</div>
	</div>
	
</footer>
</body>

</html>