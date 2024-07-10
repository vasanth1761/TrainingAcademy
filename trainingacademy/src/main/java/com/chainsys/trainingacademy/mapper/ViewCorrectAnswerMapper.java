package com.chainsys.trainingacademy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.swing.tree.TreePath;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.trainingacademy.model.Questions;

public class ViewCorrectAnswerMapper implements RowMapper<Map<Integer, String>> {

	@Override
	public Map<Integer, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
		 Map<Integer, String> answersMap = new HashMap<>();
	        do {
	            int questionId = rs.getInt("id");
	            String correctAnswer = rs.getString("correct_answer");
	            answersMap.put(questionId, correctAnswer);
	        } while (rs.next());
	        return answersMap;
	    }
	}
	
	


