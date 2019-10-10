package com.java.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.entity.AEAssociation;
import com.java.entity.ImageBean;
import com.java.entity.MyEmail;
import com.java.entity.PageBean;
import com.java.entity.StudentAndAsso;
import com.java.entity.User;
import com.java.service.AEAssoService;
import com.java.service.UserService;

@Controller
@RequestMapping("/aeas")
public class AEAssoController {

	@Resource
	private AEAssoService aeassoService;
	@Resource
	private UserService userService;
	
	@RequestMapping("/apply")
	public String applyEstablish(HttpServletRequest request,AEAssociation aea){
		// 获得当前时间
		Date getDate = Calendar.getInstance().getTime();
		String assotime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(getDate);
		aea.setAssoTime(assotime);
		aea.setApplyState("审核中...");
		if(checkFormat(aea)){//格式没问题则插入到库中
			aeassoService.addApplication(aea); 
			request.setAttribute("successMsg1", "发送申请成功，请等候审核！");
		}
		else{
			request.setAttribute("errorMsg1", "申请失败，请检查资料格式");
		}
		return "creatAsso";
		
	}
	
	public boolean checkFormat(AEAssociation aea){
		boolean flag = true;
		String assoname = aea.getAssoName();
		String assonotice = aea.getAssoNotice();
		String assoreason = aea.getAssoReason();
		String assosynopsis = aea.getAssoSynopsis();
		if(assoname.length() < 1 || assoname.length() > 20){
			flag = false;
		}
		else if(assonotice.length() > 200){
			flag = false;
		}
		else if(assoreason.length() < 0 || assoreason.length() > 200){
			flag = false;
		}
		else if(assosynopsis.length() > 200){
			flag = false;
		}
		return flag;
	}
	
	@RequestMapping("/checkEstablishAndRevoke")
	public void checkEstablish(HttpServletRequest request,HttpServletResponse response,AEAssociation aea,Model model){
		List<AEAssociation> aealists = aeassoService.checkEstablish(aea);
		HttpSession session=request.getSession();
		session.setAttribute("establishApply", aealists);
		
	}

	@RequestMapping("/listByPage")
	public String  listByPage(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model,User user){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<AEAssociation> pageBean = new PageBean<AEAssociation>();
		
		int userid = Integer.parseInt(user.getUserId());
	    //封装当前页数
        pageBean.setCurrPage(currentPage);
        
		//每页显示的数据
		int pageSize=5;
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = aeassoService.selectCount(userid);
		pageBean.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		map.put("userid1", userid);
		//封装每页显示的数据
		List<AEAssociation> lists = aeassoService.findByPage(map);
		pageBean.setLists(lists);

		model.addAttribute("pagemsg", pageBean);//回显分页数据
		System.out.println("分页查询");
		return "applyAssociation";
	}
	
	@RequestMapping("/listAllByPage")
	public String listAllByPage(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<AEAssociation> pageBean = new PageBean<AEAssociation>();
		
	    //封装当前页数
        pageBean.setCurrPage(currentPage);
        
		//每页显示的数据
		int pageSize=15;
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = aeassoService.selectAllCount();
		pageBean.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		//封装每页显示的数据
		List<AEAssociation> lists = aeassoService.findAllByPage(map);
		pageBean.setLists(lists);

		model.addAttribute("pageallmsg", pageBean);//回显分页数据
		return "first";
	}
	
	@RequestMapping("/listJoinByPage")
	public String  listJoinByPage(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model,User user){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<AEAssociation> pageBean = new PageBean<AEAssociation>();
		
		int userid = Integer.parseInt(user.getUserId());
	    //封装当前页数
        pageBean.setCurrPage(currentPage);
        
		//每页显示的数据
		int pageSize=5;
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = aeassoService.selectJoinCount(userid);
		pageBean.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		map.put("userid2", userid);
		
		//封装每页显示的数据
		List<AEAssociation> lists = new ArrayList<AEAssociation>();
		List<StudentAndAsso> listAssoId = aeassoService.findJoinByPage(map);
		PageBean<StudentAndAsso> state = new PageBean<StudentAndAsso>();
		state.setLists(listAssoId);
		model.addAttribute("statemsg", state);//回显分页数据
		for(int i=0;i<listAssoId.size();i++){
			lists.add(aeassoService.findJoinById(listAssoId.get(i).getAssoId()));
		}
		
		
		
		
		pageBean.setLists(lists);

		model.addAttribute("pageassomsg", pageBean);//回显分页数据
		return "applyAssociation";
	}
	
	@RequestMapping("/listAcceptByPage")
	public String  listAcceptByPage(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model,User user){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<AEAssociation> pageAssoBean = new PageBean<AEAssociation>();//保存回显的社团信息
		
		int userid = Integer.parseInt(user.getUserId());
	    //封装当前页数
		pageAssoBean.setCurrPage(currentPage);
        
		//每页显示的数据
		int pageSize=5;
		pageAssoBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = aeassoService.selectAcceptCount(userid);//查询申请数量
		pageAssoBean.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageAssoBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageAssoBean.getPageSize());
		map.put("userid3", userid);
		
		//封装每页显示的数据
		List<AEAssociation> assoLists = new ArrayList<AEAssociation>();//封装社团数据
		List<User> userLists = new ArrayList<User>();//封装用户数据
		User us = new User();
		
		List<StudentAndAsso> listAssoId = aeassoService.findAcceptByPage(map);//查询保存申请数据
		PageBean<StudentAndAsso> state = new PageBean<StudentAndAsso>();//申请数据
		PageBean<User> usermsg = new PageBean<User>();//用户数据
		
		state.setLists(listAssoId);
		model.addAttribute("astatemsg", state);//回显申请状态数据
		
		for(int i = 0;i<listAssoId.size();i++){//回显用户信息
			us.setUserId(String.valueOf(listAssoId.get(i).getUserId()));
			userLists.add(userService.check(us));
		}
		usermsg.setLists(userLists);
		model.addAttribute("usermsg",usermsg);
		
		for(int i=0;i<listAssoId.size();i++){//回显社团信息
			assoLists.add(aeassoService.findJoinById(listAssoId.get(i).getAssoId()));
		}
		pageAssoBean.setLists(assoLists);
		model.addAttribute("assomsg", pageAssoBean);//回显社团数据
		
		return "applyAssociation";
	}
	
	@RequestMapping("/listMyAssoByPage")
	public String  listMyAssoByPage(@RequestParam(value="currentPage",defaultValue="1",required=false) int currentPage,
			@RequestParam(value="memberPage",defaultValue="1",required=false) int memberPage,HttpServletRequest request,Model model,User user){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<AEAssociation> pageAssoBean = new PageBean<AEAssociation>();//单个社团信息
		PageBean<User> assoleadermsg = new PageBean<User>();//单个用户具体数据	
		List<AEAssociation> assoLists = new ArrayList<AEAssociation>();//每一页显示的社团数据
		List<User> leaderLists = new ArrayList<User>();//每一页保存的社长信息
		
		int userid = Integer.parseInt(user.getUserId());//根据当前用户Id查询加入的社团id
		pageAssoBean.setCurrPage(currentPage);	    //封装当前页数
		pageAssoBean.setPageSize(1);				//每页显示的数据量
		int totalCount = aeassoService.selectMyAssoCount(userid);//查询已加入的社团数量
		pageAssoBean.setTotalCount(totalCount);		//总记录数
        pageAssoBean.setTotalPage(totalCount);		//封装页数
        
		map.put("start",(currentPage-1));
		map.put("size", pageAssoBean.getPageSize());
		map.put("userid4", userid);
		StudentAndAsso saaId = aeassoService.findMyAssoByPage(map);//根据用户id与当前的页码查询社团,获取社团id
		
		assoLists.add(aeassoService.findJoinById(saaId.getAssoId()));//根据社团id查找社团信息
		pageAssoBean.setLists(assoLists);
		model.addAttribute("assomsg", pageAssoBean);//回显社团数据
		ImageBean ibean = aeassoService.listView(String.valueOf(saaId.getAssoId()));
		HttpSession session=request.getSession();
		session.setAttribute("images", ibean);
		
		User us = new User();
		us.setUserId(String.valueOf(saaId.getAssoLeader()));//社长id
		leaderLists.add(userService.check(us));//根据社长id回显社长信息
		assoleadermsg.setLists(leaderLists);
		model.addAttribute("assoleadermsg",assoleadermsg);//回显社长信息
		
		//查询社团所有社员信息并回显
		HashMap<String,Object> userMap = new HashMap<String,Object>();
		PageBean<User> usermsg = new PageBean<User>();//所有社员分页信息
		List<User> userLists = new ArrayList<User>();//所有社员信息
		PageBean<StudentAndAsso> stuPosition = new PageBean<StudentAndAsso>();//申请数据
		int memberPageSize = 8;//每一页显示的社员数量
		usermsg.setPageSize(memberPageSize);
		usermsg.setCurrPage(memberPage);//当前页数
		int memberCount = aeassoService.selectMemberCount(saaId.getAssoId());//根据社团id查询社员数量
		usermsg.setTotalCount(memberCount);
		double mc = memberCount;
        Double num =Math.ceil(mc/memberPageSize);//向上取整
		usermsg.setTotalPage(num.intValue());//显示总页数
		userMap.put("start2", (memberPage-1)*memberPageSize);
		userMap.put("size2", usermsg.getPageSize());
		userMap.put("assoid", saaId.getAssoId());
		List<StudentAndAsso> alluserid = aeassoService.findAllUserByPage(userMap);
		stuPosition.setLists(alluserid);
		model.addAttribute("position", stuPosition);//回显申请状态数据
		for(int i=0;i<alluserid.size();i++){//回显社团信息
			us.setUserId(String.valueOf(alluserid.get(i).getUserId()));
			userLists.add(userService.check(us));
		}
		usermsg.setLists(userLists);
		model.addAttribute("allusermsg",usermsg);
		return "joinedAsso";
	}
	
	@RequestMapping("/revokeCreateAsso")
	@ResponseBody
	public String revokeCreateAssoById(HttpServletRequest request,AEAssociation aea){
		int assoid = aea.getAssoId();
		System.out.println("assoid:"+assoid);
		AEAssociation aeaResult = aeassoService.checkAsso(assoid);
		//检查是否为已通过，已通过则不允许撤销。
		if(aeaResult != null ){
			if(!aeaResult.getApplyState().equals("已通过") && !aeaResult.getApplyState().equals("已拒绝") && !aeaResult.getApplyState().equals("已撤销")){
				aeassoService.revokeCreateAsso(assoid);
				return "success";
			}
			return "fail";
		}
		else{
			return "fail";
		}
	}
	
	@RequestMapping("/revokeJoinAsso")
	@ResponseBody
	public String revokeJoinAssoById(HttpServletRequest request,StudentAndAsso saa){
		int applyid = saa.getApplyId();
		System.out.println("applyid:"+applyid);
		StudentAndAsso saaResult = aeassoService.checkJoinId(applyid);
		//检查是否为已通过，已通过则不允许撤销。
		if(saaResult != null ){
			if(!saaResult.getApplyJoinState().equals("已通过") && !saaResult.getApplyJoinState().equals("已拒绝") && !saaResult.getApplyJoinState().equals("已撤销")){
				aeassoService.revokeJoinAsso(applyid);
				return "success";
			}
			return "fail";
		}
		else{
			return "fail";
		}
	}
	 
	
	@RequestMapping("/optionApplyJoin")
	@ResponseBody
	public String agreeApplyJoinById(HttpServletRequest request,StudentAndAsso saa,@RequestParam(value="option",required=false)String option){
		int assoid = saa.getAssoId();
		int userid = saa.getUserId();
		String op = option;
		StudentAndAsso saaResult = aeassoService.checkJoinById(assoid,userid);
		//检查是否为已通过，已通过则不允许撤销。
		if(op.equals("通过")){
			if(saaResult != null ){
				int applyid = saaResult.getApplyId();
				System.out.println(applyid);
				if(!saaResult.getApplyJoinState().equals("已通过") && !saaResult.getApplyJoinState().equals("已拒绝") && !saaResult.getApplyJoinState().equals("已撤销")){
					op = "已" + op;
					
					aeassoService.optionApply(applyid,op);
					return "success";
				}
				return "fail";
			}
			else{
				System.out.println("test");
				return "fail";
			}
		}
		else{
			if(saaResult != null ){
				int applyid = saaResult.getApplyId();
				System.out.println(applyid);
				if(!saaResult.getApplyJoinState().equals("已通过") && !saaResult.getApplyJoinState().equals("已拒绝") && !saaResult.getApplyJoinState().equals("已撤销")){
					op = "已" + op;
					aeassoService.optionApply(applyid,op);
					return "success";
				}
				return "fail";
			}
			else{
				return "fail";
			}
		}
		
	}

	
}
