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
		// ��õ�ǰʱ��
		Date getDate = Calendar.getInstance().getTime();
		String assotime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(getDate);
		aea.setAssoTime(assotime);
		aea.setApplyState("�����...");
		if(checkFormat(aea)){//��ʽû��������뵽����
			aeassoService.addApplication(aea); 
			request.setAttribute("successMsg1", "��������ɹ�����Ⱥ���ˣ�");
		}
		else{
			request.setAttribute("errorMsg1", "����ʧ�ܣ��������ϸ�ʽ");
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
	    //��װ��ǰҳ��
        pageBean.setCurrPage(currentPage);
        
		//ÿҳ��ʾ������
		int pageSize=5;
		pageBean.setPageSize(pageSize);
		
		//��װ�ܼ�¼��
		int totalCount = aeassoService.selectCount(userid);
		pageBean.setTotalCount(totalCount);
		
		//��װ��ҳ��
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//����ȡ��
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		map.put("userid1", userid);
		//��װÿҳ��ʾ������
		List<AEAssociation> lists = aeassoService.findByPage(map);
		pageBean.setLists(lists);

		model.addAttribute("pagemsg", pageBean);//���Է�ҳ����
		System.out.println("��ҳ��ѯ");
		return "applyAssociation";
	}
	
	@RequestMapping("/listAllByPage")
	public String listAllByPage(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<AEAssociation> pageBean = new PageBean<AEAssociation>();
		
	    //��װ��ǰҳ��
        pageBean.setCurrPage(currentPage);
        
		//ÿҳ��ʾ������
		int pageSize=15;
		pageBean.setPageSize(pageSize);
		
		//��װ�ܼ�¼��
		int totalCount = aeassoService.selectAllCount();
		pageBean.setTotalCount(totalCount);
		
		//��װ��ҳ��
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//����ȡ��
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		//��װÿҳ��ʾ������
		List<AEAssociation> lists = aeassoService.findAllByPage(map);
		pageBean.setLists(lists);

		model.addAttribute("pageallmsg", pageBean);//���Է�ҳ����
		return "first";
	}
	
	@RequestMapping("/listJoinByPage")
	public String  listJoinByPage(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model,User user){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<AEAssociation> pageBean = new PageBean<AEAssociation>();
		
		int userid = Integer.parseInt(user.getUserId());
	    //��װ��ǰҳ��
        pageBean.setCurrPage(currentPage);
        
		//ÿҳ��ʾ������
		int pageSize=5;
		pageBean.setPageSize(pageSize);
		
		//��װ�ܼ�¼��
		int totalCount = aeassoService.selectJoinCount(userid);
		pageBean.setTotalCount(totalCount);
		
		//��װ��ҳ��
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//����ȡ��
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		map.put("userid2", userid);
		
		//��װÿҳ��ʾ������
		List<AEAssociation> lists = new ArrayList<AEAssociation>();
		List<StudentAndAsso> listAssoId = aeassoService.findJoinByPage(map);
		PageBean<StudentAndAsso> state = new PageBean<StudentAndAsso>();
		state.setLists(listAssoId);
		model.addAttribute("statemsg", state);//���Է�ҳ����
		for(int i=0;i<listAssoId.size();i++){
			lists.add(aeassoService.findJoinById(listAssoId.get(i).getAssoId()));
		}
		
		
		
		
		pageBean.setLists(lists);

		model.addAttribute("pageassomsg", pageBean);//���Է�ҳ����
		return "applyAssociation";
	}
	
	@RequestMapping("/listAcceptByPage")
	public String  listAcceptByPage(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model,User user){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<AEAssociation> pageAssoBean = new PageBean<AEAssociation>();//������Ե�������Ϣ
		
		int userid = Integer.parseInt(user.getUserId());
	    //��װ��ǰҳ��
		pageAssoBean.setCurrPage(currentPage);
        
		//ÿҳ��ʾ������
		int pageSize=5;
		pageAssoBean.setPageSize(pageSize);
		
		//��װ�ܼ�¼��
		int totalCount = aeassoService.selectAcceptCount(userid);//��ѯ��������
		pageAssoBean.setTotalCount(totalCount);
		
		//��װ��ҳ��
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//����ȡ��
        pageAssoBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageAssoBean.getPageSize());
		map.put("userid3", userid);
		
		//��װÿҳ��ʾ������
		List<AEAssociation> assoLists = new ArrayList<AEAssociation>();//��װ��������
		List<User> userLists = new ArrayList<User>();//��װ�û�����
		User us = new User();
		
		List<StudentAndAsso> listAssoId = aeassoService.findAcceptByPage(map);//��ѯ������������
		PageBean<StudentAndAsso> state = new PageBean<StudentAndAsso>();//��������
		PageBean<User> usermsg = new PageBean<User>();//�û�����
		
		state.setLists(listAssoId);
		model.addAttribute("astatemsg", state);//��������״̬����
		
		for(int i = 0;i<listAssoId.size();i++){//�����û���Ϣ
			us.setUserId(String.valueOf(listAssoId.get(i).getUserId()));
			userLists.add(userService.check(us));
		}
		usermsg.setLists(userLists);
		model.addAttribute("usermsg",usermsg);
		
		for(int i=0;i<listAssoId.size();i++){//����������Ϣ
			assoLists.add(aeassoService.findJoinById(listAssoId.get(i).getAssoId()));
		}
		pageAssoBean.setLists(assoLists);
		model.addAttribute("assomsg", pageAssoBean);//������������
		
		return "applyAssociation";
	}
	
	@RequestMapping("/listMyAssoByPage")
	public String  listMyAssoByPage(@RequestParam(value="currentPage",defaultValue="1",required=false) int currentPage,
			@RequestParam(value="memberPage",defaultValue="1",required=false) int memberPage,HttpServletRequest request,Model model,User user){
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<AEAssociation> pageAssoBean = new PageBean<AEAssociation>();//����������Ϣ
		PageBean<User> assoleadermsg = new PageBean<User>();//�����û���������	
		List<AEAssociation> assoLists = new ArrayList<AEAssociation>();//ÿһҳ��ʾ����������
		List<User> leaderLists = new ArrayList<User>();//ÿһҳ������糤��Ϣ
		
		int userid = Integer.parseInt(user.getUserId());//���ݵ�ǰ�û�Id��ѯ���������id
		pageAssoBean.setCurrPage(currentPage);	    //��װ��ǰҳ��
		pageAssoBean.setPageSize(1);				//ÿҳ��ʾ��������
		int totalCount = aeassoService.selectMyAssoCount(userid);//��ѯ�Ѽ������������
		pageAssoBean.setTotalCount(totalCount);		//�ܼ�¼��
        pageAssoBean.setTotalPage(totalCount);		//��װҳ��
        
		map.put("start",(currentPage-1));
		map.put("size", pageAssoBean.getPageSize());
		map.put("userid4", userid);
		StudentAndAsso saaId = aeassoService.findMyAssoByPage(map);//�����û�id�뵱ǰ��ҳ���ѯ����,��ȡ����id
		
		assoLists.add(aeassoService.findJoinById(saaId.getAssoId()));//��������id����������Ϣ
		pageAssoBean.setLists(assoLists);
		model.addAttribute("assomsg", pageAssoBean);//������������
		ImageBean ibean = aeassoService.listView(String.valueOf(saaId.getAssoId()));
		HttpSession session=request.getSession();
		session.setAttribute("images", ibean);
		
		User us = new User();
		us.setUserId(String.valueOf(saaId.getAssoLeader()));//�糤id
		leaderLists.add(userService.check(us));//�����糤id�����糤��Ϣ
		assoleadermsg.setLists(leaderLists);
		model.addAttribute("assoleadermsg",assoleadermsg);//�����糤��Ϣ
		
		//��ѯ����������Ա��Ϣ������
		HashMap<String,Object> userMap = new HashMap<String,Object>();
		PageBean<User> usermsg = new PageBean<User>();//������Ա��ҳ��Ϣ
		List<User> userLists = new ArrayList<User>();//������Ա��Ϣ
		PageBean<StudentAndAsso> stuPosition = new PageBean<StudentAndAsso>();//��������
		int memberPageSize = 8;//ÿһҳ��ʾ����Ա����
		usermsg.setPageSize(memberPageSize);
		usermsg.setCurrPage(memberPage);//��ǰҳ��
		int memberCount = aeassoService.selectMemberCount(saaId.getAssoId());//��������id��ѯ��Ա����
		usermsg.setTotalCount(memberCount);
		double mc = memberCount;
        Double num =Math.ceil(mc/memberPageSize);//����ȡ��
		usermsg.setTotalPage(num.intValue());//��ʾ��ҳ��
		userMap.put("start2", (memberPage-1)*memberPageSize);
		userMap.put("size2", usermsg.getPageSize());
		userMap.put("assoid", saaId.getAssoId());
		List<StudentAndAsso> alluserid = aeassoService.findAllUserByPage(userMap);
		stuPosition.setLists(alluserid);
		model.addAttribute("position", stuPosition);//��������״̬����
		for(int i=0;i<alluserid.size();i++){//����������Ϣ
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
		//����Ƿ�Ϊ��ͨ������ͨ������������
		if(aeaResult != null ){
			if(!aeaResult.getApplyState().equals("��ͨ��") && !aeaResult.getApplyState().equals("�Ѿܾ�") && !aeaResult.getApplyState().equals("�ѳ���")){
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
		//����Ƿ�Ϊ��ͨ������ͨ������������
		if(saaResult != null ){
			if(!saaResult.getApplyJoinState().equals("��ͨ��") && !saaResult.getApplyJoinState().equals("�Ѿܾ�") && !saaResult.getApplyJoinState().equals("�ѳ���")){
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
		//����Ƿ�Ϊ��ͨ������ͨ������������
		if(op.equals("ͨ��")){
			if(saaResult != null ){
				int applyid = saaResult.getApplyId();
				System.out.println(applyid);
				if(!saaResult.getApplyJoinState().equals("��ͨ��") && !saaResult.getApplyJoinState().equals("�Ѿܾ�") && !saaResult.getApplyJoinState().equals("�ѳ���")){
					op = "��" + op;
					
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
				if(!saaResult.getApplyJoinState().equals("��ͨ��") && !saaResult.getApplyJoinState().equals("�Ѿܾ�") && !saaResult.getApplyJoinState().equals("�ѳ���")){
					op = "��" + op;
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
