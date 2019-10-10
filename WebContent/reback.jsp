<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功</title>
<script>
	window.onload=function fun(){
		if(confirm("注册成功！是否返回登录页面?")==true){
			window.location.href ="${pageContext.request.contextPath}/index.jsp";
		}
		else{
			window.location.href ="${pageContext.request.contextPath}/first.jsp";
		}
		
	}
	
</script>
</head>
<body>
</body>
</html>