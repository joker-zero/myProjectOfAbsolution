package com.java.serviceimpl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.java.dao.MyEmailDao;
import com.java.entity.MyEmail;
import com.java.service.MyEmailService;


@Service("myemailService")
public class MyEmailServiceImpl implements MyEmailService{

	@Resource
	private MyEmailDao myemailDao;

	@Override
	public int selectEmailCount(String userid) {
		// TODO �Զ����ɵķ������
		return myemailDao.selectEmailCount(userid);
	}

	@Override
	public List<MyEmail> findEmailByPage(HashMap<String, Object> map) {
		// TODO �Զ����ɵķ������
		return myemailDao.findEmailByPage(map);
	}

	@Override
	public void sendEmail(MyEmail myemail) {
		myemailDao.sendEmail(myemail);
	}

	@Override
	public int selectSendEmailCount(String userid) {
		// TODO �Զ����ɵķ������
		return myemailDao.selectSendEmailCount(userid);
	}

	@Override
	public List<MyEmail> findSendEmailByPage(HashMap<String, Object> map) {
		// TODO �Զ����ɵķ������
		return myemailDao.findSendEmailByPage(map);
	}

	@Override
	public MyEmail checkEmail(int emailid) {
		// TODO �Զ����ɵķ������
		return myemailDao.checkEmail(emailid);
	}

	@Override
	public void deleteEmail(int emailid) {
		// TODO �Զ����ɵķ������
		myemailDao.deleteEmail(emailid);
	}
	


}
