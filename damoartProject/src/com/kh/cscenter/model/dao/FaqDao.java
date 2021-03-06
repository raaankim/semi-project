package com.kh.cscenter.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;
import com.kh.common.model.vo.PageInfo;
import com.kh.cscenter.model.vo.FAQ;
import com.kh.product.model.vo.Product;

public class FaqDao {

private Properties prop = new Properties();
	
	public FaqDao() {
		try {
			prop.loadFromXML(new FileInputStream(FaqDao.class.getResource("/db/sql/faq-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<FAQ> selectList(Connection conn, PageInfo pi) {
		ArrayList<FAQ> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1)*pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				String category = "";
				switch(rset.getString("F_CATEGORY_CODE")) {
				case "Q1" : category = "[티켓]"; break;
         	    case "Q2" : category = "[취소/환불]"; break;
         	    case "Q3" : category = "[주문/결제]"; break;
         	    case "Q4" : category = "[상품]"; break;
         	    case "Q5" : category = "[기타]"; break;
         	    default :  break;
				}
				FAQ f = new FAQ();
				f.setFaqNo(rset.getInt("faq_no"));
				f.setFaqTitle(rset.getString("faq_title"));
				f.setFaqContent(rset.getString("faq_content"));
				f.setfCategoryCode(category);
				f.setCreateDate(rset.getString("create_date"));
				f.setFaqWriter(rset.getString("nickname"));
				
				list.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<FAQ> selectList(Connection conn) {
		ArrayList<FAQ> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 5);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				String category = "";
				switch(rset.getString("F_CATEGORY_CODE")) {
				case "Q1" : category = "[티켓]"; break;
         	    case "Q2" : category = "[취소/환불]"; break;
         	    case "Q3" : category = "[주문/결제]"; break;
         	    case "Q4" : category = "[상품]"; break;
         	    case "Q5" : category = "[기타]"; break;
         	    default :  break;
				}
				FAQ f = new FAQ();
				f.setFaqNo(rset.getInt("faq_no"));
				f.setFaqTitle(rset.getString("faq_title"));
				f.setFaqContent(rset.getString("faq_content"));
				f.setfCategoryCode(category);
				f.setCreateDate(rset.getString("create_date"));
				f.setFaqWriter(rset.getString("nickname"));
				
				list.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public FAQ selectFaq(Connection conn, int FaqNo) {
		FAQ f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaq");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, FaqNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				String category = "";
				switch(rset.getString("f_category_code")) {
				case "Q1" : category = "[티켓]"; break;
         	    case "Q2" : category = "[취소/환불]"; break;
         	    case "Q3" : category = "[주문/결제]"; break;
         	    case "Q4" : category = "[상품]"; break;
         	    case "Q5" : category = "[기타]"; break;
         	    default :  break;
				}
				f = new FAQ(rset.getInt("faq_no"),
						    rset.getString("nickname"),
						    rset.getString("faq_title"),
						    rset.getString("faq_content").replace("\r\n", "<br>"),
						    rset.getString("create_date"),
						    category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return f;
		
	}
	
	public int insertFaq(Connection conn, FAQ f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFaq");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(f.getFaqWriter()));
			pstmt.setString(2, f.getFaqTitle());
			pstmt.setString(3, f.getFaqContent());
			pstmt.setString(4, f.getfCategoryCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateFaq(Connection conn, FAQ f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFaq");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqContent());
			pstmt.setString(3, f.getfCategoryCode());
			pstmt.setInt(4, f.getFaqNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteFaq(Connection conn, int faqNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFaq");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<FAQ> faqChangeCategory(Connection conn, String category){
		ArrayList<FAQ> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("faqChangeCategory");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				String c = "";
				switch(rset.getString("F_CATEGORY_CODE")) {
				case "Q1" : c = "[티켓]"; break;
         	    case "Q2" : c = "[취소/환불]"; break;
         	    case "Q3" : c = "[주문/결제]"; break;
         	    case "Q4" : c = "[상품]"; break;
         	    case "Q5" : c = "[기타]"; break;
         	    default :  break;
				}
				FAQ f = new FAQ();
				f.setFaqNo(rset.getInt("faq_no"));
				f.setFaqTitle(rset.getString("faq_title"));
				f.setFaqContent(rset.getString("faq_content"));
				f.setfCategoryCode(c);
				
				list.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int selectSearchListCount(Connection conn, String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<FAQ> selectSearchList(Connection conn, PageInfo pi, String keyword) {
		ArrayList<FAQ> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1)*pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				String category = "";
				switch(rset.getString("F_CATEGORY_CODE")) {
				case "Q1" : category = "[티켓]"; break;
         	    case "Q2" : category = "[취소/환불]"; break;
         	    case "Q3" : category = "[주문/결제]"; break;
         	    case "Q4" : category = "[상품]"; break;
         	    case "Q5" : category = "[기타]"; break;
         	    default :  break;
				}
				FAQ f = new FAQ();
				f.setFaqNo(rset.getInt("faq_no"));
				f.setFaqTitle(rset.getString("faq_title"));
				f.setFaqContent(rset.getString("faq_content"));
				f.setfCategoryCode(category);
				f.setCreateDate(rset.getString("create_date"));
				f.setFaqWriter(rset.getString("nickname"));
				
				list.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int menuSearchProductCount(Connection conn, String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("menuSearchProductCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<Product> menuSearchProduct(Connection conn, PageInfo pi, String keyword){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("menuSearchProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("PNO"),
									 rset.getString("TITLE"),
									 rset.getString("REGION"),
									 rset.getString("AGE"),
									 rset.getString("AREA"),
									 rset.getString("S_DATE"),
									 rset.getString("E_DATE"),
									 rset.getString("TIME"),
									 rset.getString("MAIN_IMG"),
									 rset.getString("DETAIL_IMG"),
									 rset.getString("ETC")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
}
