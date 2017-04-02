package com.yc.ssm.us.entity;

public class B_drafets {
	private Integer drid;
	private Integer usid;
	private String drtitle;
	private String drtype;
	private String drtag;
	private String drtime;
	private String drcontent;
	private String drpic;
	public Integer getDrid() {
		return drid;
	}
	public void setDrid(Integer drid) {
		this.drid = drid;
	}
	public Integer getUsid() {
		return usid;
	}
	public void setUsid(Integer usid) {
		this.usid = usid;
	}
	public String getDrtitle() {
		return drtitle;
	}
	public void setDrtitle(String drtitle) {
		this.drtitle = drtitle;
	}
	public String getDrtype() {
		return drtype;
	}
	public void setDrtype(String drtype) {
		this.drtype = drtype;
	}
	public String getDrtag() {
		return drtag;
	}
	public void setDrtag(String drtag) {
		this.drtag = drtag;
	}
	public String getDrtime() {
		return drtime;
	}
	public void setDrtime(String drtime) {
		this.drtime = drtime;
	}
	public String getDrcontent() {
		return drcontent;
	}
	public void setDrcontent(String drcontent) {
		this.drcontent = drcontent;
	}
	public String getDrpic() {
		return drpic;
	}
	public void setDrpic(String drpic) {
		this.drpic = drpic;
	}
	public B_drafets(Integer drid, Integer usid, String drtitle, String drtype, String drtag, String drtime,
			String drcontent, String drpic) {
	
		this.drid = drid;
		this.usid = usid;
		this.drtitle = drtitle;
		this.drtype = drtype;
		this.drtag = drtag;
		this.drtime = drtime;
		this.drcontent = drcontent;
		this.drpic = drpic;
	}
	public B_drafets() {
	
	}
	@Override
	public String toString() {
		return "\ndrafets [drid=" + drid + ", usid=" + usid + ", drtitle=" + drtitle + ", drtype=" + drtype + ", drtag="
				+ drtag + ", drtime=" + drtime + ", drcontent=" + drcontent + ", drpic=" + drpic + "]";
	}
	
	
}
