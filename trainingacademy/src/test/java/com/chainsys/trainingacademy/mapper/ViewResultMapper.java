package com.chainsys.trainingacademy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.trainingacademy.model.Result;

public class ViewResultMapper implements RowMapper<Result> {

	@Override
	public Result mapRow(ResultSet rs, int rowNum) throws SQLException {
		Result result=new Result();
		result.setId(rs.getInt("learner_id"));
		result.setName(rs.getString("learner_name"));
		result.setCourse(rs.getString("learner_course"));
		result.setScore(rs.getInt("learner_score"));
		result.setPercentage(rs.getInt("learner_percentage"));
		return result;
	}

}
