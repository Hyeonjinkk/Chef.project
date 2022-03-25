package co.micol.prj.recipe.service;


import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RecipeVO {
	private int rSeq;			// 일련번호		
	private String rName;		// 메뉴이름
	private String rWay;		// 조리방식
	private String rKind;		// 메뉴종류
	private String rWgt;		// 중량
	private int rEng;			// 열량
	private int rCar;			// 탄수화물
	private int rPro;			// 단백질
	private int rFat;			// 지방
	private int rNa;			// 나트륨
	private String rTag;		// 해쉬태그
	private String rImageSm;	// 메인이미지(소)
	private String rImageLg;	// 메인이미지(대)
	private String rParts;		// 재료
	private int userNo;			// 유저NO
	
	@JsonFormat(pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date rDate;			// 등록일자
	
//	레시피 요리과정
	
	private String manual01;	
	private String manualImage01;
	private String manual02;
	private String manualImage02;
	private String manual03;
	private String manualImage03;
	private String manual04;
	private String manualImage04;
	private String manual05;
	private String manualImage05;
	private String manual06;
	private String manualImage06;
	private String manual07;
	private String manualImage07;
	private String manual08;
	private String manualImage08;
	private String manual09;
	private String manualImage09;
	private String manual10;
	private String manualImage10;
	private String manual11;
	private String manualImage11;
	private String manual12;
	private String manualImage12;
	private String manual13;
	private String manualImage13;
	private String manual14;
	private String manualImage14;
	private String manual15;
	private String manualImage15;
	private String manual16;
	private String manualImage16;
	private String manual17;
	private String manualImage17;
	private String manual18;
	private String manualImage18;
	private String manual19;
	private String manualImage19;
	private String manual20;
	private String manualImage20;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
