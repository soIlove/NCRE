package com.cyber.ncre.entity;

import java.io.Serializable;

public class clazz implements Serializable {

	private static final long serialVersionUID = 3894967780471666731L;
	private Integer cid;
	private String cname;
	private Integer acacademyid;
	private academy academy;

	public clazz() {
		// TODO Auto-generated constructor stub
	}

	public clazz(Integer cid, String cname, Integer acacademyid, com.cyber.ncre.entity.academy academy) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.acacademyid = acacademyid;
		this.academy = academy;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Integer getAcacademyid() {
		return acacademyid;
	}

	public void setAcacademyid(Integer acacademyid) {
		this.acacademyid = acacademyid;
	}

	public academy getAcademy() {
		return academy;
	}

	public void setAcademy(academy academy) {
		this.academy = academy;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "clazz [cid=" + cid + ", cname=" + cname + ", acacademyid=" + acacademyid + ", academy=" + academy + "]";
	}

}
