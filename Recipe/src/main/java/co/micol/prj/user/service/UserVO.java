package co.micol.prj.user.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class UserVO {

	private int userNo;
	private String userId;
	private String userPassword;
	private String userName;
	private String userAlias;
	private String userAddress;
	private String userTel;
	private int userSubs;
	private String userAuthor;
}
