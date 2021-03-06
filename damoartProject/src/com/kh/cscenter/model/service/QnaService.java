package com.kh.cscenter.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.cscenter.model.dao.QnaDao;
import com.kh.cscenter.model.vo.QnA;
import com.kh.product.model.vo.Product;

public class QnaService {
	
	public int selectListCount() {
		Connection conn = getConnection();		
		int listCount = new QnaDao().selectListCount(conn);		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<QnA> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<QnA> list = new QnaDao().selectList(conn, pi);
		close(conn);
		return list;
		
	}
	
	public ArrayList<QnA> selectList() {
		Connection conn = getConnection();
		ArrayList<QnA> list = new QnaDao().selectList(conn);
		close(conn);
		return list;
		
	}
	
	public QnA selectQnA(int qNo) {
		Connection conn = getConnection();
		QnA q = new QnaDao().selectQnA(conn, qNo);
		close(conn);
		return q;
		
	}
	
	public Attachment selectAttachment(int qNo) {
		Connection conn = getConnection();
		Attachment at = new QnaDao().selectAttachment(conn, qNo);
		close(conn);
		return at;
	}
	
	public int insertAnswer(int qNo, String answer, int adminNo) {
		Connection conn = getConnection();
		int result = new QnaDao().insertAnswer(conn, qNo, answer, adminNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Product> enrollFormProductSearch(String keyword) {
		Connection conn = getConnection();
		ArrayList<Product> list = new QnaDao().enrollFormProductSearch(conn, keyword);
		close(conn);
		return list;
	}
	
	public Product enrollFormProductSelectResult(int pNo) {
		Connection conn = getConnection();
		Product p = new QnaDao().enrollFormProductSelectResult(conn, pNo);
		close(conn);
		return p;
		
	}
	
	public int insertQuestion(QnA q, Attachment at) {
		Connection conn = getConnection();
		int result1 = 0;
		
		if(q.getpNo() == null) {
			result1 = new QnaDao().insertQuestion(conn, q);
		}else {
			result1 = new QnaDao().insertPQuestion(conn, q);
		}
		int result2 = 1;
		if(at != null) {
			result2 = new QnaDao().insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}
	
	public int updateQuestion(QnA q, Attachment at) {
		Connection conn = getConnection();
		int result1 = new QnaDao().updateQuestion(conn, q);
		
		int result2 = 1;
		if(at != null) {
			if(at.getFileNo() != 0) {
				result2 = new QnaDao().updateAttachment(conn, at);
			}else {
				result2 = new QnaDao().insertNewAttachment(conn, at);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}
	
	public int deleteQna(int qnaNo) {
		Connection conn = getConnection();
		int result = new QnaDao().deleteQna(conn, qnaNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int selectSearchListCount(String category, String keyword) {
		Connection conn = getConnection();		
		int listCount = 0;
		if(category.equals("searchTitle")) {
			
			listCount = new QnaDao().selectTitleSearchListCount(conn, keyword);
		}else {
			listCount = new QnaDao().selectContentSearchListCount(conn, keyword);
		}		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<QnA> selectSearchList(PageInfo pi, String category, String keyword) {
		Connection conn = getConnection();
		ArrayList<QnA> list = new ArrayList<>();
		if(category.equals("searchTitle")) {
			list = new QnaDao().selectTitleSearchList(conn, pi, keyword);
		}else {
			list = new QnaDao().selectContentSearchList(conn, pi, keyword);
		}
		close(conn);
		return list;
		
	}
	
	public int nonAnswerCount() {
		Connection conn = getConnection();
		int nonAnswerCount = new QnaDao().nonAnswerCount(conn);
		close(conn);
		return nonAnswerCount;
	}
	
	public int adminSelectSearchListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = 0;
		listCount = new QnaDao().adminSelectSearchListCount(conn, keyword);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<QnA> adminSelectSearchList(PageInfo pi, String keyword) {
		Connection conn = getConnection();
		ArrayList<QnA> list = new ArrayList<>();		
		list = new QnaDao().adminSelectSearchList(conn, pi, keyword);		
		close(conn);
		return list;
	}
	
	
}
