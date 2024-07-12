package com.chainsys.trainingacademy.validation;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Configuration
public class TrainingAcademyValidation {
public boolean checkEmail(String email) 
    {
		
		return email.matches("^[a-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[a-zA-Z]{2,}$");
	
	}
	
	public boolean checkPassword(String password)
	{
		return password.matches("(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*\\d).{5,}");

	}
	
	public boolean checkName(String name)
	{
		return name.matches("[a-zA-Z]+");
	}
	
	public boolean checkNumber(String number)
	{
		return number.matches("^[6-9]\\d{9}$");
	}

}
