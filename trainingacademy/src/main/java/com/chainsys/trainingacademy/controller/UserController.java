package com.chainsys.trainingacademy.controller;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.trainingacademy.dao.UserDAO;
import com.chainsys.trainingacademy.model.Users;
import com.chainsys.trainingacademy.model.Videos;
import com.chainsys.trainingacademy.validation.TrainingAcademyValidation;
import com.chainsys.trainingacademy.model.Comments;
import com.chainsys.trainingacademy.model.Course;
import com.chainsys.trainingacademy.model.LearnerPaymentStatus;
import com.chainsys.trainingacademy.model.Questions;
import com.chainsys.trainingacademy.model.Result;

import jakarta.servlet.http.HttpSession;

@Controller

public class UserController {
@Autowired 
UserDAO userdao;


 @Autowired TrainingAcademyValidation validation;
 @RequestMapping("/")	
public String welcome()
{
	return "welcome.jsp";
}

@PostMapping("/register")
public  String user(@RequestParam("name") String name,@RequestParam("email") String email,@RequestParam("number")String number,@RequestParam("password")String password,Model model,HttpSession session) 
{  
   Users insertDetails= new Users();
   if (!validation.checkEmail(email))
	  { 
	  model.addAttribute("error","Invalid email!!!!"); 
	  return "register.jsp";
	  }
   if (!validation.checkPassword(password)) 
	 { 
   model.addAttribute("error","Invalid password!!!"); 
	 return "register.jsp";
	 }
		
		 if(!validation.checkName(name)) {
		  model.addAttribute("error","username is not in required format!!!");
		  
				  return"register.jsp"; }
		 
   if(!validation.checkNumber(number))
   {
	   model.addAttribute("error","phonenumber is not in required format!!!"); 
		 return "register.jsp"; 
   }
	   
   insertDetails.setName(name);
   insertDetails.setEmail(email);
   insertDetails.setPhone(number);
   insertDetails.setPassword(password);
   if(userdao.insertRegister(insertDetails))
   {
	   return "welcome.jsp";
   }
   else
   {
   model.addAttribute("errorMessage", "Account already exists So please Login");
   return "login.jsp";

   }
   
}

@PostMapping("/login")
public String userLogin(@RequestParam("email") String email,@RequestParam("password") String password,HttpSession session,Model model)
{   
	
	  if (!validation.checkEmail(email))
	  { 
	  model.addAttribute("error","Invalid email!!!!"); 
	  return "login.jsp";
	  }
	 
	  
	 
	 if (!validation.checkPassword(password)) 
	 { 
     model.addAttribute("error","Invalid password!!!"); 
	 return "login.jsp";
	 }
    Users insertLoginDetails=new Users();
    insertLoginDetails.setEmail(email);
    
    insertLoginDetails.setPassword(password);
    if(userdao.insertLogin(insertLoginDetails))
    {
    Users userId=userdao.getId(insertLoginDetails);	
    session.setAttribute("userId", userId);
    if(email.endsWith("@systech.com")&& password.endsWith("Vasanth@1761"))
	{
   
		return"redirect:/admin.jsp";
	}
	else
	{
		return "viewCourse.jsp";
	}
	
    }
    else
    {
    model.addAttribute("errorMessage", "you dont have an account please Register");	
	return "register.jsp";
 
}
}


@PostMapping("/selectCourse")
public String course(@RequestParam("action")String course,Model model,HttpSession session)
{    
	 Users user = (Users) session.getAttribute("userId");
	System.out.println(course);
	try {
		List<Course>viewCourse=userdao.getCourseType(course);
		model.addAttribute("viewCourse", viewCourse);
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
return "course.jsp";
}


@PostMapping("/selectedCourse")
public String selectedCourse(@RequestParam("coursename")String courseName,@RequestParam("courseamount")int courseAmount,
		@RequestParam("courseid")int id,
		Model model,HttpSession session)
{   
	Course insertFreeCourse=new Course();
	
	insertFreeCourse.setCourseName(courseName);
	insertFreeCourse.setAmount(courseAmount);
	insertFreeCourse.setCourseId(id);
	session.setAttribute("course", insertFreeCourse);
	Users userDetail=(Users)session.getAttribute("userId");
	int userId1=userDetail.getId();
	
	try {
		if(userdao.checkExistingCourse(courseName,userId1))
		{   
			Course courseDetails =(Course) session.getAttribute("course");
			courseDetails.getCourseName();
			List<Videos>viewVideos=userdao.viewCourseVideos(courseDetails);
			model.addAttribute("courseNotFreeVideos", viewVideos);
			return "selectedCourseVideo.jsp";
			
		}
	} catch (ClassNotFoundException e) {
	
		e.printStackTrace();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	try {
		List<Videos>viewVideos=userdao.getFreeModules(insertFreeCourse);
		model.addAttribute("courseFreeVideos", viewVideos);
		
		
	} catch (ClassNotFoundException e) {

		e.printStackTrace();
	} catch (SQLException e) {

		e.printStackTrace();
	}
	return "viewDemoVideo.jsp";
	
}




@PostMapping("/paymentDetails")
public String payment(@RequestParam("pay") String payment,@RequestParam("account-number")String accountNumber,HttpSession session)
{
	LocalDate d=LocalDate.now();
    String date=d.toString();
    LearnerPaymentStatus insertPayment=new LearnerPaymentStatus();
    Course courseDetails =(Course) session.getAttribute("course");
    Users userDetail=(Users)session.getAttribute("userId");
    insertPayment.setLearnerId(userDetail.getId());
    insertPayment.setCourseId(courseDetails.getCourseId());
    insertPayment.setLearnerName(userDetail.getName());
    insertPayment.setCourseId(courseDetails.getCourseId());
    insertPayment.setCourseName(courseDetails.getCourseName());
    insertPayment.setDate(date);
    insertPayment.setAccountNumber(accountNumber);
    insertPayment.setPayment(payment);
    insertPayment.setAmount(courseDetails.getAmount());
    try {
		userdao.insertLearnerPayment(insertPayment);
	} catch (ClassNotFoundException e) {

		e.printStackTrace();
	} catch (SQLException e) {
	
		e.printStackTrace();
	}
	return "paymentSuccess.jsp";
	
}
@RequestMapping("/selectedCourseVideos")
public String selectedCourseVideos(HttpSession session,Model model)
{   
	Course courseDetails =(Course) session.getAttribute("course");
	courseDetails.getCourseName();
	try {
		List<Videos>viewVideos=userdao.viewCourseVideos(courseDetails);
		model.addAttribute("courseNotFreeVideos", viewVideos);
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	} catch (SQLException e) {
	
		e.printStackTrace();
	}
	return "selectedCourseVideo.jsp";
	
}
@RequestMapping("/getQuestion")
public String getQuestion(HttpSession session,Model model)
{   
	Course courseDetails =(Course) session.getAttribute("course");
	courseDetails.getCourseName();

	try {
		List<Questions>viewQuestions=userdao.viewCourseQuestion(courseDetails);
		model.addAttribute("viewQuestion",viewQuestions);
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	return "viewTest.jsp";
	
}
  @PostMapping("/PercentageVerification") 
  public String percentageVerification(@RequestParam("percentage")String percentage,HttpSession session,Model model ) 
  { 
	  double percentagee =Double.parseDouble(percentage); if (percentagee >= 80) 
	  {
  
  Result result=(Result)session.getAttribute("result");
 
  try { userdao.insertUserResult(result); } catch (ClassNotFoundException |SQLException e) {
  
  e.printStackTrace(); }
  
  return "certificate.jsp";
  
  } else { model.addAttribute("errorMessage","you didnt pass the exam so learn again ");
  
  }
 
  return "sorryPage.jsp";
  
  }
 

@RequestMapping("/checkResult")
public String checkResultPost(@RequestParam Map<String, String> allParams, HttpSession session, Model model) {
    Map<String, String> answersMap = new HashMap<>();
    System.out.println("hi");
    System.out.println(allParams);

    for (Map.Entry<String, String> entry : allParams.entrySet()) {
        if (entry.getKey().startsWith("answer")) {
            String questionId = entry.getKey().substring("answer".length());
            answersMap.put(questionId, entry.getValue());
        }
    }

    List<Map<Integer, String>> correctAnswersMap; 
    try {
        correctAnswersMap = userdao.getAllCorrectAnswers(); 
        System.out.println("hi vasanth");
        System.out.println(correctAnswersMap);
    } catch (ClassNotFoundException | SQLException e) { 
        e.printStackTrace(); 
        return "error"; 
    }

    int correctCount = 0;
    int attemptedCount = 0;

    for (Map.Entry<String, String> entry : answersMap.entrySet()) {
        String questionId = entry.getKey();
        String userAnswer = entry.getValue();
        String correctAnswer = null;

        for (Map<Integer, String> correctAnswerMap : correctAnswersMap) {
            correctAnswer = correctAnswerMap.get(Integer.parseInt(questionId));
            if (correctAnswer != null) break;
        }

        if (correctAnswer != null) {
            attemptedCount++;
            if (correctAnswer.equals(userAnswer)) {
                correctCount++;
            }
        }
    }

   
    double percentage = (correctCount * 100.0) / 10;

    Result results = new Result();
    Users user = (Users) session.getAttribute("userId");
    Course courseName = (Course) session.getAttribute("course");
    results.setId(user.getId());
    results.setName(user.getName());
    results.setCourse(courseName.getCourseName());
    results.setScore(correctCount);
    results.setPercentage(percentage);
    session.setAttribute("result", results);
    model.addAttribute("name", user.getName());
    model.addAttribute("totalCount", 10); 
    model.addAttribute("correctCount", correctCount);
    model.addAttribute("percentage", percentage);
    return "result.jsp";
}
@PostMapping("/Comments")
public String comments(@RequestParam("comment") String comment,HttpSession session)
{   
	Comments insertComment=new Comments();
	Users user = (Users) session.getAttribute("userId");
    Course courseName = (Course) session.getAttribute("course");
    insertComment.setLearnerId(user.getId());
    insertComment.setLearnerCourse(courseName.getCourseName());
    insertComment.setLearnerName(user.getName());
    insertComment.setLearnerComments(comment);
    try {
		userdao.insertComment(insertComment);
	} catch (ClassNotFoundException e) {
	
		e.printStackTrace();
	} catch (SQLException e) {
	
		e.printStackTrace();
	}

	return "thankYou.jsp";
	
}


}



