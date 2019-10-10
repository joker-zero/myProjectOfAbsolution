package com.java.dao;

import java.util.HashMap;
import java.util.List;

import com.java.entity.MyEmail;

public interface MyEmailDao {

	int selectEmailCount(String userid);

	List<MyEmail> findEmailByPage(HashMap<String, Object> map);

	void sendEmail(MyEmail myemail);

	int selectSendEmailCount(String userid);

	List<MyEmail> findSendEmailByPage(HashMap<String, Object> map);

	MyEmail checkEmail(int emailid);

	void deleteEmail(int emailid);

}
