package com.chainsys.trainingacademy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.trainingacademy.model.Comments;

public class ViewCommentMapper implements RowMapper<Comments> {

	@Override
	public Comments mapRow(ResultSet rs, int rowNum) throws SQLException {
		Comments comment=new Comments();
		comment.setLearnerId(rs.getInt("learner_id"));
		comment.setLearnerName(rs.getString("learner_name"));
		comment.setLearnerCourse(rs.getString("learner_course"));
		comment.setLearnerComments(rs.getString("learner_comments"));
		return comment;
	}

}
