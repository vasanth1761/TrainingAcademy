package com.chainsys.trainingacademy.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.chainsys.trainingacademy.dao.UserDAO;
import com.chainsys.trainingacademy.model.Questions;
import com.chainsys.trainingacademy.model.Videos;
@Controller
public class InstructorController {
	@Autowired 
	UserDAO userdao;
	@PostMapping("/add")	
	public String instructor(@RequestParam("course")String course,@RequestParam("question")String question,@RequestParam("option1")String option1,
			@RequestParam("option2")String option2,@RequestParam("option3")String option3,@RequestParam("option4")String option4,@RequestParam("correctAnswer")String correctAnswer,
			Model model)
	{ 
		Questions viewQuestion=new Questions();
	    viewQuestion.setCourse(course);
	    viewQuestion.setQuestion(question);
	    viewQuestion.setOptionA(option1);
	    viewQuestion.setOptionB(option2);
	    viewQuestion.setOptionC(option3);
	    viewQuestion.setOptionD(option4);
	    viewQuestion.setCorrectAnswer(correctAnswer);
	    String category=viewQuestion.getCourse();
	    userdao.addQuestion(viewQuestion);
	    try {
			List<Questions>viewQuestions= userdao.getQuestion(category);
			model.addAttribute("view", viewQuestions);
		} catch (ClassNotFoundException | SQLException e) {
		
			e.printStackTrace();
		}
		return "viewQuestion.jsp";
		
	}
	@PostMapping("/addVideo")
	public String video(@RequestParam("title")String title,@RequestParam("link")String link,@RequestParam("category")String category,Model model)
	{   
		Videos video=new Videos();
		video.setLink(link);
		video.setTitle(title);
		video.setCategory(category);
		String course=video.getCategory();
		userdao.addVideo(video);
		try {
			List<Videos>viewVideos=userdao.getVideo(course);
			model.addAttribute("video",viewVideos);
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		return "viewVideo.jsp";
		
	}
	@RequestMapping("/viewQuestions")
	public String questions(Model model) {
		try {
			List<Questions>viewQuestions=userdao.getAllQuestions();
			model.addAttribute("viewAllQuestions", viewQuestions);
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		return "Questions.jsp";
	}
	
	@RequestMapping("/viewVideos")
	public String videos(Model model)
	{   
		try {
			List<Videos>viewVideos=userdao.getAllVideos();
			model.addAttribute("viewAllVideos", viewVideos);
		} catch (ClassNotFoundException | SQLException e) {
		
			e.printStackTrace();
		}
		return "videos.jsp";
		
	}
	
	

	

}
