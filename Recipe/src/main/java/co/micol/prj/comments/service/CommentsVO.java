package co.micol.prj.comments.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentsVO {
	private int comNo;
	private String comAlias;
	private int comCategory;
	private int comSeq;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date comDate;
	private String comContents;
}
