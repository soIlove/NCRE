package com.cyber.ncre.entity;

public class Student {
	private int sid;
	private String sxid;
	private String spwd;
	private String sname;
	private String ssex;
	private String semail;
	private String sacademy;
	private String sclass;
	
	public Student(int sid,String sxid, String spwd, String sname, String ssex,
			String semail, String sacademy, String sclass) {
		this.sid = sid;
		this.sxid = sxid;
		this.spwd = spwd;
		this.sname = sname;
		this.ssex = ssex;
		this.semail = semail;
		this.sacademy = sacademy;
		this.sclass = sclass;
	}
	
	
	public Student() {
	}

	public Student(String sxid, String spwd) {
		this.spwd = spwd;
		this.sxid = sxid;
	}


	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public 	String getSxid() {
		return sxid;
	}
	public void setSxid(String sxid) {
		this.sxid = sxid;
	}
	public String getSpwd() {
		return spwd;
	}
	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSsex() {
		return ssex;
	}
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getSacademy() {
		return sacademy;
	}
	public void setSacademy(String sacademy) {
		this.sacademy = sacademy;
	}
	public String getSclass() {
		return sclass;
	}
	public void setSclass(String sclass) {
		this.sclass = sclass;
	}
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", sxid=" + sxid + ", spwd=" + spwd
				+ ", sname=" + sname + ", ssex=" + ssex + ", semail=" + semail
				+ ", sacademy=" + sacademy + ", sclass=" + sclass + "]";
	}
}
