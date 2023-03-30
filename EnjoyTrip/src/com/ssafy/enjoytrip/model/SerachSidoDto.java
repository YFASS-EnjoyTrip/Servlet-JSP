package com.ssafy.enjoytrip.model;

import java.io.Serializable;

public class SerachSidoDto implements Serializable{
	private int sidoCode;
	private String sidoName;
	
	
	public int getSidoCode() {
		return sidoCode;
	}
	public void setSidoCode(int sidoCode) {
		this.sidoCode = sidoCode;
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	@Override
	public String toString() {
		return "[sidoCode=" + sidoCode + ", sidoName=" + sidoName + "]";
	}
}
