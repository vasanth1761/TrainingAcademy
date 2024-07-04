package com.chainsys.trainingacademy.model;

public class Comments {
	int learnerId;
	String learnerName;
	String learnerCourse;
	String learnerComments;
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
	public Comments(int learnerId, String learnerName, String learnerCourse, String learnerComments) {
		super();
		this.learnerId = learnerId;
		this.learnerName = learnerName;
		this.learnerCourse = learnerCourse;
		this.learnerComments = learnerComments;
	}
	public Comments() {
		
	}
	public String getLearnerCourse() {
		return learnerCourse;
	}
	public void setLearnerCourse(String learnerCourse) {
		this.learnerCourse = learnerCourse;
	}
	public String getLearnerComments() {
		return learnerComments;
	}
	public void setLearnerComments(String learnerComments) {
		this.learnerComments = learnerComments;
	}
}
