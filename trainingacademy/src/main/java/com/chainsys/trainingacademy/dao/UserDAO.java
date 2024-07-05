package com.chainsys.trainingacademy.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.trainingacademy.model.Comments;
import com.chainsys.trainingacademy.model.Course;
import com.chainsys.trainingacademy.model.Questions;
import com.chainsys.trainingacademy.model.Result;
import com.chainsys.trainingacademy.model.Users;
import com.chainsys.trainingacademy.model.Videos;

@Repository
public interface UserDAO {

boolean insertRegister( Users insertDetails);
boolean insertLogin(Users insertLoginDetails);
Users getId(Users insertLoginDetails);
void addQuestion(Questions viewQuestions);
List<Questions>getQuestion(String category)throws ClassNotFoundException, SQLException;
void addVideo(Videos insertvideo);
List<Videos> getVideo(String category)throws ClassNotFoundException, SQLException;
List<Questions> getAllQuestions()throws ClassNotFoundException,SQLException;
List<Videos>getAllVideos()throws ClassNotFoundException,SQLException;
void deleteQuestions(int id)throws ClassNotFoundException,SQLException;
void updateQuestion(Questions updateQuestions,int updateId)throws ClassNotFoundException,SQLException;
void updateVideo(Videos updateVideos)throws ClassNotFoundException,SQLException;
void deleteVideo(int deleteId) throws ClassNotFoundException,SQLException;
List<Result> getAllResults() throws ClassNotFoundException,SQLException;
List<Comments>getAllComments() throws ClassNotFoundException,SQLException;
void insertCourse( Course addCourse) throws ClassNotFoundException,SQLException;
List<Course>viewCourse() throws ClassNotFoundException,SQLException;
List<Course>getCourseType(String course)throws ClassNotFoundException,SQLException;
}
