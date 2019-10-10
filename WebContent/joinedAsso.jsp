<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>已加入的社团</title>
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/demo.css">
	<link rel="stylesheet" href="<%=path%>/css/joinedAsso.css" type="text/css">
	<!--必要样式-->
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/component.css">
	<!--[if IE]>
	<script src="js/html5.js"></script>
	<![endif]-->

</head>
<body>
	<div class="loginName">
		<input id="check_login" value="${currentUser.userId}">
	</div>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header" style="height: 975px;">
				<canvas id="demo-canvas" style="width:100% ;height:100%"></canvas>
				
				<div class="context_top">
					<div class="context_top_return">
						<a href="javascript:history.go(-1);">向上一页</a>
					</div>
				
					<div class="context_top_link">
						<div class="context_top_link_login" id="link_login">
							<a  href="${pageContext.request.contextPath}/index.jsp">[登录]</a>
						</div>
						<div class="context_top_link_logout" id="link_logout">
							<a  onclick="logout()">[退出]</a>
						</div>
						<div class="context_top_link_registe" id="link_registe">
							<a  href="${pageContext.request.contextPath}/registe.jsp" >注册</a>
						</div>
					</div>
				</div>
				
				<div class="context_mid">
					<div class="context_mid_top">
						<div class="context_mid_top_image">
							<c:forEach var="ima" items="${requestScope.assomsg.lists}">
								<img id="context_mid_top_image_portrait" alt="" src="<%=path%>/${ima.assoImage}">
							</c:forEach>
						</div>		   
						<div class="context_mid_top_msg">
							<c:forEach var="asso" items="${requestScope.assomsg.lists}">
								<div id="context_mid_modifyOutSide" class="context_mid_modifyOutSide" style="display:none;">
									<div id="context_mid_modifyOutSide_notice" class="context_mid_modifyOutSide_notice" style="display:none;">
										<div id="context_mid_modifyOutSide_notice_frame" class="context_mid_modifyOutSide_notice_frame">
											<textarea id="context_mid_modifyOutSide_notTextArer" rows="10" cols="50"></textarea>
											<input id="context_mid_modifyOutSide_notSaveBtn" class="context_mid_modifyOutSide_notSaveBtn" type="button" value="保存修改" onclick='modifyNotice(${currentUser.userId},${asso.assoId})'>
											<input id="context_mid_modifyOutSide_closeNoticeBtn" class="context_mid_modifyOutSide_closeNoticeBtn" type="button" value="关闭">
										</div>			
									</div>
									<div id="context_mid_modifyOutSide_view" class="context_mid_modifyOutSide_view" style="display:none;">
										<div id="context_mid_modifyOutSide_view_outside" class="context_mid_modifyOutSide_view_outside">
											<form id="context_mid_modifyOutSide_view_table" class="context_mid_modifyOutSide_view_table" action="${pageContext.request.contextPath}/modifyViews" method="post" enctype="multipart/form-data">
												<select id="projectPorperty" name="projectPorperty" onchange="saveModifyView()">
													<option value="0">请选择要修改的图片</option>
													<option value="image1">image1</option>
													<option value="image2">image2</option>
													<option value="image3">image3</option>
													<option value="image4">image4</option>
													<option value="image5">image5</option>
													<option value="image6">image6</option>
													<option value="image7">image7</option>
													<option value="image8">image8</option>
													<option value="image9">image9</option>
													<option value="image10">image10</option>
												</select>
													<input id="" class="" name="currentPage" type="text" value="${requestScope.assomsg.currPage}" style="display:none;">
												<input id="" class="" name="userId" type="text" value="${currentUser.userId}" style="display:none;">
												<input id="" class="" name="assoId" type="text" value="${asso.assoId}" style="display:none;">
												<input id="context_mid_modifyOutSide_view_select" class="" name="selectImage" type="text" value="" style="display:none;">
												<input id="portrait" class="act-but submit" style="background:none;color:white;border:#FFFFFF solid 1px;width:350px;height:67px;" type="file" name="file" ><!--这个name=“file”并不是数据库的字段名哦-->
												<input id="context_mid_modifyOutSide_saveViewBtn" class="context_mid_modifyOutSide_saveViewBtn" type="submit" value="保存">
												<input id="context_mid_modifyOutSide_closeViewBtn" class="context_mid_modifyOutSide_closeViewBtn" type="button" value="关闭">
											</form>
										</div>
									</div>
								</div>
																
								<div class="context_mid_top_msg_data">
									社团编号:${asso.assoId}<br/>
									社团名称:${asso.assoName}<br/>
									社团创建时间:${asso.assoTime}<br/>
								</div>
								<div class="context_mid_top_msg_notice">
									<table class="context_mid_top_msg_notice_table">
										<tr>
											<th style="font-size:30px;">公告</th>
										</tr>
										<tr>
											<td>
												<textarea rows="10" cols="50" class="context_mid_top_msg_notice_textarea">${asso.assoNotice}</textarea>
											</td>
										</tr>
									</table>
								</div>
							</c:forEach>
							<c:forEach var="leadermsg" items="${requestScope.assoleadermsg.lists}">
								<div class="context_mid_top_msg_data"	>
									社团负责人学号:${leadermsg.userId}<br/>
									社团负责人:${leadermsg.realName}<br/>
									社团负责人联系方式:${leadermsg.userIphone}<br/>
								</div>
							</c:forEach>
							<div class="context_mid_top_msg_data" style="height:25px;">
								社团人数:${requestScope.allusermsg.totalCount}<br/>
							</div>
						</div>
						<div class="context_mid_top_btn"  onmouseout="hiddenSubMenu()">
							<input id="context_mid_top_btn_modifyAssoMsg" class="act-but submit" type="button" value="修改社团信息" onmouseover="showSubMenu()">
							<input id="context_mid_top_btn_modifyView" class="act-but submit" type="button" value="修改风采栏" onmouseover="showSubMenu()">
							<input id="context_mid_top_btn_modifyNotice" class="act-but submit" type="button" value="修改公告栏" onmouseover="showSubMenu()">
						</div>
					</div>
					<div class="context_mid_left">
						<div class="context_mid_left_title">社团成员表</div>
						<div class="context_mid_left_member">
							<table  border="1" cellpadding="10" cellspacing="0" class="table1" style="position:absolute;left:80px;top:320px;background-color:white;">
								<tr>
									<th>学号</th>
									<th>姓名</th>
									<th>联系方式</th>
									<th>专业</th>
									<th>班级</th>
								</tr>
								<c:forEach var="aum" items="${requestScope.allusermsg.lists}">
								<tr>
									<td>${aum.userId}</td>
									<td>${aum.realName}</td>
									<td>${aum.userIphone}</td>
									<td>${aum.major}</td>
									<td>${aum.gradesAndClass}</td>
								</tr>
								</c:forEach>
									<tr>
										<td class="td2" colspan="7" style="text-align:center;">
											<span>第${requestScope.allusermsg.currPage }/ ${requestScope.allusermsg.totalPage}页</span>  
											<span>总记录数：${requestScope.allusermsg.totalCount }  每页显示:${requestScope.allusermsg.pageSize}</span>  
											<span>
												<c:if test="${requestScope.allusermsg.currPage != 1}">
												   <a href="${pageContext.request.contextPath }/aeas/listMyAssoByPage?currentPage=${requestScope.assomsg.currPage}&memberPage=1&userId=${currentUser.userId}" >[首页]</a>  
												    <a href="${pageContext.request.contextPath }/aeas/listMyAssoByPage?currentPage=${requestScope.assomsg.currPage}&memberPage=${requestScope.allusermsg.currPage-1}&userId=${currentUser.userId}" >[上一页]</a>  
										    	</c:if>
										       
											    <c:if test="${requestScope.allusermsg.currPage != requestScope.allusermsg.totalPage}">
											        <a href="${pageContext.request.contextPath }/aeas/listMyAssoByPage?currentPage=${requestScope.assomsg.currPage}&memberPage=${requestScope.allusermsg.currPage+1}&userId=${currentUser.userId}" >[下一页]</a>  
											        <a href="${pageContext.request.contextPath }/aeas/listMyAssoByPage?currentPage=${requestScope.assomsg.currPage}&memberPage=${requestScope.allusermsg.totalPage}&userId=${currentUser.userId}" >[尾页]</a>  
											    </c:if>
											</span>
										</td>
									</tr>			
							</table>
							<table border="1" cellpadding="10" cellspacing="0" class="table1" style="position:absolute;left:572px;top:320px;background-color:white;">
								<tr>									
									<th>职位</th>
									<th>操作</th>
								</tr>
								<c:forEach var="po" items="${requestScope.position.lists}">
									<tr>
										<td>${po.assoPosition}</td>
										<td>
											<input id="context_mid_membertable_delbtn" class="context_mid_membertable_delbtn" type="button" value="删除" onclick="deletemember(${po.applyId},${po.assoId})">
											<input id="context_mid_membertable_modifubtn" class="context_mid_membertable_modifubtn" type="button" value="修改职位" onmouseover="showPosiMenu(${po.applyId})">
										</td>
									</tr>
									<div class="context_mid_membertable_position"  onmouseout="hiddenPosiMenu(${po.applyId})" >
										<input id="context_mid_membertable_first${po.applyId}" class="context_mid_membertable_first" type="button" value="社长" style="display:none;" onmouseover="showPosiMenu(${po.applyId})"  onclick="modifyposition(${po.applyId},${po.assoId},1)">
										<input id="context_mid_membertable_second${po.applyId}" class="context_mid_membertable_second" type="button" value="副社长" style="display:none;" onmouseover="showPosiMenu(${po.applyId})" onclick="modifyposition(${po.applyId},${po.assoId},2)">
										<input id="context_mid_membertable_third${po.applyId}" class="context_mid_membertable_third" type="button" value="社员" style="display:none;" onmouseover="showPosiMenu(${po.applyId})" onclick="modifyposition(${po.applyId},${po.assoId},3)">
									</div>
								</c:forEach>
							</table>
							
						</div>
					</div>
					<div class="context_mid_rightbottom">
						<div class="context_mid_rightbottom_view">
							<img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image1}">
							<img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image2}">
							<img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image3}">
						</div>
						<div class="context_mid_rightbottom_view">
							<img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image4}">
							<img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image5}">
							<img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image6}">
						</div>
						<div class="context_mid_rightbottom_view">
							<img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image7}">
							<img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image8}">
							<img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image9}">
						</div>
					</div>
					<div class="context_mid_bottom">
						<span>第${requestScope.assomsg.currPage }/ ${requestScope.assomsg.totalPage}页</span>  
						<span>总记录数：${requestScope.assomsg.totalCount }  每页显示:${requestScope.assomsg.pageSize}</span>  
						<span>
							<c:if test="${requestScope.assomsg.currPage != 1}">
							   <a href="${pageContext.request.contextPath }/aeas/listMyAssoByPage?currentPage=1&memberPage=1&userId=${currentUser.userId}" style="color: #72a8ca;">[首页]</a>  
							    <a href="${pageContext.request.contextPath }/aeas/listMyAssoByPage?currentPage=${requestScope.assomsg.currPage-1}&memberPage=1&userId=${currentUser.userId}" style="color: #72a8ca;">[上一页]</a>  
					    	</c:if>
					       
						    <c:if test="${requestScope.assomsg.currPage != requestScope.assomsg.totalPage}">
						        <a href="${pageContext.request.contextPath }/aeas/listMyAssoByPage?currentPage=${requestScope.assomsg.currPage+1}&memberPage=1&userId=${currentUser.userId}" style="color: #72a8ca;">[下一页]</a>  
						        <a href="${pageContext.request.contextPath }/aeas/listMyAssoByPage?currentPage=${requestScope.assomsg.totalPage}&memberPage=1&userId=${currentUser.userId}" style="color: #72a8ca;">[尾页]</a>  
						    </c:if>
						</span>
					</div>
				</div>

				<div class="context_left">
					<div class="context_left_portrait">
						<img src="<%=path%>/image/timg.jpg" id="context_left_portrait_image" style="display:block;"></img>
						<img id="context_left_portrait_login" alt="" src="<%=path%>/${currentUser.loginImage}">
						<div class="context_left_userName">
							${currentUser.userName}
						</div>		
					</div>
					<div class="context_left_functionBtn">
						<input class="act-but submit" id="firstPage_btn" type="button" value="首页" style="color: #FFFFFF;width:50%;margin:20px 0px 0 20%">
						<input class="act-but submit" id="personalMass_btn" type="button" value="个人信息" style="color: #FFFFFF;width:50%;margin:20px 0px 0 20%">
						<input class="act-but submit" id="myAssociation_btn" type="button" value="我的社团" style="color: #FFFFFF;width:50%;margin:20px 0px 0 20%">
						<input class="act-but submit" id="applyAssociation_btn" type="button" value="社团申请" style="color: #FFFFFF;width:50%;margin:20px 0px 0 20%" >
						<input class="act-but submit" id="myEmail_btn" type="button" value="我的私信" style="color: #FFFFFF;width:50%;margin:20px 0px 0 20%">
					</div>
				</div>
				
				<div class="context_bottom">
				
				</div>
		</div>
	</div>	
</div>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/TweenLite.min.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/EasePack.min.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/rAF.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/demo-1.js"></script>
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
	<script src="<%=path%>/js/joinedAsso.js" type="text/javascript"></script>
</body>
<script>
function logout() {
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/user/first",
		dataType:"text",
			success:function(data){
				window.location.href = "${pageContext.request.contextPath}/first.jsp";
			}
		});
}
</script> 
</html>