package co.micol.prj.question.service;





import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class QuestionVO {
	private int questionId;
	private String questionWriter;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date questionDate;
	private String questionTitle;
	private String questionContents;
	private int questionHit;
	
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getQuestionWriter() {
		return questionWriter;
	}
	public void setQuestionWriter(String questionWriter) {
		this.questionWriter = questionWriter;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContents() {
		return questionContents;
	}
	public void setQuestionContents(String questionContents) {
		this.questionContents = questionContents;
	}
	public int getQuestionHit() {
		return questionHit;
	}
	public void setQuestionHit(int questionHit) {
		this.questionHit = questionHit;
	}
	public Date getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}
	
}
