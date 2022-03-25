package co.micol.prj.inquiry.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class InquiryVO {
	
	private int inquiryNo;
	private String userAlias;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date inquiryDate;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryImage1;
	private String inquiryImage2;
	private String inquiryImage3;
	private String inquiryCategory;
	private int inquiryHit;
	
}
