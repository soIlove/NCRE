package com.yc.zxd.entity;

public class Applyorder {
	private int aid;
	private int oid;
	private String adesc;
	private int did;

	public Applyorder(int aid, int oid, String adesc, int did) {
		super();
		this.aid = aid;
		this.oid = oid;
		this.adesc = adesc;
		this.did = did;
	}

	public Applyorder() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getAdesc() {
		return adesc;
	}

	public void setAdesc(String adesc) {
		this.adesc = adesc;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	@Override
	public String toString() {
		return "Applyorder [aid=" + aid + ", oid=" + oid + ", adesc=" + adesc
				+ ", did=" + did + "]";
	}

}
