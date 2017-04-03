package com.yc.ssm.us.entity;

import java.io.Serializable;

public class B_article implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer aid;
	private String atitle;
	private Integer tid;
	private Integer tagid;
	private Integer usid;
	private String atime;
	private String acontent;
	private String apic;
	private String aviewnum;

	
	private String uname;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
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

	public Integer getTagid() {
		return tagid;
	}

	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}

	public Integer getUsid() {
		return usid;
	}

	public void setUsid(Integer usid) {
		this.usid = usid;
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

	public B_article() {
	}

	public B_article(Integer aid, String atitle, Integer tid, Integer tagid, Integer usid, String atime,
			String acontent, String apic, String aviewnum) {
		this.aid = aid;
		this.atitle = atitle;
		this.tid = tid;
		this.tagid = tagid;
		this.usid = usid;
		this.atime = atime;
		this.acontent = acontent;
		this.apic = apic;
		this.aviewnum = aviewnum;
	}

	@Override
	public String toString() {
		return "\nB_article [aid=" + aid + ", atitle=" + atitle + ", tid=" + tid + ", tagid=" + tagid + ", usid=" + usid
				+ ", atime=" + atime + ", acontent=" + acontent + ", apic=" + apic + ", aviewnum=" + aviewnum
				+ ", uname=" + uname + "]";
	}
	
}
