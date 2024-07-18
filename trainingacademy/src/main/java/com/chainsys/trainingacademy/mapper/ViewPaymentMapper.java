package com.chainsys.trainingacademy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.trainingacademy.model.LearnerPaymentStatus;

public class ViewPaymentMapper implements RowMapper<LearnerPaymentStatus>{

	@Override
	public LearnerPaymentStatus mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		LearnerPaymentStatus getDetails= new LearnerPaymentStatus();
		getDetails.setLearnerId(rs.getInt("learner_id"));
		getDetails.setLearnerName(rs.getString("learner_name"));
		getDetails.setCourseName(rs.getString("course_name"));
		getDetails.setPayment(rs.getString("payment"));
		getDetails.setPayment(rs.getString("amount"));
		getDetails.setDate(rs.getString("enroll_date"));
		return getDetails;
	}
	

}
