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

	public String getAdpasswoed() {
		return adpasswoed;
	}

	public void setAdpasswoed(String adpasswoed) {
		this.adpasswoed = adpasswoed;
	}

	@Override
	public String toString() {
		return "\nB_admin [adid=" + adid + ", adname=" + adname + ", adpasswoed=" + adpasswoed + "]";
	}

	private Integer adid;
	private String adname;
	private String adpasswoed;

	public B_admin() {
		// TODO Auto-generated constructor stub
	}

}
