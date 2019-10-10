package com.java.dao;


import com.java.entity.User;

public interface UserDao {

	public User check(User user);
	
	public User add(User user);
	
	public User update(User user);

	public User modifyPor(User user);
	
}
