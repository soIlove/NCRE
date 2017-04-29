package com.cyber.ncre.entity;

public class Testclas {
	private int teid;
	private String tename;
	private int televel;
	
	public Testclas() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getTeid() {
		return teid;
	}
	public void setTeid(int teid) {
		this.teid = teid;
	}
	public String getTename() {
		return tename;
	}
	public void setTename(String tename) {
		this.tename = tename;
	}
	public int getTelevel() {
		return televel;
	}
	public void setTelevel(int televel) {
		this.televel = televel;
	}
	@Override
	public String toString() {
		return "Testclas [teid=" + teid + ", tename=" + tename + ", televel="
				+ televel + "]";
	}
}
