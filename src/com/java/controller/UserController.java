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
	    
	    if(userid == null||"".equals(userid)){//用户名为空
	    	request.setAttribute("errorMsg1","请输入学号");
	    	return "index";
	    }
	    else if(userid != null && (resultUser == null || resultUser.equals(null))){//用户名不为空但查找为空，即用户名错误
	    	request.setAttribute("errorMsg1", "账号不存在,请先注册");
	    	return "index";
	    }
	    else if(resultUser != null && (password==null||"".equals(password))) {//姓名正确，但没有输入密码
			request.setAttribute("errorMsg2", "请输入密码");
			return "index";
		}
	    else if(resultUser != null && !(resultUser.getPassWord().equals(password))){
	    	request.setAttribute("errorMsg2", "密码错误，请重新输入密码");
	    	return "index";
	    }
	    else {
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", resultUser);
			String loginurl = "aeas/listAllByPage?currentPage=1";
			return "redirect:/"+loginurl;
		}
	}
	
	@RequestMapping("/registe")//注册
	public String add(User user,HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		//验证
		if(RegisteCheckId(user,request,response).equals("true") && checkFormat(user)){
			user.setBelongAsso("无");;
			userService.add(user);
			return "reback";
		}
		else{
			request.setAttribute("registeErrorMsg", "注册失败，请检查格式");
			return "registe";
		}
		
	}
	
	@RequestMapping("/first")//退出登录
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
	
	@RequestMapping("/modify")//修改资料
	public String ModifyMassage(User user,HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
	    //验证
		if(RegisteCheckId(user,request,response).equals("false") && checkFormat(user)){//不是空的即账号存在，并且格式正确，允许修改
			userService.update(user);
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", user);
			request.setAttribute("errModifyMsg2", "修改成功！");
		}
		else{
			request.setAttribute("errModifyMsg2", "修改信息失败，请检查信息格式是否正确");
		}
		return "personalMass";
		
	}
	
	@RequestMapping("/modifyPortrait")
	public String modifyImg(Model model,HttpServletRequest request, User user,
		@RequestParam(value="file")MultipartFile pictureFile) throws Exception {
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		// 获取文件的扩展名
		String ext = FilenameUtils.getExtension(pictureFile
				.getOriginalFilename());
		// 设置图片上传路径
		String url = request.getSession().getServletContext()
				.getRealPath("/upload");
		System.out.println(url);

		//判断文件夹是否存在，不存在则创建
		File file =new File(url);    
		//如果文件夹不存在则创建    
		if  (!file .exists()  && !file .isDirectory())      
		{       
		    file .mkdir();    
		} 
		// 把图片存储路径保存到实体类
		user.setLoginImage("upload/" + name + "."+ext);
		if(ext.equals("jpg") || ext.equals("png")){
			// 以绝对路径保存重名命后的图片
			pictureFile.transferTo(new File(url + "/" + name + "."+ext));
			// 重定向到查询所有用户的Controller，立刻查询所有图片
			userService.modifyPortrait(user);
			User resultUser = userService.check(user);//更新反馈到前台
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", resultUser);
			request.setAttribute("sussModifyMsg1", "修改头像成功!");
		}
		else{
			request.setAttribute("errModifyMsg1", "修改头像失败，请检查照片格式是否为jpg/png");
		}
		return "personalMass";
		
		/*立刻回显
		HttpSession session=request.getSession();
		session.setAttribute("lists", user);*/
	//	return "redirect:/imgList.jsp";
	}
	
	
	
	@RequestMapping("/checkId")//
	@ResponseBody
	public String RegisteCheckId(User user,HttpServletRequest request,HttpServletResponse response){
		User checkId = userService.check(user);
		if(checkId == null){//无此账号才允许注册。
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
