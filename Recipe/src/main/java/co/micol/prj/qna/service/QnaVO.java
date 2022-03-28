package co.micol.prj.qna.service;






import lombok.Getter;
import lombok.Setter;



@Setter
@Getter
public class QnaVO {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContents;
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContents() {
		return qnaContents;
	}
	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}
	
}
