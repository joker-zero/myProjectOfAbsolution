package com.java.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.entity.AEAssociation;
import com.java.entity.ImageBean;
import com.java.entity.StudentAndAsso;
import com.java.service.AEAssoService;

@Controller
public class CheckAssoController {

	@Resource
	private AEAssoService aeassoService;
	
	@RequestMapping("/listDetailsById")
	public String listAllByPage(HttpServletRequest request,AEAssociation aeas){
		int assoid = aeas.getAssoId();
		AEAssociation resultBean = aeassoService.listDetailsById(assoid);
		HttpSession session=request.getSession();
		session.setAttribute("assoDetails", resultBean);
		listView(String.valueOf(assoid),request);
		return "assoDetails";
	}
	@RequestMapping("/listViewById")
	public void listView(String id,HttpServletRequest request){
		String assoid = id;
		ImageBean ibean = aeassoService.listView(assoid);
		HttpSession session=request.getSession();
		session.setAttribute("images", ibean);
		
	}
	@RequestMapping("/applyJoinAsso")
	@ResponseBody
	public String applyJoinAssociation(StudentAndAsso saa){
		int assoid=saa.getAssoId();
		int assoleader=saa.getAssoLeader();
		int userid=saa.getUserId();
		Date getDate = Calendar.getInstance().getTime();
		String assotime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(getDate);
		saa.setApplyTime(assotime);
		StudentAndAsso stuaa = aeassoService.checkIsApply(userid,assoid);
		if(assoid!=0 && assoleader!=0 &&userid!=0&&(stuaa==null||stuaa.equals(null)) && userid != assoleader){
			aeassoService.applyJoinAsso(saa);
			return "success";
		}
		else{
			return "fail";
		}
	}
	
	@RequestMapping("/modifyNotice")
	@ResponseBody
	public String modifyNotice(@RequestParam(value="userId",required=false)int userId,@RequestParam(value="assoId",required=false)int assoId,AEAssociation aeas){
		int userid = userId;
		int assoid = assoId;
		String notice = aeas.getAssoNotice();
		System.out.println("userid:"+userid+",assoId:"+assoId);
		int leaderresult = aeassoService.checkAssoLeaderById(userid,assoid);
		if(leaderresult != 0){//有权限修改
			aeassoService.updateNotice(assoid,notice);
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("/modifyViews")
	public String modifyImg(@RequestParam(value="userId",defaultValue="1",required=false)int userId,@RequestParam(value="assoId",defaultValue="1",required=false)int assoId,
			@RequestParam(value="selectImage",defaultValue="1",required=false)String selectImage,@RequestParam(value="file")MultipartFile pictureFile,
			@RequestParam(value="currentPage",defaultValue="1",required=false)String currentPage,
			HttpServletRequest request, AEAssociation aeas,Model model) throws Exception {
		HashMap<String,Object> map = new HashMap<String,Object>();
		int userid = userId;
		int assoid = assoId;
		String selectimage = selectImage;
		String name = assoId + selectimage + "flag";// 获取文件的扩展名		
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());// 设置图片上传路径		
		String url = request.getSession().getServletContext().getRealPath("/upload");
		String imagedate = "upload/" + name + "." + ext;
		
		map.put("assoId1", assoid);
		map.put("selectImage1", selectimage);
		map.put("imageDate", imagedate);
		
		System.out.println(url);
		System.out.println(imagedate);
		System.out.println(userid+","+assoid+","+selectimage);
		//判断文件夹是否存在，不存在则创建
		File file =new File(url);    
		//如果文件夹不存在则创建    
		if  (!file .exists()  && !file .isDirectory())      
		{       
		    file .mkdir();    
		} 
		int leaderresult  = aeassoService.checkAssoLeaderById(userid,assoid);
		if(leaderresult != 0){
			if(ext.equals("jpg") || ext.equals("png")){
				pictureFile.transferTo(new File(url + "/" + name + "."+ext));// 以绝对路径保存重名命后的图片
				aeassoService.modifyViewsById(map);//将路径保存进数据库
			}
		}
		String retu = "aeas/listMyAssoByPage?currentPage="+currentPage+"&memberPage="+1+"&userId="+userid;
		return "redirect:"+retu;
	}
	
	@RequestMapping("/deletemember")
	@ResponseBody
	public String deleteMember(@RequestParam(value="applyId",defaultValue="0",required=false)int applyId,@RequestParam(value="userId",defaultValue="1",required=false)int userId,
			@RequestParam(value="assoId",defaultValue="1",required=false)int assoId	){
		int userid = userId;
		int assoid = assoId;
		int applyid = applyId;
		String returl = null;//返回标记
		int leaderresult = aeassoService.checkAssoLeaderById(userid, assoid);
		StudentAndAsso delresult = aeassoService.checkmemberById(applyid);
		if(leaderresult != 0){//是社长可进行操作
			if(delresult != null){//判断成员是否存在
				aeassoService.deletememberById(applyid);
				delresult = aeassoService.checkmemberById(applyid);
				if(delresult == null){
					returl = "success";
				}
			}
			else{
				returl = "notexit";
			}
		}
		else{
			returl = "notLeader";
		}
		return returl;
	}

	@RequestMapping("/modifyPosition")
	@ResponseBody
	public String modifyPosition(@RequestParam(value="applyId",defaultValue="0",required=false)int applyId,@RequestParam(value="userId",defaultValue="1",required=false)int userId,
			@RequestParam(value="assoId",defaultValue="1",required=false)int assoId,@RequestParam(value="assoPosition",defaultValue="null",required=false)String assoPosition		
			){
		int userid = userId;
		int assoid = assoId;
		int applyid = applyId;
		String assoposition = assoPosition;
		String returl = null;//返回标记
		int leaderresult = aeassoService.checkAssoLeaderById(userid, assoid);//检查是否为社长
		StudentAndAsso saaresult = aeassoService.checkmemberById(applyid);//检查被修改社员是否存在
		if(leaderresult != 0){//是社长可进行操作
			if(saaresult != null){//判断成员是否存在
				aeassoService.modifyPositionById(applyid,assoposition);
				returl = "success";
				if(assoposition.equals("社长")){//如果修改的是社长，则相应修改社团负责人id以及职位				
					int leaderid = saaresult.getUserId();
					aeassoService.modifySaaLeader(assoid,leaderid);//根据assoid更改两个studentandasso表格中LEADERID
					aeassoService.modifyAeaLeader(assoid,leaderid);//根据assoid更改两个aeassociation表格中LEADERID
					aeassoService.modifyLeaderPosition(userid,assoid);
				}
			}
			else{
				returl = "notexit";
			}
		}
		else{
			returl = "notLeader";
		}
		return returl;
	}
}