window.onload=function(){
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		var temp = document.getElementById('check_login');
		var temp_login = document.getElementById('link_login');
		var temp_logout = document.getElementById('link_logout');
		var temp_portraitImage = document.getElementById('context_left_portrait_image');
		if(temp.value == ""){
			temp_logout.style.top = '9999px';
			temp_login.style.top = 0;
			temp_portraitImage.style.display = 'block';
		}
		else{
			temp_logout.style.top = 0;
			temp_login.style.top = '9999px';
			temp_portraitImage.style.display = 'none';
		}
	}
$(document).on('click', '#firstPage_btn', function() {
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		window.location.href=projectName+"/aeas/listAllByPage?currentPage=1";

	}).on('click', '#personalMass_btn', function() {
		var temp = document.getElementById('check_login');
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		if(temp.value==""){
			alert("还未登陆，请先登录！")
			window.location.href=projectName+"/index.jsp";
		}
		else{
			window.location.href=projectName+"/personalMass.jsp";
		}
	}).on('click', '#myAssociation_btn', function() {
		var temp = document.getElementById('check_login');
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		if(temp.value==""){
			alert("还未登陆，请先登录！")
			window.location.href=projectName+"/index.jsp";
		}
		else{
			window.location.href=projectName+"/myAssociation.jsp";
		}
	}).on('click', '#applyAssociation_btn', function() {
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		var temp = document.getElementById('check_login');
		if(temp.value==""){
			alert("还未登陆，请先登录！")
			window.location.href=projectName+"/index.jsp";
		}
		else{
			var temp = document.getElementById('check_login').value;
			$.ajax({
				type:"POST",
				data:{assoLeader:temp},
				url:projectName+"/aeas/checkEstablishAndRevoke",
				dataType:"text",
					success:function(data){
						window.location.href=projectName+"/aeas/listByPage?currentPage=1&userId="+temp+"";
					}
				});	
		}
	}).on('click', '#myEmail_btn', function() {
		var temp = document.getElementById('check_login');
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		if(temp.value==""){
			alert("还未登陆，请先登录！")
			window.location.href=projectName+"/index.jsp";
		}
		else{
			var userid = document.getElementById('check_login').value;
			$.ajax({
				type:"POST",
				data:{"userId":userid},
				url:projectName+"/checkmyemail",
				dataType:"text",
					success:function(data){
						window.location.href=projectName+"/checkmyemail?currentPage=1&userId="+userid+"";
					}
				});	
		}
	}).on()
	
	function assodetails(ob){
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		var assoid = ob;
		$.ajax({
			type:"POST",
			data:{assoId:assoid},
			url:projectName+"/listDetailsById",
			dataType:"text",
				success:function(data){
					window.location.href=projectName+"/assoDetails.jsp";
				}
			});	
	}
	