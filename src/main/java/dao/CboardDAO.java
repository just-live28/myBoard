package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CBoardDTO;

public class CBoardDAO {
	private static CBoardDAO instance;

	public synchronized static CBoardDAO getInstance() {
		if (instance == null) {
			return new CBoardDAO();
		} else {
			return instance;
		}
	}

	private CBoardDAO() {}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//함수 작성부
	public void insertPost(CBoardDTO post) throws Exception{
		String sql = "insert into c_board values(c_board_sequence.nextval, ?, ?, ?, ?, sysdate, 0, 0)";
		String[] generatedColumns = {"parentSeq"};
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, post.getUserId());
			pstat.setInt(2, post.getcBoardCategory());
			pstat.setString(3, post.getcBoardTitle());
			pstat.setString(4, post.getcBoardContent());
			pstat.executeUpdate();
		}
	}
	
	public int getRecordCount(int category) throws Exception{
		String sql = null;
		if(category == 0) {
			sql = "select count(c_board_seq) from c_board";
		}else if (category == 1) {
			sql = "select count(c_board_seq) from c_board where c_board_category = 1";
		}else {
			sql = "select count(c_board_seq) from c_board where c_board_category = 2";
		}
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);
			ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}
	
	public int getSearchedCount(int category, String searchType, String searchInput) throws Exception{
		String sql = null;
		if(category == 0) {
			if(searchType.equals("writer")) {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where user_id like ?)";
			}else {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_title like ?)";
			}
		}else if(category == 1) {
			if(searchType.equals("writer")) {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 1 and user_id like ?)";
			}else {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 1 and c_board_title like ?)";
			}
		}else {
			if(searchType.equals("writer")) {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 2 and user_id like ?)";
			}else {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 2 and c_board_title like ?)";
			}
		}
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%" + searchInput + "%");
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	public List<CBoardDTO> viewList(int category, int startNum, int endNum) throws Exception {
		String sql = null;
		if(category == 0) {
			sql = "select * from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board) where rown between ? and ?";
		}else if (category == 1) {
			sql = "select * from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 1) where rown between ? and ?";
		}else {
			sql = "select * from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 2) where rown between ? and ?";
		}
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);
			try(ResultSet rs = pstat.executeQuery()){
				List<CBoardDTO> list = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					int postCategory = rs.getInt(3);
					String title = rs.getString(4);
					String content = rs.getString(5);
					Timestamp date = rs.getTimestamp(6);
					int view = rs.getInt(7);
					int report = rs.getInt(8);

					CBoardDTO post = new CBoardDTO(seq, writer, postCategory, title, content ,date, view, report);
					list.add(post);
				}
				return list;
			}
		}
	}
	
	public List<CBoardDTO> viewSearchedList(int category, int startNum, int endNum, String searchType, String searchInput) throws Exception{
		String sql = null;
		if(category == 0) {
			if(searchType.equals("writer")) {
				sql = "select * from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where user_id like ?) where rown between ? and ?";
			}else {
				sql = "select * from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_title like ?) where rown between ? and ?";
			}
		}else if(category == 1) {
			if(searchType.equals("writer")) {
				sql = "select * from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 1 and user_id like ?) where rown between ? and ?";
			}else {
				sql = "select * from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 1 and c_board_title like ?) where rown between ? and ?";
			}
		}else {
			if(searchType.equals("writer")) {
				sql = "select * from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 2 and user_id like ?) where rown between ? and ?";
			}else {
				sql = "select * from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 2 and c_board_title like ?) where rown between ? and ?";
			}
		}
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%" + searchInput + "%");
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
			try(ResultSet rs = pstat.executeQuery()){
				List<CBoardDTO> list = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					int postCategory = rs.getInt(3);
					String title = rs.getString(4);
					String content = rs.getString(5);
					Timestamp date = rs.getTimestamp(6);
					int view = rs.getInt(7);
					int report = rs.getInt(8);

					CBoardDTO post = new CBoardDTO(seq, writer, postCategory, title, content ,date, view, report);
					list.add(post);
				}
				return list;
			}
		}
	}
	
	public int getLastSeq(String id, int category) throws Exception{
		String sql = "select c_board_seq from c_board where user_id = ? and c_board_category = ? order by c_board_seq desc";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);
				) {
			pstat.setString(1, id);
			pstat.setInt(2, category);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return(rs.getInt(1));
			}
		}
	}
	
	public CBoardDTO viewPost(int seq) throws Exception{
		String sql = "select * from c_board where c_board_seq = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				int targetSeq = rs.getInt(1);
				String writer = rs.getString(2);
				int category = rs.getInt(3);
				String title = rs.getString(4);
				String contents = rs.getString(5);
				Timestamp writeDate = rs.getTimestamp(6);
				int view = rs.getInt(7);
				int report = rs.getInt(8);

				CBoardDTO ctt = new CBoardDTO(targetSeq, writer, category, title, contents, writeDate, view, report);

				return ctt;
			}
		}
	}
	
	public void upViewCount(int seq) throws Exception {
		String sql = "update c_board set c_board_view = c_board_view + 1 where c_board_seq = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			pstat.executeUpdate();
		}

	}

}
