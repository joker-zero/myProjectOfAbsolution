	window.onload=function(){
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
	
	function deleteapplycreate(ob){
	var pathName=window.document.location.pathname;
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var assoid = ob;
	if(confirm("是否撤销？")==true){
		$.ajax({
			type:"POST",
			data:{assoId:assoid},
			url:projectName+"/aeas/revokeCreateAsso",
			dataTepe:"text",
				success:function(data){
					if(data=="success"){
						alert("撤销成功！")
					}
					else{
						alert("撤销失败，请刷新后重试！")
					}
				}
			
		});
	}
	else{}	
	}

	function deleteapplyjoin(ob){
	var pathName=window.document.location.pathname;
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var applyid = ob;
	if(confirm("是否撤销？")==true){
		$.ajax({
			type:"POST",
			data:{applyId:applyid},
			url:projectName+"/aeas/revokeJoinAsso",
			dataTepe:"text",
				success:function(data){
					if(data=="success"){
						alert("撤销成功！")
					}
					else{
						alert("撤销失败，请刷新后重试！")
					}
				}
			
		});
	}
	else{}	
	}
	
	function optionApplyjoin(ob1,ob2,ob3){
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		var userid = ob1;
		var assoid = ob2;
		var option;
		if(ob3==1){
			option = "通过";
		}
		else{
			option = "拒绝";
		}
		if(confirm("是否"+option+"?")==true){
			$.ajax({
				type:"POST",
				data:{userId:userid,assoId:assoid,"option":option},
				url:projectName+"/aeas/optionApplyJoin",
				dataTepe:"text",
					success:function(data){
						if(data=="success"){
							alert("操作成功！")
						}
						else{
							alert("操作失败，请刷新后重试！")
						}
					}
				
			});
		}
		else{}	
		}
	
	