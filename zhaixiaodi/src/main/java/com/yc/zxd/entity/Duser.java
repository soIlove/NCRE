package com.yc.zxd.entity;

public class Duser {
	private Integer did;
	private Integer uuid;
	private String dsid;
	private String dspic;
	private String dscore;
	private String dnum;
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public Integer getUuid() {
		return uuid;
	}
	public void setUuid(Integer uuid) {
		this.uuid = uuid;
	}
	public String getDsid() {
		return dsid;
	}
	public void setDsid(String dsid) {
		this.dsid = dsid;
	}
	public String getDspic() {
		return dspic;
	}
	public void setDspic(String dspic) {
		this.dspic = dspic;
	}
	public String getDscore() {
		return dscore;
	}
	public void setDscore(String dscore) {
		this.dscore = dscore;
	}
	public String getDnum() {
		return dnum;
	}
	public void setDnum(String dnum) {
		this.dnum = dnum;
	}
	public Duser(Integer did, Integer uuid, String dsid, String dspic, String dscore, String dnum) {
		super();
		this.did = did;
		this.uuid = uuid;
		this.dsid = dsid;
		this.dspic = dspic;
		this.dscore = dscore;
		this.dnum = dnum;
	}
	public Duser() {
	}
	@Override
	public String toString() {
		return "Duser [did=" + did + ", uuid=" + uuid + ", dsid=" + dsid + ", dspic=" + dspic + ", dscore=" + dscore
				+ ", dnum=" + dnum + "]";
	}
	
	
	
}
