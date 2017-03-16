package com.yc.zxd.entity;

public class ProOrder {
	private int oid;
	private int aid;
	private int did;
	private int uuid;
	private String uname;
	private String dscore;
	private String upicture;
	private String adesc;
	private String ztime;
	public ProOrder(int oid, int aid, int did, int uuid, String uname,
			String dscore, String upicture, String adesc, String ztime) {
		super();
		this.oid = oid;
		this.aid = aid;
		this.did = did;
		this.uuid = uuid;
		this.uname = uname;
		this.dscore = dscore;
		this.upicture = upicture;
		this.adesc = adesc;
		this.ztime = ztime;
	}
	public ProOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ProOrder [oid=" + oid + ", aid=" + aid + ", did=" + did
				+ ", uuid=" + uuid + ", uname=" + uname + ", dscore=" + dscore
				+ ", upicture=" + upicture + ", adesc=" + adesc + ", ztime="
				+ ztime + "]";
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getUuid() {
		return uuid;
	}
	public void setUuid(int uuid) {
		this.uuid = uuid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getDscore() {
		return dscore;
	}
	public void setDscore(String dscore) {
		this.dscore = dscore;
	}
	public String getUpicture() {
		return upicture;
	}
	public void setUpicture(String upicture) {
		this.upicture = upicture;
	}
	public String getAdesc() {
		return adesc;
	}
	public void setAdesc(String adesc) {
		this.adesc = adesc;
	}
	public String getZtime() {
		return ztime;
	}
	public void setZtime(String ztime) {
		this.ztime = ztime;
	}
		
	
	
	
}
