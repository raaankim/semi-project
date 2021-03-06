package com.kh.order.model.service;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.order.model.dao.ManageCancelDao;
import com.kh.order.model.dao.ManageOrderDao;
import com.kh.order.model.vo.ManageCancel;

public class ManageCancelService {

	ManageCancelDao ManageCancel = new ManageCancelDao();
	
	public ArrayList<ManageCancel> selectCancelManage(){
		Connection conn = getConnection();	
		ArrayList<ManageCancel> list = ManageCancel.selectCancelManage(conn);
		
		close (conn);		
		return list;
	}
	
	
	public ArrayList<ManageCancel> selectCancelManage(String st, String end){
		Connection conn = getConnection();	
		ManageCancel.setDate(st, end);
		ArrayList<ManageCancel> list = ManageCancel.selectCancelManage(conn);
		
		close (conn);		
		return list;

	}


	public int deleteOrder(int orderNo) {
		Connection conn = getConnection();
		int result = new ManageCancelDao().deleteOrder(conn, orderNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deletedenyOrder(int orderNo) {
		Connection conn = getConnection();
		int result = new ManageCancelDao().deletedenyOrder(conn, orderNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
