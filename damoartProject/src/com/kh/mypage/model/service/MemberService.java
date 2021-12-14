package com.kh.mypage.model.service;

import java.sql.Connection;

import com.kh.mypage.model.dao.MemberDao;
import com.kh.mypage.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class MemberService {

	public Member updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			
			// 수정된 회원객체 다시 조회해오기
			updateMem = new MemberDao().selectMember(conn, m.getMemId());
		}else {
			rollback(conn);
		}
		
		close(conn);
		return updateMem;
	}
}