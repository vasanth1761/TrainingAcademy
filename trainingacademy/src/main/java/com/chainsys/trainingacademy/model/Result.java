package com.chainsys.trainingacademy.model;

public class Result {
	int id;
	String name;
	String course;
	int score;
	double percentage;
	int totalCount;
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	public Result(int id, String name, String course, int score, double percentage,int totalCount) {
		super();
		this.id = id;
		this.name = name;
		this.course = course;
		this.score = score;
		this.percentage = percentage;
		this.totalCount=totalCount;
	}
	public Result() {
		
	}
}
