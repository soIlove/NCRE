package com.cyber.ncre.entity;

import java.io.Serializable;

public class kaoroom implements Serializable {

	private static final long serialVersionUID = 1045457981417992391L;
	//考场编号
	private Integer krid;
	//考场名称
	private String krclass;
	//考场设置最大容量
	private String krtotal;
	//考场所属楼层
	private String krlou;
	//考场坐标
	private String kraddr;

	public kaoroom() {
		// TODO Auto-generated constructor stub
	}

	public kaoroom(Integer krid, String krclass, String krtotal, String krlou, String kraddr) {
		super();
		this.krid = krid;
		this.krclass = krclass;
		this.krtotal = krtotal;
		this.krlou = krlou;
		this.kraddr = kraddr;
	}

	public Integer getKrid() {
		return krid;
	}

	public void setKrid(Integer krid) {
		this.krid = krid;
	}

	public String getKrclass() {
		return krclass;
	}

	public void setKrclass(String krclass) {
		this.krclass = krclass;
	}

	public String getKrtotal() {
		return krtotal;
	}

	public void setKrtotal(String krtotal) {
		this.krtotal = krtotal;
	}

	public String getKrlou() {
		return krlou;
	}

	public void setKrlou(String krlou) {
		this.krlou = krlou;
	}

	public String getKraddr() {
		return kraddr;
	}

	public void setKraddr(String kraddr) {
		this.kraddr = kraddr;
	}

	@Override
	public String toString() {
		return "kaoroom [krid=" + krid + ", krclass=" + krclass + ", krtotal=" + krtotal + ", krlou=" + krlou
				+ ", kraddr=" + kraddr + "]";
	}

}
