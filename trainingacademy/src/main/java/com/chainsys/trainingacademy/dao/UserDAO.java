package com.chainsys.trainingacademy.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chainsys.trainingacademy.model.Comments;
import com.chainsys.trainingacademy.model.Course;
import com.chainsys.trainingacademy.model.LearnerPaymentStatus;
import com.chainsys.trainingacademy.model.Questions;
import com.chainsys.trainingacademy.model.Result;
import com.chainsys.trainingacademy.model.Users;
import com.chainsys.trainingacademy.model.Videos;

@Repository
public interface UserDAO {

	public boolean insertRegister(Users insertDetails);

	public boolean insertLogin(Users insertLoginDetails);

	public Users getId(Users insertLoginDetails);

	public void addQuestion(Questions viewQuestions);

	public List<Questions> getQuestion(String category) throws ClassNotFoundException, SQLException;

	public void addVideo(Videos insertvideo);

	public List<Videos> getVideo(Videos video, String category) throws ClassNotFoundException, SQLException;

	public List<Questions> getAllQuestions() throws ClassNotFoundException, SQLException;

	public List<Videos> getAllVideos() throws ClassNotFoundException, SQLException;

	public void deleteQuestions(int id) throws ClassNotFoundException, SQLException;

	public void updateQuestion(Questions updateQuestions, int updateId) throws ClassNotFoundException, SQLException;

	public void updateVideo(Videos updateVideos) throws ClassNotFoundException, SQLException;

	public void deleteVideo(int deleteId) throws ClassNotFoundException, SQLException;

	public List<Result> getAllResults() throws ClassNotFoundException, SQLException;

	public List<Comments> getAllComments() throws ClassNotFoundException, SQLException;

	public void insertCourse(Course addCourse) throws ClassNotFoundException, SQLException;

	public List<Course> viewCourse() throws ClassNotFoundException, SQLException;

	public List<Course> getCourseType(String course) throws ClassNotFoundException, SQLException;

	public List<Videos> getFreeModules(Course video) throws ClassNotFoundException, SQLException;

	public void insertLearnerPayment(LearnerPaymentStatus insertPayment) throws ClassNotFoundException, SQLException;

	public List<Videos> viewCourseVideos(Course courseName) throws ClassNotFoundException, SQLException;

	public List<Questions> viewCourseQuestion(Course courseName) throws ClassNotFoundException, SQLException;

	public List<Map<Integer, String>> getAllCorrectAnswers() throws ClassNotFoundException, SQLException;

	public void insertUserResult(Result result) throws ClassNotFoundException, SQLException;

	public boolean checkExistingCourse(String courseName, int userId) throws ClassNotFoundException, SQLException;

	public boolean changePayment(String name, int id) throws ClassNotFoundException, SQLException;

	public void insertComment(Comments comment) throws ClassNotFoundException, SQLException;

	public List<Questions> searchQuestions(String name) throws ClassNotFoundException, SQLException;

	public List<Videos> getSearchVideos(String name) throws ClassNotFoundException, SQLException;

	public List<LearnerPaymentStatus> viewPayment();
}
