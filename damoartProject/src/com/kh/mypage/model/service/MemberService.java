package com.kh.mypage.model.service;

import java.sql.Connection;

import com.kh.mypage.model.dao.MemberDao;

import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class MemberService {
	// 정보수정
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMember = null;
		if(result > 0) { // 성공
			commit(conn);
			
			// 수정된 회원객체 다시 조회
			updateMember = new MemberDao().selectMember(conn, m.getMemId());
		}else {
			rollback(conn);
		}
		
		close(conn);
		return updateMember;
		
	}
	
	
	// 회원탈퇴
	public int deleteMember(String memId) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn, memId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
}
