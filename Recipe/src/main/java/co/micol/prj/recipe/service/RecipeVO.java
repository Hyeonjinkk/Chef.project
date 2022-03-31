package co.micol.prj.recipe.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import co.micol.prj.user.service.UserVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RecipeVO {
	private int recipeSeq; // 일련번호
	private String recipeName; // 메뉴이름
	private String recipeWay; // 조리방식
	private String recipeKind; // 메뉴종류
	private String recipeWgt; // 중량
	private int recipeLike; // 열량
	private int recipeCar; // 탄수화물
	private int recipePro; // 단백질
	private int recipeFat; // 지방
	private int recipeNa; // 나트륨
	private String recipeTag; // 해쉬태그
	private String recipeImageSm; // 메인이미지(소)
	private String recipeImageLg; // 메인이미지(대)
	private String recipeParts; // 재료
	private int userNo; // 유저NO
	private int recipeHit;	// 조회수
	private String userAlias;	// 별칭

	@JsonFormat(pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date recipeDate; // 등록일자

//	레시피 요리과정

	private String manual1;
	private String manualImage1;
	private String manual2;
	private String manualImage2;
	private String manual3;
	private String manualImage3;
	private String manual4;
	private String manualImage4;
	private String manual5;
	private String manualImage5;
	private String manual6;
	private String manualImage6;
	private String manual7;
	private String manualImage7;
	private String manual8;
	private String manualImage8;
	private String manual9;
	private String manualImage9;
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
