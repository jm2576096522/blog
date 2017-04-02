package com.yc.ssm.us.entity;

import java.util.Date;

public class B_comment {

	@Override
	public String toString() {
		return "\nB_comment [cid=" + cid + ", caid=" + caid + ", usid=" + usid + ", ccontent=" + ccontent + ", ctime="
				+ ctime + "]";
	}

	public Integer getCaid() {
		return caid;
	}

	public void setCaid(Integer caid) {
		this.caid = caid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getUsid() {
		return usid;
	}

	public void setUsid(Integer usid) {
		this.usid = usid;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	private Integer cid;
	private Integer caid;
	private Integer usid;
	private String ccontent;
	private Date ctime;

	public B_comment() {
	}

}
