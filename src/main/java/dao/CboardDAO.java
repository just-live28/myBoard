package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CboardDTO;

public class CboardDAO {
	private static CboardDAO instance;

	public synchronized static CboardDAO getInstance() {
		if (instance == null) {
			return new CboardDAO();
		} else {
			return instance;
		}
	}

	private CboardDAO() {}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//함수 작성부
	public void insertPost(CboardDTO post) throws Exception{
		String sql = "insert into c_board values(c_board_sequence.nextval, ?, ?, ?, ?, sysdate, 0, 0)";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, post.getUser_id());
			pstat.setInt(2, post.getC_board_category());
			pstat.setString(3, post.getC_board_title());
			pstat.setString(4, post.getC_board_content());
			int result = pstat.executeUpdate();

			if (result > 0) {
				System.out.println(post.getUser_id() + " : 글 추가 완료. 글 제목 : " + post.getC_board_title());
			} else {
				System.out.println(post.getUser_id() + " : 글 추가 실패");
			}
		}
		
	}

}
