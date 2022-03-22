package co.micol.prj.notice.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeVO {
	
	private int noticeId;
	private String noticeWriter;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date noticeDate;
	private String noticeTitle;
	private String noticeContents;
	private int noticeHit;
	private String noticeCategory;
	
	private String ntImage1;
	private String ntImage2;
	private String ntImage3;
}
