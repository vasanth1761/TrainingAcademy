package com.chainsys.trainingacademy.model;

public class Videos {
	int id;
    public Videos(int id, String title, String link, String category) {
		super();
		this.id = id;
		this.title = title;
		this.link = link;
		this.category = category;
	}
	public Videos() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	String title;
    String link;
    String category;
    
   

}
