package com.yc.zxd.entity;

public class Order {
	private Integer oid;
	private Integer uuid;
	private Integer zid;
	private String otime;
	private String orelname;
	private String ocode;
	private String osize;
	private String odesc;
	private String oaddr;
	private String oprice;
	private String otype;
	private String uremain1;//接单状态
	private String uremain2;//接单数据
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", uuid=" + uuid + ", zid=" + zid
				+ ", otime=" + otime + ", orelname=" + orelname + ", ocode="
				+ ocode + ", osize=" + osize + ", odesc=" + odesc + ", oaddr="
				+ oaddr + ", oprice=" + oprice + ", otype=" + otype
				+ ", uremain1=" + uremain1 + ", uremain2=" + uremain2 + "]";
	}
	public Order(Integer oid, Integer uuid, Integer zid, String otime,
			String orelname, String ocode, String osize, String odesc,
			String oaddr, String oprice, String otype, String uremain1,
			String uremain2) {
		super();
		this.oid = oid;
		this.uuid = uuid;
		this.zid = zid;
		this.otime = otime;
		this.orelname = orelname;
		this.ocode = ocode;
		this.osize = osize;
		this.odesc = odesc;
		this.oaddr = oaddr;
		this.oprice = oprice;
		this.otype = otype;
		this.uremain1 = uremain1;
		this.uremain2 = uremain2;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getUuid() {
		return uuid;
	}
	public void setUuid(Integer uuid) {
		this.uuid = uuid;
	}
	public Integer getZid() {
		return zid;
	}
	public void setZid(Integer zid) {
		this.zid = zid;
	}
	public String getOtime() {
		return otime;
	}
	public void setOtime(String otime) {
		this.otime = otime;
	}
	public String getOrelname() {
		return orelname;
	}
	public void setOrelname(String orelname) {
		this.orelname = orelname;
	}
	public String getOcode() {
		return ocode;
	}
	public void setOcode(String ocode) {
		this.ocode = ocode;
	}
	public String getOsize() {
		return osize;
	}
	public void setOsize(String osize) {
		this.osize = osize;
	}
	public String getOdesc() {
		return odesc;
	}
	public void setOdesc(String odesc) {
		this.odesc = odesc;
	}
	public String getOaddr() {
		return oaddr;
	}
	public void setOaddr(String oaddr) {
		this.oaddr = oaddr;
	}
	public String getOprice() {
		return oprice;
	}
	public void setOprice(String oprice) {
		this.oprice = oprice;
	}
	public String getOtype() {
		return otype;
	}
	public void setOtype(String otype) {
		this.otype = otype;
	}
	public String getUremain1() {
		return uremain1;
	}
	public void setUremain1(String uremain1) {
		this.uremain1 = uremain1;
	}
	public String getUremain2() {
		return uremain2;
	}
	public void setUremain2(String uremain2) {
		this.uremain2 = uremain2;
	}
	
	
	
	
	 
	 
	 
	
}
