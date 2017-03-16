package com.yc.zxd.entity;

import java.sql.Date;

public class Express {
	private Integer oid;
	private Integer ooid;
	private Integer did;
	private Integer uuid;
	private String uname;
	private String  usex;
	private String uphone;
	private String uemail;
	private String uaddr;
	private String upicture;
	private Date otime;
	private String orelname;
	private String ocode;
	private String osize;
	private String odesc;
	private String zaddr;
	private String oprice;
	private String otype;
	private String ostatus;
	
	public Express() {
	}
		
	

	public Express(Integer oid, Integer ooid, Integer did, Integer uuid, String uname, String usex, String uphone,
			String uemail, String uaddr, String upicture, Date otime, String orelname, String ocode, String osize,
			String odesc, String zaddr, String oprice, String otype, String ostatus) {
		super();
		this.oid = oid;
		this.ooid = ooid;
		this.did = did;
		this.uuid = uuid;
		this.uname = uname;
		this.usex = usex;
		this.uphone = uphone;
		this.uemail = uemail;
		this.uaddr = uaddr;
		this.upicture = upicture;
		this.otime = otime;
		this.orelname = orelname;
		this.ocode = ocode;
		this.osize = osize;
		this.odesc = odesc;
		this.zaddr = zaddr;
		this.oprice = oprice;
		this.otype = otype;
		this.ostatus = ostatus;
	}

	

	public String getUsex() {
		return usex;
	}



	public void setUsex(String usex) {
		this.usex = usex;
	}



	public String getUphone() {
		return uphone;
	}





	public void setUphone(String uphone) {
		this.uphone = uphone;
	}





	public String getUemail() {
		return uemail;
	}





	public void setUemail(String uemail) {
		this.uemail = uemail;
	}





	public String getUaddr() {
		return uaddr;
	}





	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}





	public Integer getUuid() {
		return uuid;
	}


	public void setUuid(Integer uuid) {
		this.uuid = uuid;
	}


	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}




	public Integer getOoid() {
		return ooid;
	}



	public void setOoid(Integer ooid) {
		this.ooid = ooid;
	}



	public String getOstatus() {
		return ostatus;
	}



	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}



	public String getUpicture() {
		return upicture;
	}



	public void setUpicture(String upicture) {
		this.upicture = upicture;
	}



	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Date getOtime() {
		return otime;
	}

	public void setOtime(Date otime) {
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

	public String getZaddr() {
		return zaddr;
	}

	public void setZaddr(String zaddr) {
		this.zaddr = zaddr;
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



	@Override
	public String toString() {
		return "Express [oid=" + oid + ", ooid=" + ooid + ", did=" + did + ", uuid=" + uuid + ", uname=" + uname
				+ ", usex=" + usex + ", uphone=" + uphone + ", uemail=" + uemail + ", uaddr=" + uaddr + ", upicture="
				+ upicture + ", otime=" + otime + ", orelname=" + orelname + ", ocode=" + ocode + ", osize=" + osize
				+ ", odesc=" + odesc + ", zaddr=" + zaddr + ", oprice=" + oprice + ", otype=" + otype + ", ostatus="
				+ ostatus + "]";
	}
	
}
