package com.chainsys.trainingacademy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.trainingacademy.model.Videos;

public class ViewVideoMapper implements RowMapper<Videos> {

	@Override
	public Videos mapRow(ResultSet rs, int rowNum) throws SQLException {
		Videos getVideoDetails=new Videos();
		getVideoDetails.setId(rs.getInt("VideoID"));
		getVideoDetails.setTitle(rs.getString("VideoTitle"));
		getVideoDetails.setLink(rs.getString("VideoLink"));
		getVideoDetails.setCategory(rs.getString("Category"));
		getVideoDetails.setModuleType(rs.getString("video_type"));
		return getVideoDetails;
	}
	

}