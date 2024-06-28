package com.chainsys.trainingacademy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
@RequestMapping("/")	
public String Welcome()
{
	return "welcome.jsp";
}

@PostMapping("/user")
public  String user()
{   
	
	return"welcome.jsp";
}

}
