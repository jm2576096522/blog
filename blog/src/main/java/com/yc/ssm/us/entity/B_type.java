package com.yc.ssm.us.entity;

public class B_type {

	private Integer tid;
	private String tname;
	
	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public B_type() {
	}
	

	public B_type(Integer tid, String tname) {
		this.tid = tid;
		this.tname = tname;
	}

	@Override
	public String toString() {
		return "b_type [tid=" + tid + ", tname=" + tname + "]";
	}


}
