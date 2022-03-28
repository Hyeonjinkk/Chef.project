package co.micol.prj.notice.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	
	private int noticeNo;
	private String userAlias;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date noticeDate;
	private String noticeTitle;
	private String noticeContent;
	private int noticeHit;
	
	private String ntImage1;
	private String ntImage2;
	private String ntImage3;
}
