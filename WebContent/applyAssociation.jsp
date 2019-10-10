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
	<title>社团申请</title>
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/demo.css">
	<link rel="stylesheet" href="<%=path%>/css/applyAssociation.css" type="text/css">
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
					<table  border="1" cellpadding="10" cellspacing="0" class="table1" style="position:absolute;left:600px;top:10px;background-color:white;">
						<tr>
							<th>申请人学号</th>
							<th>申请人用户名</th>
							<th>申请人姓名</th>
							<th>申请人联系方式</th>
							<th>申请人专业</th>
							<th>申请人班级</th>
						</tr>
						<c:forEach var="usermsg" items="${requestScope.usermsg.lists}">
						<tr>
							<td>${usermsg.userId}</td>
							<td>${usermsg.userName}</td>
							<td>${usermsg.realName}</td>
							<td>${usermsg.userIphone}</td>
							<td>${usermsg.major}</td>
							<td>${usermsg.gradesAndClass}</td>
						</tr>
						</c:forEach>
						<tr>
							<th>接受申请加入的社团编号</th>
							<th>接受申请加入的社团名称</th>
						</tr>
						<c:forEach var="assomsg" items="${requestScope.assomsg.lists}">
						<tr >
							<td>${assomsg.assoId}</td>
							<td>${assomsg.assoName}</td>
						</tr>
						</c:forEach>
						<tr>
							<th>接受申请时间</th>
							<th>审核状态</th>
							<th>操作</th>
						</tr>
						<c:forEach var="astate" items="${requestScope.astatemsg.lists}">
							<tr>
								<td>${astate.applyTime}</td>
								<td>${astate.applyJoinState}</td>
								<td>
									<input id="context_mid_table_agreejoinbtn" class="context_mid_table_agreejoinbtn" type="button" value="通过" onclick="optionApplyjoin(${astate.userId},${astate.assoId},1)">
									<input id="context_mid_table_refusejoinbtn" class="context_mid_table_refusejoinbtn" type="button" value="拒绝" onclick="optionApplyjoin(${astate.userId},${astate.assoId},2)">
								</td>
							<tr>
						</c:forEach>
						<tr>
							<td class="td2" colspan="7" style="text-align:center;">
							   <span>第${requestScope.assomsg.currPage }/ ${requestScope.assomsg.totalPage}页</span>  
							   <span>总记录数：${requestScope.assomsg.totalCount }  每页显示:${requestScope.assomsg.pageSize}</span>  
							   <span>
							       <c:if test="${requestScope.assomsg.currPage != 1}">
							           <a href="${pageContext.request.contextPath }/aeas/listAcceptByPage?currentPage=1&userId=${currentUser.userId}">[首页]</a>  
							           <a href="${pageContext.request.contextPath }/aeas/listAcceptByPage?currentPage=${requestScope.assomsg.currPage-1}&userId=${currentUser.userId}">[上一页]</a>  
							       </c:if>
							       
							       <c:if test="${requestScope.assomsg.currPage != requestScope.assomsg.totalPage}">
							           <a href="${pageContext.request.contextPath }/aeas/listAcceptByPage?currentPage=${requestScope.assomsg.currPage+1}&userId=${currentUser.userId}">[下一页]</a>  
							           <a href="${pageContext.request.contextPath }/aeas/listAcceptByPage?currentPage=${requestScope.assomsg.totalPage}&userId=${currentUser.userId}">[尾页]</a>  
							       </c:if>
							   </span>
							</td>	
						</tr>		
					</table>
			
				<table  border="1" cellpadding="10" cellspacing="0" class="table1" style="position:absolute;left:200px;top:200px;background-color:white;">
						<tr>
							<th>申请人学号</th>
							<th>申请人</th>
							<th>申请加入社团编号</th>
							<th>申请加入社团名称</th>
						</tr>
						<c:forEach var="applyasso" items="${requestScope.pageassomsg.lists}">
						<tr>
							<td>${applyasso.assoLeader}</td>
							<td>${applyasso.userName}</td>
							<td>${applyasso.assoId}</td>
							<td>${applyasso.assoName}</td>
							
						</tr>
						</c:forEach>
						<tr>
							<td class="td2" colspan="7" style="text-align:center;">
							   <span>第${requestScope.pageassomsg.currPage }/ ${requestScope.pageassomsg.totalPage}页</span>  
							   <span>总记录数：${requestScope.pageassomsg.totalCount }  每页显示:${requestScope.pageassomsg.pageSize}</span>  
							   <span>
							       <c:if test="${requestScope.pageassomsg.currPage != 1}">
							           <a href="${pageContext.request.contextPath }/aeas/listJoinByPage?currentPage=1&userId=${currentUser.userId}">[首页]</a>  
							           <a href="${pageContext.request.contextPath }/aeas/listJoinByPage?currentPage=${requestScope.pageassomsg.currPage-1}&userId=${currentUser.userId}">[上一页]</a>  
							       </c:if>
							       
							       <c:if test="${requestScope.pageassomsg.currPage != requestScope.pageassomsg.totalPage}">
							           <a href="${pageContext.request.contextPath }/aeas/listJoinByPage?currentPage=${requestScope.pageassomsg.currPage+1}&userId=${currentUser.userId}">[下一页]</a>  
							           <a href="${pageContext.request.contextPath }/aeas/listJoinByPage?currentPage=${requestScope.pageassomsg.totalPage}&userId=${currentUser.userId}">[尾页]</a>  
							       </c:if>
							   </span>
							</td>	
						</tr>		
					</table>
					<table border="1" cellpadding="10" cellspacing="0" class="table1" style="position:absolute;left:667px;top:200px;background-color:white;">
						<tr>
							<th>申请加入时间</th>
							<th>审核状态</th>
							<th>操作</th>
						</tr>
						<c:forEach var="applystate" items="${requestScope.statemsg.lists}">
							<tr>
								<td>${applystate.applyTime}</td>
								<td>${applystate.applyJoinState}</td>
								<td>
									<input id="context_mid_table_delapplyjoinbtn" class="context_mid_table_delapplyjoinbtn" type="button" value="撤销" onclick="deleteapplyjoin(${applystate.applyId})">
								</td>
							<tr>
						</c:forEach>
					</table>
					
					
					<table  border="1" cellpadding="10" cellspacing="0" class="table1" style="position:absolute;left:200px;top:500px;background-color:white;">
						<tr>
							<th>申请人学号</th>
							<th>申请人</th>
							<th>申请创建社团编号</th>
							<th>申请创建社团名称</th>
							<th>申请创建时间</th>
							<th>申请创建理由</th>
							<th>审核状态</th>
							<th>操作</th>
						</tr>
						<c:forEach var="asso" items="${requestScope.pagemsg.lists}">
						<tr>
							<td>${asso.assoLeader}</td>
							<td>${asso.userName}</td>
							<td>${asso.assoId}</td>
							<td>${asso.assoName}</td>
							<td>${asso.assoTime}</td>
							<td>${asso.assoReason}</td>
							<td>${asso.applyState}</td>
							<td>
								<input id="context_mid_table_delapplycreatebtn" class="context_mid_table_delapplycreatebtn" type="button" value="撤销" onclick="deleteapplycreate(${asso.assoId})">
							</td>
						</tr>
						</c:forEach>
	
							<td class="td2" colspan="7" style="text-align:center;">
							   <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>  
							   <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>  
							   <span>
							       <c:if test="${requestScope.pagemsg.currPage != 1}">
							           <a href="${pageContext.request.contextPath }/aeas/listByPage?currentPage=1&userId=${currentUser.userId}">[首页]</a>  
							           <a href="${pageContext.request.contextPath }/aeas/listByPage?currentPage=${requestScope.pagemsg.currPage-1}&userId=${currentUser.userId}">[上一页]</a>  
							       </c:if>
							       
							       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
							           <a href="${pageContext.request.contextPath }/aeas/listByPage?currentPage=${requestScope.pagemsg.currPage+1}&userId=${currentUser.userId}">[下一页]</a>  
							           <a href="${pageContext.request.contextPath }/aeas/listByPage?currentPage=${requestScope.pagemsg.totalPage}&userId=${currentUser.userId}">[尾页]</a>  
							       </c:if>
							   </span>
							</td>			
					</table>

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
	<script src="<%=path%>/js/applyAssociation.js" type="text/javascript"></script>
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