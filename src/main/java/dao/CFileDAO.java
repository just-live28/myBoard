package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CFileDTO;

public class CFileDAO {
	private static CFileDAO instance;

	public synchronized static CFileDAO getInstance() {
		if (instance == null) {
			return new CFileDAO();
		} else {
			return instance;
		}
	}

	private CFileDAO() {}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//c_file DB에 파일 정보 추가
	public void addFile(CFileDTO file) throws Exception {
		String sql = "insert into c_file values(c_file_sequence.nextval, ?, ?, ?)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, file.getcFileOriname());
			pstat.setString(2, file.getcFileSysname());
			pstat.setInt(3, file.getcFileParentSeq());
			pstat.executeUpdate();
		}
	}
	
	//c_file DB에서 파일 리스트 가져오기
	public List<CFileDTO> getFileList(int seq) throws Exception {
		String sql = "select * from c_file where c_file_parent_seq = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			try (ResultSet rs = pstat.executeQuery();) {
				List<CFileDTO> list = new ArrayList<>();

				while (rs.next()) {
					int fileSeq = rs.getInt(1);
					String oriname = rs.getString(2);
					String sysname = rs.getString(3);
					int parent_seq = rs.getInt(4);

					CFileDTO file = new CFileDTO(fileSeq, oriname, sysname, parent_seq);
					list.add(file);
				}
				return list;
			}
		}
	}
}
