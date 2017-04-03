package com.yc.ssm.us.entity;

public class B_tag {
	

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

	private Integer tagid;
	private String tagname;

	public B_tag() {
	}
	
	public B_tag(Integer tagid, String tagname) {
		this.tagid = tagid;
		this.tagname = tagname;
	}

	@Override
	public String toString() {
		return "\nb_tag [tagid=" + tagid + ", tagname=" + tagname + "]";
	}
}
