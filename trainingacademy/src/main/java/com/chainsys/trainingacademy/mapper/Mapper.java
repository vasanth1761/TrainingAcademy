package com.chainsys.trainingacademy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.trainingacademy.model.Users;

public class Mapper implements RowMapper<Users>{

	@Override
	public Users mapRow(ResultSet rs, int rowNum) throws SQLException {

       Users user=new Users();
		
	   user.setId(rs.getInt("user_id"));
	   user.setName(rs.getString("user_name"));
	   return user;
		
	}

}