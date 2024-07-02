package com.chainsys.trainingacademy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.trainingacademy.dao.UserDAO;
import com.chainsys.trainingacademy.model.Questions;
@Controller
public class InstructorController {
	@Autowired 
	UserDAO userdao;
	@PostMapping("/add")	
	public String instructor(@RequestParam("course")String course,@RequestParam("question")String question,@RequestParam("option1")String option1,
			@RequestParam("option2")String option2,@RequestParam("option3")String option3,@RequestParam("option4")String option4,@RequestParam("correctAnswer")String correctAnswer)
	{ 
		Questions viewQuestion=new Questions();
	    viewQuestion.setCourse(course);
	    viewQuestion.setQuestion(question);
	    viewQuestion.setOptionA(option1);
	    viewQuestion.setOptionB(option2);
	    viewQuestion.setOptionC(option3);
	    viewQuestion.setOptionD(option4);
	    viewQuestion.setCorrectAnswer(correctAnswer);
	    userdao.addQuestion(viewQuestion);
		return "admin.jsp";
		
	}

}
