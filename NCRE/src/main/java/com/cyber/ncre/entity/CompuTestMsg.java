package com.cyber.ncre.entity;

/**
 * 报考信息实体表
 * @author Think
 *
 */
public class CompuTestMsg {
	 /*报考id*/
	 private Integer cid;
	 /*报考人姓名*/
	 private String sname;
	 /*报考人头像*/
	 private String epicture;
	 /*报考人所在班级*/
	 private String sclass;
	 /*报考人民族*/
	 private String enation;
	 /*报考人性别*/
	 private String ssex;
	 /*报考人身份证号*/
	 private String eidentif;
	 /*报考人手机号*/
	 private String ephone;
	 /*报考类别*/
	 private String tename;
	 
	/* 报考未通过原因*/
	 
	 private String nocontent;
 	 
	 /*报考审核状态*/
	 private String cstatus;

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getEpicture() {
		return epicture;
	}

	public void setEpicture(String epicture) {
		this.epicture = epicture;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	public String getEnation() {
		return enation;
	}

	public void setEnation(String enation) {
		this.enation = enation;
	}

	public String getSsex() {
		return ssex;
	}

	public void setSsex(String ssex) {
		this.ssex = ssex;
	}

	public String getEidentif() {
		return eidentif;
	}

	public void setEidentif(String eidentif) {
		this.eidentif = eidentif;
	}

	public String getEphone() {
		return ephone;
	}

	public void setEphone(String ephone) {
		this.ephone = ephone;
	}

	public String getTename() {
		return tename;
	}

	public void setTename(String tename) {
		this.tename = tename;
	}

	public String getNocontent() {
		return nocontent;
	}

	public void setNocontent(String nocontent) {
		this.nocontent = nocontent;
	}

	public String getCstatus() {
		return cstatus;
	}

	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}

	@Override
	public String toString() {
		return "CompuTestMsg [cid=" + cid + ", sname=" + sname + ", epicture=" + epicture + ", sclass=" + sclass
				+ ", enation=" + enation + ", ssex=" + ssex + ", eidentif=" + eidentif + ", ephone=" + ephone
				+ ", tename=" + tename + ", nocontent=" + nocontent + ", cstatus=" + cstatus + "]";
	}

	public CompuTestMsg(Integer cid, String sname, String epicture, String sclass, String enation, String ssex,
			String eidentif, String ephone, String tename, String nocontent, String cstatus) {
		super();
		this.cid = cid;
		this.sname = sname;
		this.epicture = epicture;
		this.sclass = sclass;
		this.enation = enation;
		this.ssex = ssex;
		this.eidentif = eidentif;
		this.ephone = ephone;
		this.tename = tename;
		this.nocontent = nocontent;
		this.cstatus = cstatus;
	}

	public CompuTestMsg() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	 
	
	 
	 
	 
}
