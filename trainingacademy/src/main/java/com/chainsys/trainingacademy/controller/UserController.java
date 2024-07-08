package com.chainsys.trainingacademy.controller;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.trainingacademy.dao.UserDAO;
import com.chainsys.trainingacademy.model.Users;
import com.chainsys.trainingacademy.model.Videos;
import com.chainsys.trainingacademy.model.Course;
import com.chainsys.trainingacademy.model.LearnerPaymentStatus;

import jakarta.servlet.http.HttpSession;

@Controller

public class UserController {
@Autowired 
UserDAO userdao;
@RequestMapping("/")	
public String welcome()
{
	return "welcome.jsp";
}

@PostMapping("/register")
public  String user(@RequestParam("name") String name,@RequestParam("email") String email,@RequestParam("number")String number,@RequestParam("password")String password,Model model,HttpSession session) 
{  
   Users insertDetails= new Users();	
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
   return "login.jsp";

   }
   
}

@PostMapping("/login")
public String userLogin(@RequestParam("email") String email,@RequestParam("password") String password,HttpSession session,Model model)
{  
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
	return "register.jsp";
 
}
}


@PostMapping("/selectCourse")
public String course(@RequestParam("action")String course,Model model)
{
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
public String payment(@RequestParam("pay") String payment,@RequestParam("card_number")long accountNumber,HttpSession session)
{
	LocalDate d=LocalDate.now();
    String date=d.toString();
    LearnerPaymentStatus insertPayment=new LearnerPaymentStatus();
    Course courseDetails =(Course) session.getAttribute("course");
    Users userDetail=(Users)session.getAttribute("userId");
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
}

