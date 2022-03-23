package co.micol.prj.border.service;





import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;



@Setter
@Getter
public class BorderVO {
	private int borderId;
	private String borderWriter;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date borderDate;
	private String borderTitle;
	private String borderContents;
	private int borderHit;
	
	public int getBorderId() {
		return borderId;
	}
	public void setBorderId(int borderId) {
		this.borderId = borderId;
	}
	public String getBorderWriter() {
		return borderWriter;
	}
	public void setBorderWriter(String borderWriter) {
		this.borderWriter = borderWriter;
	}
	public String getBorderTitle() {
		return borderTitle;
	}
	public void setBorderTitle(String borderTitle) {
		this.borderTitle = borderTitle;
	}
	public String getBorderContents() {
		return borderContents;
	}
	public void setBorderContents(String borderContents) {
		this.borderContents = borderContents;
	}
	public int getBorderHit() {
		return borderHit;
	}
	public void setBorderHit(int borderHit) {
		this.borderHit = borderHit;
	}
	public Date getBorderDate() {
		return borderDate;
	}
	public void setBorderDate(Date borderDate) {
		this.borderDate = borderDate;
	}
	
}
