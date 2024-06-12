package dto;

import java.sql.Timestamp;

public class CboardDTO {
	private int c_board_seq;
	private String user_id;
	private int c_board_category;
	private String c_board_title;
	private String c_board_content;
	private Timestamp c_board_timestamp;
	private int c_board_view;
	private int c_board_report;
	public int getC_board_seq() {
		return c_board_seq;
	}
	public void setC_board_seq(int c_board_seq) {
		this.c_board_seq = c_board_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getC_board_category() {
		return c_board_category;
	}
	public void setC_board_category(int c_board_category) {
		this.c_board_category = c_board_category;
	}
	public String getC_board_title() {
		return c_board_title;
	}
	public void setC_board_title(String c_board_title) {
		this.c_board_title = c_board_title;
	}
	public String getC_board_content() {
		return c_board_content;
	}
	public void setC_board_content(String c_board_content) {
		this.c_board_content = c_board_content;
	}
	public Timestamp getC_board_timestamp() {
		return c_board_timestamp;
	}
	public void setC_board_timestamp(Timestamp c_board_timestamp) {
		this.c_board_timestamp = c_board_timestamp;
	}
	public int getC_board_view() {
		return c_board_view;
	}
	public void setC_board_view(int c_board_view) {
		this.c_board_view = c_board_view;
	}
	public int getC_board_report() {
		return c_board_report;
	}
	public void setC_board_report(int c_board_report) {
		this.c_board_report = c_board_report;
	}
	public CboardDTO() {
		super();
	}
	public CboardDTO(int c_board_seq, String user_id, int c_board_category, String c_board_title,
			String c_board_content, Timestamp c_board_timestamp, int c_board_view, int c_board_report) {
		super();
		this.c_board_seq = c_board_seq;
		this.user_id = user_id;
		this.c_board_category = c_board_category;
		this.c_board_title = c_board_title;
		this.c_board_content = c_board_content;
		this.c_board_timestamp = c_board_timestamp;
		this.c_board_view = c_board_view;
		this.c_board_report = c_board_report;
	}
	
}
