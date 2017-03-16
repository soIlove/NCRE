package com.yc.zxd.entity;

public class User {
	private Integer uuid;
	private String upwd;
	private String uname;
	private String uphone;
	private String uemail;
	private String usex;
	private String upicture;
	private String uaddr;
	private Integer utype;
	
	public User() {
	}
	
	public User(String upwd, String uphone) {
		super();
		this.upwd = upwd;
		this.uphone = uphone;
	}
	


	public User(String upwd, String uname, String uphone, String uemail,
			String usex,  String uaddr) {
		super();
		this.upwd = upwd;
		this.uname = uname;
		this.uphone = uphone;
		this.uemail = uemail;
		this.usex = usex;
		this.uaddr = uaddr;
	}

	
	
	public Integer getUuid() {
		return uuid;
	}

	public void setUuid(Integer uuid) {
		this.uuid = uuid;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
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

	public String getUsex() {
		return usex;
	}

	public void setUsex(String usex) {
		this.usex = usex;
	}

	public String getUpicture() {
		return upicture;
	}

	public void setUpicture(String upicture) {
		this.upicture = upicture;
	}

	public String getUaddr() {
		return uaddr;
	}

	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}

	public Integer getUtype() {
		return utype;
	}

	public void setUtype(Integer utype) {
		this.utype = utype;
	}

	@Override
	public String toString() {
		return "User [uuid=" + uuid + ", upwd=" + upwd + ", uname=" + uname + ", uphone=" + uphone + ", uemail="
				+ uemail + ", usex=" + usex + ", upicture=" + upicture + ", uaddr=" + uaddr + ", utype=" + utype + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((uaddr == null) ? 0 : uaddr.hashCode());
		result = prime * result + ((uemail == null) ? 0 : uemail.hashCode());
		result = prime * result + ((uname == null) ? 0 : uname.hashCode());
		result = prime * result + ((uphone == null) ? 0 : uphone.hashCode());
		result = prime * result + ((upicture == null) ? 0 : upicture.hashCode());
		result = prime * result + ((upwd == null) ? 0 : upwd.hashCode());
		result = prime * result + ((usex == null) ? 0 : usex.hashCode());
		result = prime * result + ((utype == null) ? 0 : utype.hashCode());
		result = prime * result + ((uuid == null) ? 0 : uuid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (uaddr == null) {
			if (other.uaddr != null)
				return false;
		} else if (!uaddr.equals(other.uaddr))
			return false;
		if (uemail == null) {
			if (other.uemail != null)
				return false;
		} else if (!uemail.equals(other.uemail))
			return false;
		if (uname == null) {
			if (other.uname != null)
				return false;
		} else if (!uname.equals(other.uname))
			return false;
		if (uphone == null) {
			if (other.uphone != null)
				return false;
		} else if (!uphone.equals(other.uphone))
			return false;
		if (upicture == null) {
			if (other.upicture != null)
				return false;
		} else if (!upicture.equals(other.upicture))
			return false;
		if (upwd == null) {
			if (other.upwd != null)
				return false;
		} else if (!upwd.equals(other.upwd))
			return false;
		if (usex == null) {
			if (other.usex != null)
				return false;
		} else if (!usex.equals(other.usex))
			return false;
		if (utype == null) {
			if (other.utype != null)
				return false;
		} else if (!utype.equals(other.utype))
			return false;
		if (uuid == null) {
			if (other.uuid != null)
				return false;
		} else if (!uuid.equals(other.uuid))
			return false;
		return true;
	}
	
	
	
}
