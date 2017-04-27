package com.cyber.ncre.entity;

import java.io.Serializable;

public class academy implements Serializable {

	private static final long serialVersionUID = 3894967780471666731L;
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
