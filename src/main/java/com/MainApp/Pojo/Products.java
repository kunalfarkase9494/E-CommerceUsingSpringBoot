package com.MainApp.Pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class Products {
	
	@Id
	@Column(name = "product_name")
	String pname;
	
	@Column
	String pfile;
	
	@Column(length = 1000)
	String pdesc;
	
	@Column(name = "admins_name")
	String uname;
	
	@Column(name = "discount")
	String pdis;
	
	@Column(name = "Product_quantity")
	String pquant;
	
	@Column
	String price;
	
	@Column
	String category;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPfile() {
		return pfile;
	}
	public void setPfile(String pfile) {
		this.pfile = pfile;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public String getPdis() {
		return pdis;
	}
	public void setPdis(String pdis) {
		this.pdis = pdis;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPquant() {
		return pquant;
	}
	public void setPquant(String pquant) {
		this.pquant = pquant;
	}
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Products [pname=" + pname + ", pfile=" + pfile + ", pdesc=" + pdesc + ", uname=" + uname + ", pdis="
				+ pdis + ", pquant=" + pquant + ", price=" + price + "]";
	}
	
	
	
	
	
}
