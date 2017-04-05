package com.cyber.ncre.entity;

public class academyAdmin {

	/* 用户编号 */
	private Integer acid;
	/* 用户名称 */
	private String acloginname;
	/* 注册邮箱 */
	private String acemail;
	/* 密码 */
	private String acloginpwd;
	/* 性别 */
	private String acsex;
	/* 证件照地址 */
	private String acpicture;
	/* 职位 */
	private String acwork;
	/* 所属学院编号 */
	private Integer acacademyid;
	/* 联系电话 */
	private String acphone;
	/* 注册时间 */
	private String actime;
	/* 审核状况 */
	private String acstatus;
	/* 学院情况 */
	private academy academy;

	public academyAdmin() {
		// TODO Auto-generated constructor stub
	}

	public academyAdmin(Integer acid, String acloginname, String acemail, String acloginpwd, String acsex,
			String acpicture, String acwork, Integer acacademyid, String acphone, String actime, String acstatus,
			com.cyber.ncre.entity.academy academy) {
		super();
		this.acid = acid;
		this.acloginname = acloginname;
		this.acemail = acemail;
		this.acloginpwd = acloginpwd;
		this.acsex = acsex;
		this.acpicture = acpicture;
		this.acwork = acwork;
		this.acacademyid = acacademyid;
		this.acphone = acphone;
		this.actime = actime;
		this.acstatus = acstatus;
		this.academy = academy;
	}

	public Integer getAcid() {
		return acid;
	}

	public void setAcid(Integer acid) {
		this.acid = acid;
	}

	public String getAcloginname() {
		return acloginname;
	}

	public void setAcloginname(String acloginname) {
		this.acloginname = acloginname;
	}

	public String getAcemail() {
		return acemail;
	}

	public void setAcemail(String acemail) {
		this.acemail = acemail;
	}

	public String getAcloginpwd() {
		return acloginpwd;
	}

	public void setAcloginpwd(String acloginpwd) {
		this.acloginpwd = acloginpwd;
	}

	public String getAcsex() {
		return acsex;
	}

	public void setAcsex(String acsex) {
		this.acsex = acsex;
	}

	public String getAcpicture() {
		return acpicture;
	}

	public void setAcpicture(String acpicture) {
		this.acpicture = acpicture;
	}

	public String getAcwork() {
		return acwork;
	}

	public void setAcwork(String acwork) {
		this.acwork = acwork;
	}

	public Integer getAcacademyid() {
		return acacademyid;
	}

	public void setAcacademyid(Integer acacademyid) {
		this.acacademyid = acacademyid;
	}

	public String getAcphone() {
		return acphone;
	}

	public void setAcphone(String acphone) {
		this.acphone = acphone;
	}

	public String getActime() {
		return actime;
	}

	public void setActime(String actime) {
		this.actime = actime;
	}

	public String getAcstatus() {
		return acstatus;
	}

	public void setAcstatus(String acstatus) {
		this.acstatus = acstatus;
	}

	public academy getAcademy() {
		return academy;
	}

	public void setAcademy(academy academy) {
		this.academy = academy;
	}

	@Override
	public String toString() {
		return "academyAdmin [acid=" + acid + ", acloginname=" + acloginname + ", acemail=" + acemail + ", acloginpwd="
				+ acloginpwd + ", acsex=" + acsex + ", acpicture=" + acpicture + ", acwork=" + acwork + ", acacademyid="
				+ acacademyid + ", acphone=" + acphone + ", actime=" + actime + ", acstatus=" + acstatus + ", academy="
				+ academy + "]";
	}

}