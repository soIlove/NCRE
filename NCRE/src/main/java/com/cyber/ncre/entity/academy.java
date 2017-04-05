package com.cyber.ncre.entity;

public class academy {

	private Integer aid;
	private String aname;

	public academy() {
		// TODO Auto-generated constructor stub
	}

	public academy(Integer aid, String aname) {
		super();
		this.aid = aid;
		this.aname = aname;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	@Override
	public String toString() {
		return "academy [aid=" + aid + ", aname=" + aname + "]";
	}

}
