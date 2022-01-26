package kr.co.grit.pgm.vo;

public class PgmLbrryBookExcelVO {
	private String wffcltyCd;
	private String bookNo;
	private String bookNm;
	private String author;
	private String publisher;
	private String pblsYear;
	private String typeName;
	public String getWffcltyCd() {
		return wffcltyCd;
	}
	public void setWffcltyCd(String wffcltyCd) {
		this.wffcltyCd = wffcltyCd;
	}
	public String getBookNo() {
		return bookNo;
	}
	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookNm() {
		return bookNm;
	}
	public void setBookNm(String bookNm) {
		this.bookNm = bookNm;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPblsYear() {
		return pblsYear;
	}
	public void setPblsYear(String pblsYear) {
		this.pblsYear = pblsYear;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	@Override
	public String toString() {
		return "PgmLbrryBookExcelVO [wffcltyCd=" + wffcltyCd + ", bookNo="
				+ bookNo + ", bookNm=" + bookNm + ", author=" + author
				+ ", publisher=" + publisher + ", pblsYear=" + pblsYear
				+ ", typeName=" + typeName + "]";
	}
	
	
	
}

