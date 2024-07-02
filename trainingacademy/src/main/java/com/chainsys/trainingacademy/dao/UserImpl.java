package com.chainsys.trainingacademy.dao;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.trainingacademy.model.Questions;
import com.chainsys.trainingacademy.model.Result;
import com.chainsys.trainingacademy.model.Users;
import com.chainsys.trainingacademy.model.Videos;
import com.chainsys.trainingacademy.mapper.*;
@Repository
public class UserImpl implements UserDAO {
	@Autowired
	 JdbcTemplate jdbcTemplate;
	@Override
	public boolean insertRegister(Users insertDetails) {

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

		String register="SELECT count(*)FROM users WHERE user_mailid=?&&user_password=?";
		Object[]email= {insertLoginDetails.getEmail(),insertLoginDetails.getPassword()};
		int count= jdbcTemplate.queryForObject(register,Integer.class,email);
		if(count==0)
		{
		
		return false;
	    }
			
		return true;
		
	}
	@Override
	public Users getId(Users insertLoginDetails) {

		String id="SELECT user_id,user_name FROM users WHERE user_mailid=?";
		Object[]email= {insertLoginDetails.getEmail()};
		Users courseId=jdbcTemplate.queryForObject(id,new Mapper(),email);
		return courseId ;
	}
	@Override
	public void addQuestion(Questions viewQuestions) {
       
		String query="insert into question (questions,option_1,option_2,option_3,option_4,correct_answer,category)values(?,?,?,?,?,?,?)";
		Object[]questionContent= {viewQuestions.getQuestion(),viewQuestions.getOptionA(),viewQuestions.getOptionA(),
				viewQuestions.getOptionC(),viewQuestions.getOptionD(),viewQuestions.getCorrectAnswer(),viewQuestions.getCourse()};
		jdbcTemplate.update(query,questionContent);	
		
		
	}
	public List<Questions>getQuestion(String category)throws ClassNotFoundException, SQLException{
		String query="select id,questions,option_1,option_2,option_3,option_4,correct_answer,category from question where category=?";
		Object[]course= {category};
		List<Questions>user=jdbcTemplate.query(query,new ViewQuestionMapper(),course);
		return user;
		
	
}
	@Override
	public void addVideo(Videos insertvideo) {
		String query="insert into videos(VideoTitle,VideoLink,Category)values(?,?,?)";
		Object[]video= {insertvideo.getTitle(),insertvideo.getLink(),insertvideo.getCategory()};
		jdbcTemplate.update(query,video);
	}
	
	@Override
	
	public List<Videos> getVideo(String category)throws ClassNotFoundException, SQLException{
		String query="select VideoID,VideoTitle,VideoLink,VideoLink,Category from videos where category=?";
		Object[]course= {category};
		List<Videos>user=jdbcTemplate.query(query,new ViewVideoMapper(),course);
		return user;
}
	@Override
	public List<Questions> getAllQuestions() throws ClassNotFoundException, SQLException {
		String query="select id,questions,option_1,option_2,option_3,option_4,correct_answer,category from question";
		List<Questions>user=jdbcTemplate.query(query,new ViewQuestionMapper());
		return user;
		
	}
	@Override
	public List<Videos> getAllVideos() throws ClassNotFoundException, SQLException {
		String query="select VideoID,VideoTitle,VideoLink,VideoLink,Category from videos";
		List<Videos>user=jdbcTemplate.query(query,new ViewVideoMapper());
		return user;
		
}
	@Override
	public List<Result> getAllComments() throws ClassNotFoundException, SQLException {
		String query="select learner_id,learner_name,learner_course,learner_comments from learner_comments";
		List<Result>comments=jdbcTemplate.query(query,new ViewCommentMapper());
		return comments;
	}
}
