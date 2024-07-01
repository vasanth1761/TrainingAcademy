package com.chainsys.trainingacademy.model;

public class Course {
	 int courseId;
	 String courseName;
	 String paymentType;
	 String accoutNumber;
	 String date;
	 int amount;
	public int getCourseid() {
		return courseId;
	}
	public void setCourseid(int courseid) {
		this.courseId = courseid;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		courseName = courseName;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getAccoutNumber() {
		return accoutNumber;
	}
	public void setAccoutNumber(String accoutNumber) {
		accoutNumber = accoutNumber;
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
	public Course(int courseId, String courseName, String paymentType, String accoutNumber, String date, int amount) {
		super();
		this.courseId = courseId;
		courseName = courseName;
		this.paymentType = paymentType;
		accoutNumber = accoutNumber;
		this.date = date;
		this.amount = amount;
	}

}
