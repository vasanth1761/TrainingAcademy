package com.chainsys.trainingacademy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.trainingacademy.model.Questions;

public class ViewQuestionMapper implements RowMapper<Questions>{

	@Override
	public Questions mapRow(ResultSet rs, int rowNum) throws SQLException {
		Questions question=new Questions();
		question.setId(rs.getInt("id"));
		question.setQuestion(rs.getString("questions"));
		question.setOptionA(rs.getString("option_1"));
		question.setOptionB(rs.getString("option_2"));
		question.setOptionC(rs.getString("option_3"));
		question.setOptionD(rs.getString("option_4"));
		question.setCorrectAnswer(rs.getString("correct_answer"));
		question.setCourse(rs.getString("category"));
		return question;
	}

}
