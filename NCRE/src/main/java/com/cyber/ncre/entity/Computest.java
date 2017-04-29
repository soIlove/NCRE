package com.cyber.ncre.entity;

public class Computest {
	private int cid;
	private int eid;
	private int teid;
	private String cstatus;
	private String cotid;
	private String cotclass;
	private String cottask;
	
	
	public Computest(int eid, int teid) {
		super();
		this.eid = eid;
		this.teid = teid;
	}
	public Computest() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getTeid() {
		return teid;
	}
	public void setTeid(int teid) {
		this.teid = teid;
	}
	public String getCstatus() {
		return cstatus;
	}
	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}
	public String getCotid() {
		return cotid;
	}
	public void setCotid(String cotid) {
		this.cotid = cotid;
	}
	public String getCotclass() {
		return cotclass;
	}
	public void setCotclass(String cotclass) {
		this.cotclass = cotclass;
	}
	public String getCottask() {
		return cottask;
	}
	public void setCottask(String cottask) {
		this.cottask = cottask;
	}
	@Override
	public String toString() {
		return "Computest [cid=" + cid + ", eid=" + eid + ", teid=" + teid
				+ ", cstatus=" + cstatus + ", cotid=" + cotid + ", cotclass="
				+ cotclass + ", cottask=" + cottask + "]";
	}
	
}
