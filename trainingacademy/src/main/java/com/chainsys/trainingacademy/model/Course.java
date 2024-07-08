package com.chainsys.trainingacademy.model;

import org.springframework.web.multipart.MultipartFile;

public class Course {
	int courseId;
	String courseName;
	String courseType;
	byte[] courseImage;
	int amount;
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
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
	public String getCourseType() {
		return courseType;
	}
	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}
	public Course(int courseId, String courseName, String courseType, byte[] courseImage,int amount) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseType = courseType;
		this.courseImage = courseImage;
		this.amount=amount;
	}
	public Course() {
	}
	
	public byte[] getCourseImage() {
		return courseImage;
	}
	public void setCourseImage(byte[] courseImage) {
		this.courseImage = courseImage;
	}
	
}