package com.sap.parkme.model;

import java.util.Date;

public class Parkme {

	private int parkId;

	private int parkingNumber;

	private int carNumber;

	private int typeId;

	private String inTime;

	private String outTime;
	
	private String price;

	private String errorMsg;
	
	public int getParkId() {
		return parkId;
	}

	public void setParkId(int parkId) {
		this.parkId = parkId;
	}

	public int getParkingNumber() {
		return parkingNumber;
	}

	public void setParkingNumber(int parkingNumber) {
		this.parkingNumber = parkingNumber;
	}

	public int getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(int carNumber) {
		this.carNumber = carNumber;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getInTime() {
		return inTime;
	}

	public void setInTime(String string) {
		this.inTime = string;
	}

	public String getOutTime() {
		return outTime;
	}

	public void setOutTime(String outTime) {
		this.outTime = outTime;
	}

	@Override
	public String toString() {

		return "User [parkId=" + parkId + ", parkingNumber=" + parkingNumber

		+ ", carNumber=" + carNumber + ", typeID=" + typeId + ", inTime="

		+ inTime + ", outTime="+ outTime + "]";

	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
}
