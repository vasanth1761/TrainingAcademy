package com.chainsys.trainingacademy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.trainingacademy.dao.UserDAO;
import com.chainsys.trainingacademy.model.Users;

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
    Users id=userdao.getId(insertLoginDetails);	
    session.setAttribute("id", id);
    if(email.endsWith("@systech.com")&& password.endsWith("Vasanth@1761"))
	{
   
		return"redirect:/admin.jsp";
	}
	else
	{
		return "course.jsp";
	}
	
    }
    else
    {
	return "register.jsp";
 
}
}


}

