package com.chainsys.trainingacademy.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.chainsys.trainingacademy.model.Comments;
import com.chainsys.trainingacademy.model.Course;
import com.chainsys.trainingacademy.model.LearnerPaymentStatus;
import com.chainsys.trainingacademy.model.Questions;
import com.chainsys.trainingacademy.model.Result;
import com.chainsys.trainingacademy.model.Users;
import com.chainsys.trainingacademy.model.Videos;
import com.chainsys.trainingacademy.mapper.*;

@Repository("userDao")
public class UserImpl implements UserDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public boolean insertRegister(Users insertUserDetails) {

		String register = "SELECT count(*)FROM users WHERE user_mailid=?";
		Object[] email = { insertUserDetails.getEmail() };
		int count = jdbcTemplate.queryForObject(register, Integer.class, email);
		if (count == 0) {
			String query = "insert into users(user_name,user_mailid,user_phonenumber,user_password)values(?,?,?,?)";
			Object[] table = { insertUserDetails.getName(), insertUserDetails.getEmail(), insertUserDetails.getPhone(),
					insertUserDetails.getPassword() };
			jdbcTemplate.update(query, table);
			return true;
		}
		return false;

	}

	@Override
	public boolean insertLogin(Users insertLoginDetails) {

		String register = "SELECT count(*)FROM users WHERE user_mailid=?&&user_password=?";
		Object[] email = { insertLoginDetails.getEmail(), insertLoginDetails.getPassword() };
		int count = jdbcTemplate.queryForObject(register, Integer.class, email);
		if (count == 0) {

			return false;
		}

		return true;

	}

	@Override
	public Users getId(Users insertLoginDetails) {

		String id = "SELECT user_id,user_name FROM users WHERE user_mailid=?";
		Object[] email = { insertLoginDetails.getEmail() };
		Users courseId = jdbcTemplate.queryForObject(id, new Mapper(), email);
		return courseId;
	}

	@Override
	public void addQuestion(Questions viewQuestions) {

		String query = "insert into question (questions,option_1,option_2,option_3,option_4,correct_answer,category)values(?,?,?,?,?,?,?)";
		Object[] questionContent = { viewQuestions.getQuestion(), viewQuestions.getOptionA(),
				viewQuestions.getOptionA(), viewQuestions.getOptionC(), viewQuestions.getOptionD(),
				viewQuestions.getCorrectAnswer(), viewQuestions.getCourse() };
		jdbcTemplate.update(query, questionContent);

	}

	@Override
	public List<Questions> getQuestion(String category) throws ClassNotFoundException, SQLException {
		String query = "select id,questions,option_1,option_2,option_3,option_4,correct_answer,category from question where category=?";
		Object[] course = { category };
		List<Questions> user = jdbcTemplate.query(query, new ViewQuestionMapper(), course);
		return user;

	}

	@Override
	public void addVideo(Videos insertvideo) {
		String query = "insert into videos(VideoTitle,VideoLink,Category,video_type)values(?,?,?,?)";
		Object[] video = { insertvideo.getTitle(), insertvideo.getLink(), insertvideo.getCategory(),
				insertvideo.getModuleType() };
		jdbcTemplate.update(query, video);
	}

	@Override

	public List<Videos> getVideo(Videos video, String category) throws ClassNotFoundException, SQLException {
		String query = "select VideoID,VideoTitle,VideoLink,VideoLink,Category,video_type from videos where category=?&&video_type=?";
		Object[] course = { category, video.getModuleType() };
		List<Videos> user = jdbcTemplate.query(query, new ViewVideoMapper(), course);
		return user;
	}

	@Override
	public List<Questions> getAllQuestions() throws ClassNotFoundException, SQLException {
		String query = "select id,questions,option_1,option_2,option_3,option_4,correct_answer,category from question";
		List<Questions> user = jdbcTemplate.query(query, new ViewQuestionMapper());
		return user;

	}

	@Override
	public List<Videos> getAllVideos() throws ClassNotFoundException, SQLException {
		String query = "select VideoID,VideoTitle,VideoLink,VideoLink,Category,video_type from videos";
		List<Videos> user = jdbcTemplate.query(query, new ViewVideoMapper());
		return user;

	}

	@Override
	public void deleteQuestions(int id) throws ClassNotFoundException, SQLException {
		String delete = "DELETE FROM question WHERE id=?";
		Object[] questionId = { id };
		jdbcTemplate.update(delete, questionId);

	}

	@Override
	public void updateQuestion(Questions updateQuestions, int updateId) throws ClassNotFoundException, SQLException {
		String query = "update question set questions=?,option_1=?,option_2=?,option_3=?,option_4=?,correct_answer=? where id=?";
		Object[] table = { updateQuestions.getQuestion(), updateQuestions.getOptionA(), updateQuestions.getOptionB(),
				updateQuestions.getOptionC(), updateQuestions.getOptionD(), updateQuestions.getCorrectAnswer(),
				updateId };
		jdbcTemplate.update(query, table);
	}

	@Override
	public void updateVideo(Videos updateVideos) throws ClassNotFoundException, SQLException {
		String query = "update videos set VideoTitle=?,VideoLink=? where VideoID=? ";
		Object[] table = { updateVideos.getTitle(), updateVideos.getLink(), updateVideos.getId() };
		jdbcTemplate.update(query, table);

	}

	@Override
	public void deleteVideo(int deleteId) throws ClassNotFoundException, SQLException {
		String query = "DELETE FROM videos where  VideoID=? ";
		jdbcTemplate.update(query, deleteId);

	}

	@Override
	public List<Result> getAllResults() throws ClassNotFoundException, SQLException {
		String query = "select learner_id,learner_name,learner_course,learner_score,learner_percentage from learner_result";
		List<Result> comments = jdbcTemplate.query(query, new ViewResultMapper());
		return comments;
	}

	@Override
	public List<Comments> getAllComments() throws ClassNotFoundException, SQLException {
		String query = "select learner_id,learner_name,learner_course,learner_comments from learner_comments";
		List<Comments> viewComments = jdbcTemplate.query(query, new ViewCommentMapper());
		return viewComments;
	}

	@Override
	public void insertCourse(Course addCourse) throws ClassNotFoundException, SQLException {
		String query = "insert into add_course(course_name,course_type,course_image,course_amount) values(?,?,?,?) ";
		Object[] course = { addCourse.getCourseName(), addCourse.getCourseType(), addCourse.getCourseImage(),
				addCourse.getAmount() };
		jdbcTemplate.update(query, course);
	}

	@Override
	public List<Course> viewCourse() throws ClassNotFoundException, SQLException {
		String query = "select course_id,course_name,course_type,course_image,course_amount from add_course";
		List<Course> viewCourse = jdbcTemplate.query(query, new ViewCourseMapper());
		return viewCourse;
	}

	@Override
	public List<Course> getCourseType(String course) throws ClassNotFoundException, SQLException {
		String query = "select course_id,course_name,course_type,course_image,course_amount from add_course WHERE course_type=?";
		Object[] courseType = { course };
		List<Course> viewCourse = jdbcTemplate.query(query, new ViewCourseMapper(), courseType);
		return viewCourse;
	}

	@Override
	public List<Videos> getFreeModules(Course courseName) throws ClassNotFoundException, SQLException {
		String videoType = "free";
		String query = "select VideoID,VideoTitle,VideoLink,VideoLink,Category,video_type from videos where Category=?&&video_type=?";
		Object[] type = { courseName.getCourseName(), videoType };
		List<Videos> viewVideo = jdbcTemplate.query(query, new ViewVideoMapper(), type);
		return viewVideo;

	}

	@Override
	public void insertLearnerPayment(LearnerPaymentStatus insertPayment) throws ClassNotFoundException, SQLException {
		String query = "INSERT INTO learner_payment(learner_id, learner_name, course_id, course_name, accountNumber, payment, amount,enroll_date) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
		Object[] type = { insertPayment.getLearnerId(), insertPayment.getLearnerName(), insertPayment.getCourseId(),
				insertPayment.getCourseName(), insertPayment.getAccountNumber(), insertPayment.getPayment(),
				insertPayment.getAmount(), insertPayment.getDate() };
		jdbcTemplate.update(query, type);

	}

	@Override
	public List<Videos> viewCourseVideos(Course courseName) throws ClassNotFoundException, SQLException {
		String videoType = "notfree";
		String query = "select VideoID,VideoTitle,VideoLink,VideoLink,Category,video_type from videos where Category=?&&video_type=?";
		Object[] type = { courseName.getCourseName(), videoType };
		List<Videos> viewVideo = jdbcTemplate.query(query, new ViewVideoMapper(), type);
		return viewVideo;

	}

	@Override
	public List<Questions> viewCourseQuestion(Course courseName) throws ClassNotFoundException, SQLException {
		String query = "select id,questions,option_1,option_2,option_3,option_4,correct_answer,category from question where category=?";
		Object[] type = { courseName.getCourseName() };
		List<Questions> user = jdbcTemplate.query(query, new ViewQuestionMapper(), type);
		return user;

	}

	@Override
	public List<Map<Integer, String>> getAllCorrectAnswers() throws ClassNotFoundException, SQLException {
		String query = "SELECT id,correct_answer from question";
		List<Map<Integer, String>> map = jdbcTemplate.query(query, new ViewCorrectAnswerMapper());
		return map;

	}

	@Override
	public void insertUserResult(Result result) throws ClassNotFoundException, SQLException {
		String query = "insert into learners_result (learner_id,learner_name,learner_course,learner_score,learner_percentage) values(?,?,?,?,?)";
		Object[] insertResult = { result.getId(), result.getName(), result.getCourse(), result.getScore(),
				result.getPercentage() };
		jdbcTemplate.update(query, insertResult);

	}

	@Override
	public boolean checkExistingCourse (String courseName, int userId) throws ClassNotFoundException, SQLException {
		String query = "SELECT count(*)FROM learner_payment  WHERE course_name =?&&learner_id=?";
		Object[] type = { courseName, userId };
		int count = jdbcTemplate.queryForObject(query, Integer.class, type);
		if (count == 0) {
			return false;
		}
		return true;
	}

	@Override
	public boolean changePayment(String name, int id) throws ClassNotFoundException, SQLException {
		String query = "SELECT payment_id FROM learner_payment  WHERE course_name =?&&learner_id=?";
		Object[] type = { name, id };
		int count = jdbcTemplate.queryForObject(query, Integer.class, type);
		try {
			return count != 0;
		} catch (Exception e) {
			System.out.println("<-----");
			return false;
		}
	}

	@Override
	public void insertComment(Comments comment) throws ClassNotFoundException, SQLException {
		String query = "insert into learner_comment(learner_id,learner_name,learner_course,learner_comments) values (?,?,?,?)";
		Object[] course = { comment.getLearnerId(), comment.getLearnerName(), comment.getLearnerCourse(),
				comment.getLearnerComments() };
		jdbcTemplate.update(query, course);

	}

	@Override
	public List<Questions> searchQuestions(String name) throws ClassNotFoundException, SQLException {

		String query = "select * from question where category=?";
		Object[] value = { name };
		return jdbcTemplate.query(query, new ViewQuestionMapper(), value);

	}

	@Override
	public   List<Videos> getSearchVideos(String name) throws ClassNotFoundException, SQLException {
		String query = "select * from videos WHERE Category=?";
		Object[] value = { name };
		return jdbcTemplate.query(query, new ViewVideoMapper(), value);

	}

	@Override
	public List<LearnerPaymentStatus> viewPayment() {
		String query = "select from learner_id,learner_name,course_name,amount,payment,enroll_date from learner_payment";
		return jdbcTemplate.query(query, new ViewPaymentMapper());
	}

}
