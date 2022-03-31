package co.micol.prj.comments.service;

import java.util.List;

public interface CommentsService {
	
	List<CommentsVO> selectCommentsList();
	CommentsVO selectComments(CommentsVO vo);
	int insertComments(CommentsVO vo);
	int updateComments(CommentsVO vo);
	int deleteComments(CommentsVO vo);
	int cascadeComments(CommentsVO vo);
}
