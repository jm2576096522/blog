package com.yc.ssm.us.entity;

import java.io.Serializable;

public class B_article implements Serializable {

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Override
	public String toString() {
		return "\nB_article [aid=" + aid + ", atitle=" + atitle + ", tid=" + tid + ", tagname=" + tagname + ", uname="
				+ uname + ", atime=" + atime + ", acontent=" + acontent + ", apic=" + apic + ", aviewnum=" + aviewnum
				+ "]";
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getAtitle() {
		return atitle;
	}

	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getAtime() {
		return atime;
	}

	public void setAtime(String atime) {
		this.atime = atime;
	}

	public String getAcontent() {
		return acontent;
	}

	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}

	public String getApic() {
		return apic;
	}

	public void setApic(String apic) {
		this.apic = apic;
	}

	public String getAviewnum() {
		return aviewnum;
	}

	public void setAviewnum(String aviewnum) {
		this.aviewnum = aviewnum;
	}

	private static final long serialVersionUID = 1L;
	private Integer aid;
	private String atitle;
	private Integer tid;
	private String tagname;
	private String uname;
	private String atime;
	private String acontent;
	private String apic;
	private String aviewnum;

	public B_article() {
	}

}
