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

<<<<<<< HEAD
	public String getAdpasswoed() {
=======
	public String getAdpassword() {
>>>>>>> branch 'master' of ssh://git@github.com/jm2576096522/blog
		return adpassword;
	}

<<<<<<< HEAD
	public void setAdpasswoed(String adpassword) {
=======
	public void setAdpassword(String adpassword) {
>>>>>>> branch 'master' of ssh://git@github.com/jm2576096522/blog
		this.adpassword = adpassword;
	}

	@Override
	public String toString() {
<<<<<<< HEAD
		return "\nB_admin [adid=" + adid + ", adname=" + adname + ", adpasswoed=" + adpassword + "]";
=======
		return "\nB_admin [adid=" + adid + ", adname=" + adname + ", adpassword=" + adpassword + "]";
>>>>>>> branch 'master' of ssh://git@github.com/jm2576096522/blog
	}

<<<<<<< HEAD
=======
	private Integer adid;
	private String adname;
	private String adpassword;

	public B_admin() {

	}
>>>>>>> branch 'master' of ssh://git@github.com/jm2576096522/blog

}
