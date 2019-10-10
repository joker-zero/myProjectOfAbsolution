package com.java.controller;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.entity.MyEmail;
import com.java.entity.PageBean;
import com.java.entity.User;
import com.java.service.MyEmailService;
import com.java.service.UserService;

@Controller
public class EmailController {

	@Resource
	private MyEmailService myemailService;
	@Resource
	private UserService userService;
	
	@RequestMapping("/checkmyemail")
	public String checkacceptemail(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,
			@RequestParam(value="currentSendPage",defaultValue="1",required=false)int currentSendPage
			,Model model,@RequestParam(value="userId",required=false) String userId,User user){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<MyEmail> emailPageBean = new PageBean<MyEmail>();
		
		String userid=userId;//��ǰ�û�id
        emailPageBean.setCurrPage(currentPage);   //��װ��ǰҳ��
		int pageSize=5;
		emailPageBean.setPageSize(pageSize);  	//ÿҳ��ʾ������
			
		int totalCount = myemailService.selectEmailCount(userid);//��װ�ܼ�¼��
		emailPageBean.setTotalCount(totalCount);
		
		//��װ��ҳ��
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//����ȡ��
        emailPageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", emailPageBean.getPageSize());
		map.put("userid1", userid);
		//��װÿҳ��ʾ������
		List<MyEmail> lists = myemailService.findEmailByPage(map);
		emailPageBean.setLists(lists);
		model.addAttribute("emailmsg", emailPageBean);//���Է�ҳ����
		
		
		HashMap<String,Object> sendMap = new HashMap<String,Object>();
		PageBean<MyEmail> sendemailPageBean = new PageBean<MyEmail>();
		sendemailPageBean.setCurrPage(currentSendPage);
		int pageSendSize=5;
		sendemailPageBean.setPageSize(pageSendSize);  	//ÿҳ��ʾ������
		int totalSendCount = myemailService.selectSendEmailCount(userid);//��װ�ܼ�¼��
		sendemailPageBean.setTotalCount(totalSendCount);
		double sc = totalSendCount;
        Double sendnum =Math.ceil(sc/pageSendSize);//����ȡ��
        sendemailPageBean.setTotalPage(sendnum.intValue());
        sendMap.put("start2",(currentSendPage-1)*pageSize);
        sendMap.put("size2", sendemailPageBean.getPageSize());
        sendMap.put("userid2", userid);
        List<MyEmail> sendlists = myemailService.findSendEmailByPage(sendMap);
		sendemailPageBean.setLists(sendlists);
		model.addAttribute("sendmsg", sendemailPageBean);//���Է�ҳ����
		
		return "myEmail";
	}
	
	@RequestMapping("/sendemail")
	@ResponseBody
	public String sendemail(MyEmail myemail){
		User us = new User();
		us.setUserId(myemail.getAcceptUserId());
		User resultUser = userService.check(us);
		Date getDate = Calendar.getInstance().getTime();
		String accepttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(getDate);
		myemail.setAcceptTime(accepttime);
		myemail.setEmailState("δ��");
		if(resultUser != null){
			myemailService.sendEmail(myemail);
			return "success";
		}
		else{
			return "fail";
		}
	}
	
	@RequestMapping("/deleteemail")
	@ResponseBody
	public String deleteEmailById(HttpServletRequest request,MyEmail myemail){
		int emailid = myemail.getEmailId();
		System.out.println("emailid:"+emailid);
		MyEmail emailResult = myemailService.checkEmail(emailid);
		if(emailResult != null){
			myemailService.deleteEmail(emailid);
			return "success";
		}
		else{
			return "fail";
		}
	}
}
