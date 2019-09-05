package skt1.dtos;

import java.io.Serializable;

public class LoginDto implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String id;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String email;
	private String role;
	
	
	
	public LoginDto() {
		super();
	}



	public LoginDto(String id, String password, String name, String address, String phone, String email, String role) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.role = role;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}



	@Override
	public String toString() {
		return "LoginDto [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address + ", phone="
				+ phone + ", email=" + email + ", role=" + role + "]";
	}



	
	
}
