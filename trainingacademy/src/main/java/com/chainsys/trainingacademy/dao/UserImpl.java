package com.chainsys.trainingacademy.dao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.chainsys.trainingacademy.model.Users;
import com.chainsys.trainingacademy.mapper.*;
@Repository
public class UserImpl implements UserDAO {
	@Autowired
	 JdbcTemplate jdbcTemplate;
	@Override
	public boolean insertRegister(Users insertDetails) {
   // TODO document why this method is empty
	String register="SELECT count(*)FROM users WHERE user_mailid=?";
	Object[]email= {insertDetails.getEmail()};
	int count= jdbcTemplate.queryForObject(register,Integer.class,email);
	if(count==0)
	{
	String query="insert into users(user_name,user_mailid,user_phonenumber,user_password)values(?,?,?,?)";
	Object[]table= {insertDetails.getName(),insertDetails.getEmail(),insertDetails.getPhone(),insertDetails.getPassword()};
    jdbcTemplate.update(query, table);
	return true;
    }
	return false;
   
}
	@Override
	public boolean insertLogin(Users insertLoginDetails) {
		// TODO Auto-generated method stub
		String register="SELECT count(*)FROM users WHERE user_mailid=?&&user_password=?";
		Object[]email= {insertLoginDetails.getEmail(),insertLoginDetails.getPassword()};
		int count= jdbcTemplate.queryForObject(register,Integer.class,email);
		if(count==0)
		{
		
		return true;
	    }
	
		return false;
	}
	@Override
	public Users getId(Users insertLoginDetails) {
		// TODO Auto-generated method stub
		String id="SELECT user_id,user_name FROM users WHERE user_mailid=?";
		Object[]email= {insertLoginDetails.getEmail()};
		Users courseId=jdbcTemplate.queryForObject(id,new Mapper(),email);
		return courseId ;
	}
	
}
