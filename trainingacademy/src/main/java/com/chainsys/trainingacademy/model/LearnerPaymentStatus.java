package com.chainsys.trainingacademy.model;

import java.time.LocalDate;

public class LearnerPaymentStatus {
	int learnerId;
	String learnerName;
	int courseId;
	String courseName;
	String date;
	String accountNumber;
	String payment;
	int amount;
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getLearnerId() {
		return learnerId;
	}
	public void setLearnerId(int learnerId) {
		this.learnerId = learnerId;
	}
	public String getLearnerName() {
		return learnerName;
	}
	public void setLearnerName(String learnerName) {
		this.learnerName = learnerName;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public LearnerPaymentStatus(int learnerId, String learnerName, int courseId, String courseName, String date,
			String accountNumber, String payment,int amount) {
		super();
		this.learnerId = learnerId;
		this.learnerName = learnerName;
		this.courseId = courseId;
		this.courseName = courseName;
		this.date = date;
		this.accountNumber = accountNumber;
		this.payment = payment;
		this.amount=amount;
	}
	public LearnerPaymentStatus() {
	
	}
}