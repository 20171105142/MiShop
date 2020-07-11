package cn.edu.imnu.mishop.bean;

public class Address {
	int addresses_userId;
	String addresses_receiverName;
	String addresses_receiverAddress;
	String addresses_receiverDetailAddress;
	String addresses_receiverPhone;
	int addresses_isDefaultAddress;
	public int getAddresses_userId() {
		return addresses_userId;
	}
	public void setAddresses_userId(int addresses_userId) {
		this.addresses_userId = addresses_userId;
	}
	public String getAddresses_receiverName() {
		return addresses_receiverName;
	}
	public void setAddresses_receiverName(String addresses_receiverName) {
		this.addresses_receiverName = addresses_receiverName;
	}
	public String getAddresses_receiverAddress() {
		return addresses_receiverAddress;
	}
	public void setAddresses_receiverAddress(String addresses_receiverAddress) {
		this.addresses_receiverAddress = addresses_receiverAddress;
	}
	public String getAddresses_receiverDetailAddress() {
		return addresses_receiverDetailAddress;		
	}
	public void setAddresses_receiverDetailAddress(String addresses_receiverDetailAddress) {
		this.addresses_receiverDetailAddress = addresses_receiverDetailAddress;
	}
	public String getAddresses_receiverPhone() {
		return addresses_receiverPhone;
	}
	public void setAddresses_receiverPhone(String addresses_receiverPhone) {
		this.addresses_receiverPhone = addresses_receiverPhone.replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2");
	}
	public int getAddresses_isDefaultAddress() {
		return addresses_isDefaultAddress;
	}
	public void setAddresses_isDefaultAddress(int addresses_isDefaultAddress) {
		this.addresses_isDefaultAddress = addresses_isDefaultAddress;
	}
	
}