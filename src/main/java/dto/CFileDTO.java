package dto;

public class CFileDTO {
	private int cFileSeq;
	private String cFileOriname;
	private String cFileSysname;
	private int cFileParentSeq;
	public int getcFileSeq() {
		return cFileSeq;
	}
	public void setcFileSeq(int cFileSeq) {
		this.cFileSeq = cFileSeq;
	}
	public String getcFileOriname() {
		return cFileOriname;
	}
	public void setcFileOriname(String cFileOriname) {
		this.cFileOriname = cFileOriname;
	}
	public String getcFileSysname() {
		return cFileSysname;
	}
	public void setcFileSysname(String cFileSysname) {
		this.cFileSysname = cFileSysname;
	}
	public int getcFileParentSeq() {
		return cFileParentSeq;
	}
	public void setcFileParentSeq(int cFileParentSeq) {
		this.cFileParentSeq = cFileParentSeq;
	}
	public CFileDTO() {
		super();
	}
	public CFileDTO(int cFileSeq, String cFileOriname, String cFileSysname, int cFileParentSeq) {
		super();
		this.cFileSeq = cFileSeq;
		this.cFileOriname = cFileOriname;
		this.cFileSysname = cFileSysname;
		this.cFileParentSeq = cFileParentSeq;
	}
	
	
}
