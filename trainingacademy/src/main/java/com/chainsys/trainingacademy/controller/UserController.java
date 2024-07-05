package com.chainsys.trainingacademy.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.trainingacademy.dao.UserDAO;
import com.chainsys.trainingacademy.model.Users;
import com.chainsys.trainingacademy.model.Course;

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
public String Course(@RequestParam("action")String course,Model model)
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
}

