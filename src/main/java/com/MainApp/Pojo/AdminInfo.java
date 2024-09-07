package com.MainApp.Pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class AdminInfo {
	@Id
	@Column(name="admin_username")
	String uname;
	@Column(name = "admin_pass")
	String upass;
	@Column(name= "admin_email")
	String uemail;
	@Column(name="security_code")
	String scode;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	
	@Override
	public String toString() {
		return "AdminInfo [uname=" + uname + ", upass=" + upass + ", uemail=" + uemail + ", scode=" + scode + "]";
	}
	
	
}
