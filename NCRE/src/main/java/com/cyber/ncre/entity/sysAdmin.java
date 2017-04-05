package com.cyber.ncre.entity;

public class sysAdmin {

				/*用户编号*/
	private Integer syid;
				/*用户名称*/
	private String syname;
				/*用户密码*/
	private String sypwd;
	
	public sysAdmin() {
		// TODO Auto-generated constructor stub
	}
	

	public sysAdmin(Integer syid, String syname, String sypwd) {
		super();
		this.syid = syid;
		this.syname = syname;
		this.sypwd = sypwd;
	}


	public Integer getSyid() {
		return syid;
	}

	public void setSyid(Integer syid) {
		this.syid = syid;
	}

	public String getSyname() {
		return syname;
	}

	public void setSyname(String syname) {
		this.syname = syname;
	}

	public String getSypwd() {
		return sypwd;
	}

	public void setSypwd(String sypwd) {
		this.sypwd = sypwd;
	}


	@Override
	public String toString() {
		return "sysAdmin [syid=" + syid + ", syname=" + syname + ", sypwd=" + sypwd + "]";
	}

	
}
