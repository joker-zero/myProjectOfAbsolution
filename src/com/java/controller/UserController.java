package com.java.controller;

import java.io.File;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.entity.User;
import com.java.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request,HttpServletResponse response){
		User resultUser=userService.check(user);
		response.setContentType("text/html;charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    String userid = request.getParameter("userId");
	    String password = request.getParameter("passWord");
	    
	    if(userid == null||"".equals(userid)){//�û���Ϊ��
	    	request.setAttribute("errorMsg1","������ѧ��");
	    	return "index";
	    }
	    else if(userid != null && (resultUser == null || resultUser.equals(null))){//�û�����Ϊ�յ�����Ϊ�գ����û�������
	    	request.setAttribute("errorMsg1", "�˺Ų�����,����ע��");
	    	return "index";
	    }
	    else if(resultUser != null && (password==null||"".equals(password))) {//������ȷ����û����������
			request.setAttribute("errorMsg2", "����������");
			return "index";
		}
	    else if(resultUser != null && !(resultUser.getPassWord().equals(password))){
	    	request.setAttribute("errorMsg2", "���������������������");
	    	return "index";
	    }
	    else {
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", resultUser);
			String loginurl = "aeas/listAllByPage?currentPage=1";
			return "redirect:/"+loginurl;
		}
	}
	
	@RequestMapping("/registe")//ע��
	public String add(User user,HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		//��֤
		if(RegisteCheckId(user,request,response).equals("true") && checkFormat(user)){
			user.setBelongAsso("��");;
			userService.add(user);
			return "reback";
		}
		else{
			request.setAttribute("registeErrorMsg", "ע��ʧ�ܣ������ʽ");
			return "registe";
		}
		
	}
	
	@RequestMapping("/first")//�˳���¼
	public void doLogout(HttpSession sess,User user,HttpServletRequest request,HttpServletResponse response){
		System.out.println("exit!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        try {
        	request.getSession().invalidate();
        }catch (Exception e){
        }
        try {
            sess.removeAttribute("warn");

        }catch (Exception e){
        }
    }
	
	@RequestMapping("/modify")//�޸�����
	public String ModifyMassage(User user,HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
	    //��֤
		if(RegisteCheckId(user,request,response).equals("false") && checkFormat(user)){//���ǿյļ��˺Ŵ��ڣ����Ҹ�ʽ��ȷ�������޸�
			userService.update(user);
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", user);
			request.setAttribute("errModifyMsg2", "�޸ĳɹ���");
		}
		else{
			request.setAttribute("errModifyMsg2", "�޸���Ϣʧ�ܣ�������Ϣ��ʽ�Ƿ���ȷ");
		}
		return "personalMass";
		
	}
	
	@RequestMapping("/modifyPortrait")
	public String modifyImg(Model model,HttpServletRequest request, User user,
		@RequestParam(value="file")MultipartFile pictureFile) throws Exception {
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		// ��ȡ�ļ�����չ��
		String ext = FilenameUtils.getExtension(pictureFile
				.getOriginalFilename());
		// ����ͼƬ�ϴ�·��
		String url = request.getSession().getServletContext()
				.getRealPath("/upload");
		System.out.println(url);

		//�ж��ļ����Ƿ���ڣ��������򴴽�
		File file =new File(url);    
		//����ļ��в������򴴽�    
		if  (!file .exists()  && !file .isDirectory())      
		{       
		    file .mkdir();    
		} 
		// ��ͼƬ�洢·�����浽ʵ����
		user.setLoginImage("upload/" + name + "."+ext);
		if(ext.equals("jpg") || ext.equals("png")){
			// �Ծ���·���������������ͼƬ
			pictureFile.transferTo(new File(url + "/" + name + "."+ext));
			// �ض��򵽲�ѯ�����û���Controller�����̲�ѯ����ͼƬ
			userService.modifyPortrait(user);
			User resultUser = userService.check(user);//���·�����ǰ̨
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", resultUser);
			request.setAttribute("sussModifyMsg1", "�޸�ͷ��ɹ�!");
		}
		else{
			request.setAttribute("errModifyMsg1", "�޸�ͷ��ʧ�ܣ�������Ƭ��ʽ�Ƿ�Ϊjpg/png");
		}
		return "personalMass";
		
		/*���̻���
		HttpSession session=request.getSession();
		session.setAttribute("lists", user);*/
	//	return "redirect:/imgList.jsp";
	}
	
	
	
	@RequestMapping("/checkId")//
	@ResponseBody
	public String RegisteCheckId(User user,HttpServletRequest request,HttpServletResponse response){
		User checkId = userService.check(user);
		if(checkId == null){//�޴��˺Ų�����ע�ᡣ
			return "true";
		}
		return "false";
	}
	
	public boolean checkFormat(User user){
		boolean flag = true;   
		String userid = user.getUserId();
		String username = user.getUserName();
		String password = user.getPassWord();
		String realname = user.getRealName();
		String phone = user.getUserIphone();

		Pattern p = null;
	    Matcher m = null;
	    boolean b = false;
	    String s2="^[1](([3|5|8][\\d])|([4][4,5,6,7,8,9])|([6][2,5,6,7])|([7][^9])|([9][1,8,9]))[\\d]{8}$";
	    p = Pattern.compile(s2);
        m = p.matcher(phone);
        b = m.matches();
        
		if(userid.length() < 9 || userid.length() > 12){
			flag = false;
		}
		else if(username.length() < 1 || username.length() > 15){
			flag = false;
		}
		else if(password.length() < 6 || password.length() > 18){
			flag = false;
		}
		else if(realname.length() < 1 || realname.length() > 5){
			flag = false;
		}
		else if(!b){
			flag = false;
		}
		return flag;
	}
}
