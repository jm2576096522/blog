package com.yc.ssm.us.entity;

import java.io.Serializable;

public class B_user implements Serializable {

	@Override
	public String toString() {
		return "\nB_user [usid=" + usid + ", uemail=" + uemail + ", upassword=" + upassword + ", uname=" + uname
				+ ", usex=" + usex + ", ubirthday=" + ubirthday + ", uaddress=" + uaddress + ", upic=" + upic
				+ ", uphone=" + uphone + ", uprofession=" + uprofession + ", upersondesc=" + upersondesc + "]";
	}

	public Integer getUsid() {
		return usid;
	}

	public void setUsid(Integer usid) {
		this.usid = usid;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUpassword() {
		return upassword;
	}

	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUsex() {
		return usex;
	}

	public void setUsex(String usex) {
		this.usex = usex;
	}

	public String getUbirthday() {
		return ubirthday;
	}

	public void setUbirthday(String ubirthday) {
		this.ubirthday = ubirthday;
	}

	public String getUaddress() {
		return uaddress;
	}

	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}

	public String getUpic() {
		return upic;
	}

	public void setUpic(String upic) {
		this.upic = upic;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getUprofession() {
		return uprofession;
	}

	public void setUprofession(String uprofession) {
		this.uprofession = uprofession;
	}

	public String getUpersondesc() {
		return upersondesc;
	}

	public void setUpersondesc(String upersondesc) {
		this.upersondesc = upersondesc;
	}

	private static final long serialVersionUID = 1L;;
	private Integer usid;
	private String uemail;
	private String upassword;
	private String uname;
	private String usex;
	private String ubirthday;
	private String uaddress;
	private String upic;
	private String uphone;
	private String uprofession;
	private String upersondesc;

	public B_user() {
	}

}
