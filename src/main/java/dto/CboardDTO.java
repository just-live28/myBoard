package dto;

import java.sql.Timestamp;

public class CBoardDTO {
	private int cBoardSeq;
	private String userId;
	private int cBoardCategory;
	private String cBoardTitle;
	private String cBoardContent;
	private Timestamp cBoarDate;
	private int cBoardView;
	private int cBoardReport;
	
	public int getcBoardSeq() {
		return cBoardSeq;
	}
	public void setcBoardSeq(int cBoardSeq) {
		this.cBoardSeq = cBoardSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getcBoardCategory() {
		return cBoardCategory;
	}
	public void setcBoardCategory(int cBoardCategory) {
		this.cBoardCategory = cBoardCategory;
	}
	public String getcBoardTitle() {
		return cBoardTitle;
	}
	public void setcBoardTitle(String cBoardTitle) {
		this.cBoardTitle = cBoardTitle;
	}
	public String getcBoardContent() {
		return cBoardContent;
	}
	public void setcBoardContent(String cBoardContent) {
		this.cBoardContent = cBoardContent;
	}
	public Timestamp getcBoarDate() {
		return cBoarDate;
	}
	public void setcBoarDate(Timestamp cBoarDate) {
		this.cBoarDate = cBoarDate;
	}
	public int getcBoardView() {
		return cBoardView;
	}
	public void setcBoardView(int cBoardView) {
		this.cBoardView = cBoardView;
	}
	public int getcBoardReport() {
		return cBoardReport;
	}
	public void setcBoardReport(int cBoardReport) {
		this.cBoardReport = cBoardReport;
	}
	public CBoardDTO() {
		super();
	}
	public CBoardDTO(int cBoardSeq, String userId, int cBoardCategory, String cBoardTitle, String cBoardContent,
			Timestamp cBoarDate, int cBoardView, int cBoardReport) {
		super();
		this.cBoardSeq = cBoardSeq;
		this.userId = userId;
		this.cBoardCategory = cBoardCategory;
		this.cBoardTitle = cBoardTitle;
		this.cBoardContent = cBoardContent;
		this.cBoarDate = cBoarDate;
		this.cBoardView = cBoardView;
		this.cBoardReport = cBoardReport;
	}
	
	
	
	
	
}
