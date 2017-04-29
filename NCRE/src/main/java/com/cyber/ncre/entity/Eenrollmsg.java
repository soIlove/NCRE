package com.cyber.ncre.entity;

public class Eenrollmsg {
	private int eid;
	private int sid;
	private String epicture;
	private String enation;
	private String eidentif;
	private String ebirthday;
	private String ework;
	private String eaddr;
	private String ephone;
	public Eenrollmsg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getEpicture() {
		return epicture;
	}
	public void setEpicture(String epicture) {
		this.epicture = epicture;
	}
	public String getEnation() {
		return enation;
	}
	public void setEnation(String enation) {
		this.enation = enation;
	}
	public String getEidentif() {
		return eidentif;
	}
	public void setEidentif(String eidentif) {
		this.eidentif = eidentif;
	}
	public String getebirthday() {
		return ebirthday;
	}
	public void setebirthday(String ebirthday) {
		this.ebirthday = ebirthday;
	}
	public String getEwork() {
		return ework;
	}
	public void setEwork(String ework) {
		this.ework = ework;
	}
	public String getEaddr() {
		return eaddr;
	}
	public void setEaddr(String eaddr) {
		this.eaddr = eaddr;
	}
	public String getEphone() {
		return ephone;
	}
	public void setEphone(String ephone) {
		this.ephone = ephone;
	}
	@Override
	public String toString() {
		return "Eenrollmsg [eid=" + eid + ", sid=" + sid + ", epicture="
				+ epicture + ", enation=" + enation + ", eidentif=" + eidentif
				+ ", ebirthday=" + ebirthday + ", ework=" + ework + ", eaddr="
				+ eaddr + ", ephone=" + ephone + "]";
	}
}
