package co.micol.prj.subscribe.service;

import java.util.List;

public interface SubsService {
	
	List<SubsVO> followingList(SubsVO vo); // 팔로잉 리스트
	List<SubsVO> followerList(SubsVO vo);  // 팔로워 리스트
	
	int insertFollowing(SubsVO vo); // 구독하기
	int deleteFollowing(SubsVO vo); // 구독취소
	

}
