package com.yc.ssm.us.entity;

public class B_tag {
	
	private Integer tagid;
	private String tagname;
	
	private Integer articlenum;
	
	

	public Integer getarticlenum() {
		return articlenum;
	}

	public void setarticlenum(Integer articlenum) {
		this.articlenum = articlenum;
	}

	public Integer getTagid() {
		return tagid;
	}

	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	public B_tag() {
	}
	
	public B_tag(Integer tagid, String tagname) {
		this.tagid = tagid;
		this.tagname = tagname;
	}
	
	

	public B_tag(Integer tagid, String tagname, Integer articlenum) {
		super();
		this.tagid = tagid;
		this.tagname = tagname;
		this.articlenum = articlenum;
	}

	@Override
	public String toString() {
		return "\nB_tag [tagid=" + tagid + ", tagname=" + tagname + ", articlenum=" + articlenum + "]";
	}

	
}
