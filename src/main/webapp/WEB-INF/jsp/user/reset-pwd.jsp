<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="content">
    <div class="edit-bar container">
        <h2 style="text-align: center">找回密码</h2>
        <br>
        <form  action="" method="" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-4 control-label">用户名</label>
                        <div class="col-md-6">
                            <input id="username" type="text" class="form-control" disabled value="${user.username}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label">新密码</label>
                        <div class="col-md-6">
                            <input id="newpassword" type="password" class="form-control" value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label">确认密码</label>
                        <div class="col-md-6">
                            <input id="confirmpassword" type="password" class="form-control" value=""/>
                        </div>
                    </div>
                    <div id="formAlert" class="alert hidden" role="alert"></div>
                    <div class="col-md-12">
                        <span class="col-md-9"></span>
                        <input class="btn btn-default" type="button" id="resetPwd" value="重置密码"/>
                        <!-- <button class="btn btn-default" type="button" onclick="resetUserInfo()">更改密码</button> -->
                    </div>
                </form>
        
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>

	$("#resetPwd").click(function(){
		var username=$("#username").val();
		var newpassword=$("#newpassword").val();
		var confirmpassword=$("#confirmpassword").val();
		console.log(username);
		console.log(newpassword);
		console.log(confirmpassword);
		if(newpassword!=confirmpassword){
			alert("两次输入的密码不一致，请重新输入!");
		}else {
			//$(this).prop("type","submit");
			resetpwd(username,newpassword);
     	}
		
	});
	
	function resetpwd(username,newpassword){
		var obj = {};
	    obj['username'] = username;
	    obj['newpassword'] = newpassword ;
		//var jsondata = {"username": username,"newpassword": newpassword}
		console.log(newpassword);
		$.ajax({
	        type: "post",
	        url: "/topic/u/user/resetpassword",
	        dataType: 'json',
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(obj),
	        success: function (data) {
	        	alert(data);
	        	window.location.href ="/topic/u/login";
	        	
	        }
	    });
		
	}
	
	
</script>
   

</body>
</html>