package com.java.serviceimpl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.java.dao.UserDao;
import com.java.entity.User;
import com.java.service.UserService;

@Service("userService")
public class ServiceImpl implements UserService{

	@Resource
	private UserDao userDao;
	
	public User check(User user) {
		// TODO Auto-generated method stub
		return userDao.check(user);
	}

	public User add(User user) {
		// TODO Auto-generated method stub
		return userDao.add(user);
	}
	public User update(User user) {
		// TODO Auto-generated method stub
		return userDao.update(user);
	}

	@Override
	public User modifyPortrait(User user) {
		// TODO 自动生成的方法存根
		return userDao.modifyPor(user);
	}

}
