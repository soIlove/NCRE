package com.cyber.ncre.entity;

import java.io.Serializable;

public class news implements Serializable {

	private static final long serialVersionUID = 3894967780471666731L;

	private Integer news_id;
	private String news_name;
	private String news_text;
	private String news_pic;
	private String news_date;

	public news() {
		// TODO Auto-generated constructor stub
	}

	public news(Integer news_id, String news_name, String news_text, String news_pic, String news_date) {
		super();
		this.news_id = news_id;
		this.news_name = news_name;
		this.news_text = news_text;
		this.news_pic = news_pic;
		this.news_date = news_date;
	}

	public Integer getNews_id() {
		return news_id;
	}

	public void setNews_id(Integer news_id) {
		this.news_id = news_id;
	}

	public String getNews_name() {
		return news_name;
	}

	public void setNews_name(String news_name) {
		this.news_name = news_name;
	}

	public String getNews_text() {
		return news_text;
	}

	public void setNews_text(String news_text) {
		this.news_text = news_text;
	}

	public String getNews_pic() {
		return news_pic;
	}

	public void setNews_pic(String news_pic) {
		this.news_pic = news_pic;
	}

	public String getNews_date() {
		return news_date;
	}

	public void setNews_date(String news_date) {
		this.news_date = news_date;
	}

	@Override
	public String toString() {
		return "news [news_id=" + news_id + ", news_name=" + news_name + ", news_text=" + news_text + ", news_pic="
				+ news_pic + ", news_date=" + news_date + "]";
	}

}
