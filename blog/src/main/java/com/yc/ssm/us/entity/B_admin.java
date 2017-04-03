package com.yc.ssm.us.entity;

public class B_admin {
	

	private Integer adid;
	private String adname;
	private String adpassword;

	public B_admin() {
	}
	public B_admin(Integer adid, String adname, String adpasswoed) {
		this.adid = adid;
		this.adname = adname;
		this.adpassword = adpassword;
	}
	public Integer getAdid() {
		return adid;
	}

	public void setAdid(Integer adid) {
		this.adid = adid;
	}

	public String getAdname() {
		return adname;
	}

	public void setAdname(String adname) {
		this.adname = adname;
	}

	public String getAdpasswoed() {
		return adpassword;
	}

	public void setAdpasswoed(String adpassword) {
		this.adpassword = adpassword;
	}

	@Override
	public String toString() {
		return "\nB_admin [adid=" + adid + ", adname=" + adname + ", adpasswoed=" + adpassword + "]";
	}


}
