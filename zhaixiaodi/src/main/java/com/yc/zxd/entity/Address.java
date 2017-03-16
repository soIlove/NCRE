package com.yc.zxd.entity;

public class Address {
		private Integer zid;
		private Integer uuid;
		private String zaddr;
		@Override
		public String toString() {
			return "Address [zid=" + zid + ", uuid=" + uuid + ", zaddr="
					+ zaddr + "]";
		}
		public Address(Integer zid, Integer uuid, String zaddr) {
			super();
			this.zid = zid;
			this.uuid = uuid;
			this.zaddr = zaddr;
		}
		public Address() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Integer getZid() {
			return zid;
		}
		public void setZid(Integer zid) {
			this.zid = zid;
		}
		public Integer getUuid() {
			return uuid;
		}
		public void setUuid(Integer uuid) {
			this.uuid = uuid;
		}
		public String getZaddr() {
			return zaddr;
		}
		public void setZaddr(String zaddr) {
			this.zaddr = zaddr;
		}
		
		
}
