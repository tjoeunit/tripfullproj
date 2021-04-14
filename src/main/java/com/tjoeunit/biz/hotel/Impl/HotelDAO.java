package com.tjoeunit.biz.hotel.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.common.JDBCUtil;
import com.tjoeunit.biz.hotel.HotelVO;


@Repository
public class HotelDAO { // Data Access Object
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private final String Hotel_INSERT = "insert into hotel(hotel_no, title, hotel_title, hotel_content, hotel_img, hotel_thumb, hotel_category, hotel_price, hotel_area) "
			+ "values((select nvl(max(hotel_no), 0)+1 from hotel),?,?,?,?,?,?,? )";
	private final String Hotel_LIST ="select * from hotel order by hotel_no desc";
	private final String Hotel_GET = "select * from hotel where hotel_no=?";
	private final String Hotel_UPDATE = "update hotel set hotel_title=?, hotel_content=?, hotel_category=?, hotel_price=?, hotel_area=? where hotel_no=? ";
	private final String Hotel_DELETE = "delete hotel where hotel_no=?";
	private final String Hotel_LIST_T ="select * from hotel where hotel_title like '%'||?||'%' order by seq desc"; 
	private final String Hotel_LIST_C ="select * from hotel where hotel_content like '%'||?||'%' order by seq desc";
	
	//%_아무것도 안와도되거나, 하나이상 오거나, "||"이어서_연속의미
	// 담기위해 필드 생성 
	// CRUD 기능 탑재
	// 디폴트값은 적지 않음 
	// 글 등록
	//	 nvl(max(seq),0)  널이면 0으로 해준다 는 뜻 		
	public void insertHotel(HotelVO vo) {
		System.out.println("===>JDBC로 insertHotel() 기능 처리");
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(Hotel_INSERT);
			pstmt.setInt(1, vo.getHotel_no());
			pstmt.setString(2, vo.getHotel_title());
			pstmt.setString(3, vo.getHotel_content());
			pstmt.setString(4, vo.getHotel_img());
			pstmt.setString(5, vo.getHotel_thumb());
			pstmt.setString(6, vo.getHotel_category());
			pstmt.setInt(7, vo.getHotel_price());
			pstmt.setString(8, vo.getHotel_area());
			pstmt.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(pstmt, conn);
			}
		}
	
	//글 목록 조회
	public List <HotelVO> getHotelList(HotelVO vo){
		System.out.println("===>JDBC로 getHotelList() 기능 처리");
		List<HotelVO> list = new ArrayList<HotelVO>();
		
		try {
			conn = JDBCUtil.getConnection();
		
			if(vo.getSearchCondition().equals("hotel_title")){
				pstmt = conn.prepareStatement(Hotel_LIST_T);
			}else if(vo.getSearchCondition().equals("hotel_content")){
				pstmt = conn.prepareStatement(Hotel_LIST_C);
			}
			pstmt.setString(1, vo.getSearchKeyword());
			rs = pstmt.executeQuery(); // 디비에서 읽어오고 보관한 영역 
			//select 문 한정 executeQuery
			while(rs.next()) { 
				HotelVO hotel = new HotelVO();
				hotel.setHotel_thumb(rs.getString("hotel_thumb"));
				hotel.setHotel_title(rs.getString("hotel_title"));
				hotel.setHotel_price(rs.getInt("hotel_price"));
				hotel.setHotel_category(rs.getString("hotel_category"));
				hotel.setHotel_area(rs.getString("hotel_area"));
				list.add(hotel); 
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, pstmt, conn);
		}//이미 오버로딩을 해놓아서 편하게 등록 
		return list;
	}
	
	// 글 상세 조회
		public HotelVO getHotel(HotelVO vo){
			System.out.println("===> JDBC로 getHotelVO() 기능 처리");
			HotelVO hotel = null;
			// 조건에 맞는 게시글 데이터를 담기위한 필드 설정
			// 특정 조건에 맞는 sql : "select * from springboard where seq=?"
			// 글 상세 조회를 위해서도 DB와의 연동이 필요하다.
			try {
				conn = JDBCUtil.getConnection();
				pstmt = conn.prepareStatement(Hotel_GET);
				pstmt.setInt(1, vo.getHotel_no());
				// 1번은 sql 문에 ? 순서대로 뒤에 파라메타가 입력이된다.   
				// seq=? 에 vo.getSeq() 들어간다. 
				// seq에 맞는 데이터를 분석해서 찾는다.
				// 여기서 set은 데이터를 찾는 역할을 한다.
	
				rs = pstmt.executeQuery();
				//결과 집합 반환
				if (rs.next()) { // 데이터가 있다면 커서가 아래로 이동하고 없다면 거기서 멈추고 펄스 반환 , 데이터가 있다면 계속 반복된다. 
					hotel = new HotelVO(); // 상세조회도 다시 객체에 담아서 보내주는 동작이다.
					hotel.setHotel_title(rs.getString("hotel_title"));
					hotel.setHotel_content(rs.getString("hotel_content"));
					hotel.setHotel_img(rs.getString("hotel_img"));
					hotel.setHotel_thumb(rs.getString("hotel_thumb"));
					hotel.setHotel_category(rs.getString("hotel_category"));
					hotel.setHotel_price(rs.getInt("hotel_price"));					
					hotel.setHotel_area(rs.getString("hotel_area"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(rs, pstmt, conn);
			}
			return hotel;
		}
	
		// 글 수정
		public void updateHotel(HotelVO vo) {
			System.out.println("===> JDBC로 updateHotel() 기능 처리");
			try {
				conn = JDBCUtil.getConnection();
				pstmt = conn.prepareStatement(Hotel_UPDATE);
				pstmt.setString(1, vo.getHotel_title());
				pstmt.setString(2, vo.getHotel_content());
				pstmt.setString(3, vo.getHotel_category());
				pstmt.setInt(4, vo.getHotel_price());
				pstmt.setString(5, vo.getHotel_area());
				pstmt.setInt(6, vo.getHotel_no());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(pstmt, conn);
			}
		}
		
		// 글 삭제
		public void deleteHotel(HotelVO vo) {
			System.out.println("===> JDBC로 deleteHotel() 기능 처리");
			try {
				conn = JDBCUtil.getConnection();
				pstmt = conn.prepareStatement(Hotel_DELETE);
				pstmt.setInt(1, vo.getHotel_no());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(pstmt, conn);
			}
		}

}
