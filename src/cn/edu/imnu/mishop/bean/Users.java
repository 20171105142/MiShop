package cn.edu.imnu.mishop.bean;


public class Users {
	private int Users_id;
	private String Users_phone;
	private String Users_password;
	private String Users_sex;
	private String Users_birthday;
	private int cartAmout;
	public String getUsers_phone() {
		return Users_phone;
	}
	public void setUsers_phone(String Users_phone) {
		this.Users_phone = Users_phone;
	}
	public String getUsers_password() {
		return Users_password;
	}
	public void setUsers_password(String Users_password) {
		this.Users_password = Users_password;
	}
	public Users(int Users_id, String Users_phone, String Users_password, int cartAmout) {
		super();
		this.Users_id = Users_id;
		this.Users_phone = Users_phone;
		this.Users_password = Users_password;
		this.cartAmout = cartAmout;
	}
	public Users() {
		// TODO Auto-generated constructor stub
	}
	public int getUsers_id() {
		return Users_id;
	}
	public void setUsers_id(int users_id) {
		Users_id = users_id;
	}
	public int getCartAmout() {
		return cartAmout;
	}
	public void setCartAmout(int cartAmout) {
		this.cartAmout = cartAmout;
	}
	public String getUsers_sex() {
		return Users_sex;
	}
	public void setUsers_sex(String users_sex) {
		Users_sex = users_sex;
	}
	public String getUsers_birthday() {
		return Users_birthday;
	}
	public void setUsers_birthday(String users_birthday) {
		Users_birthday = users_birthday;
	}
}
