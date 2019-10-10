package com.java.service;

import com.java.entity.User;

public interface UserService {

	public User check(User user);
	public User add(User user);
	public User update(User user);
	public User modifyPortrait(User user);
}
