package com.chainsys.trainingacademy.model;

public class Course {
	int courseid;
	 String CourseName;
	 String paymentType;
	 String AccoutNumber;
	 String date;
	 int amount;
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public String getCourseName() {
		return CourseName;
	}
	public void setCourseName(String courseName) {
		CourseName = courseName;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getAccoutNumber() {
		return AccoutNumber;
	}
	public void setAccoutNumber(String accoutNumber) {
		AccoutNumber = accoutNumber;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Course(int courseid, String courseName, String paymentType, String accoutNumber, String date, int amount) {
		super();
		this.courseid = courseid;
		CourseName = courseName;
		this.paymentType = paymentType;
		AccoutNumber = accoutNumber;
		this.date = date;
		this.amount = amount;
	}

}
