<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="content">
    <div class="edit-bar container">
        <form action="<c:url value="/u/user/sentUrl"/>" method="post">
        <h2 style="text-align: center">找回密码</h2>
        <br>
        
           <div class="form-group">
                <label class="col-md-4 control-label pwd-name">用户名</label>
                <div class="col-md-4">
                    <input name="username" type="text" id='username' class="form-control"/>
                </div>
            </div>
            <input class="btn btn-default" type="button" id ="subSentUrl" value="提交" />
        </form>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>
	var username=null;
	$("#subSentUrl").click(function(){
	   username=$("#username").val();
	   if(username==null||username==""){
		   alert("请输入用户名 !");
	   }else {
		  senturl(username);
	   }
	});
	
	function senturl(username){
		console.log(username);
		var url ='<c:url value="/u/user/sentUrl"/>';
		$.ajax({
	        type: "post",
	        url: "/topic/u/user/sentUrl",
	        dataType: 'text',
	        contentType: "application/json; charset=utf-8",
	        data: username,
	        success: function (data) {
	        	console.log(data);
	        	alert(data);
	        	
	        }
	    });
		
	}
	
</script>
</body>
</html>
