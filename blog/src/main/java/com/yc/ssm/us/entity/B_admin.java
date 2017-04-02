package com.yc.ssm.us.entity;

public class B_admin {
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

	public String getAdpassword() {
		return adpassword;
	}

	public void setAdpassword(String adpassword) {
		this.adpassword = adpassword;
	}

	@Override
	public String toString() {
		return "\nB_admin [adid=" + adid + ", adname=" + adname + ", adpassword=" + adpassword + "]";
	}

	private Integer adid;
	private String adname;
	private String adpassword;

	public B_admin() {
	}

}
