package com.yc.zxd.entity;

public class Admin {

	private Integer adid;
	private String adpwd;
	private String adname;
	private String adsex;
	private String adphone;
	private String adrank;
	public Integer getAdid() {
		return adid;
	}
	public void setAdid(Integer adid) {
		this.adid = adid;
	}
	public String getAdpwd() {
		return adpwd;
	}
	public void setAdpwd(String adpwd) {
		this.adpwd = adpwd;
	}
	public String getAdname() {
		return adname;
	}
	public void setAdname(String adname) {
		this.adname = adname;
	}
	public String getAdsex() {
		return adsex;
	}
	public void setAdsex(String adsex) {
		this.adsex = adsex;
	}
	public String getAdphone() {
		return adphone;
	}
	public void setAdphone(String adphone) {
		this.adphone = adphone;
	}
	public String getAdrank() {
		return adrank;
	}
	public void setAdrank(String adrank) {
		this.adrank = adrank;
	}
	@Override
	public String toString() {
		return "Admin [adid=" + adid + ", adpwd=" + adpwd + ", adname=" + adname + ", adsex=" + adsex + ", adphone="
				+ adphone + ", adrank=" + adrank + "]";
	}
	public Admin() {
	}
	public Admin(Integer adid, String adpwd, String adname, String adsex, String adphone, String adrank) {
		super();
		this.adid = adid;
		this.adpwd = adpwd;
		this.adname = adname;
		this.adsex = adsex;
		this.adphone = adphone;
		this.adrank = adrank;
	}
	
	
	

}
