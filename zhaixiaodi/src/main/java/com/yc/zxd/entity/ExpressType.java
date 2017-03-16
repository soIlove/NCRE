package com.yc.zxd.entity;

public class ExpressType {
	private String otype;
	private String num;
	private String sum;
	
	public ExpressType() {
	}

	public ExpressType(String otype, String num, String sum) {
		super();
		this.otype = otype;
		this.num = num;
		this.sum = sum;
	}

	public String getOtype() {
		return otype;
	}

	public void setOtype(String otype) {
		this.otype = otype;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	
	public String getSum() {
		return sum;
	}



	public void setSum(String sum) {
		this.sum = sum;
	}

	@Override
	public String toString() {
		return "ExpressType [otype=" + otype + ", num=" + num + ", sum=" + sum + "]";
	}

}
