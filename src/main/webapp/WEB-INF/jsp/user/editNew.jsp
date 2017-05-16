<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Title</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="content">
		<div class="edit-bar container">
			<h2 style="text-align: center">用户注册</h2>
			<br>
			<spring:url value="/u" var="formUrl" />
			<form:form modelAttribute="user" id="user-add" name="myform"
				class="form-horizontal">
				<div class="form-group" id="username">
					<label class="col-md-4 control-label">用户名</label>
					<div class="col-md-4">
						<form:input path="username" cssClass="form-control" />
					</div>
					<span class="col-md-4 help-inline"><form:errors
							path="username" /></span>
				</div>
				<div class="form-group" id="password">
					<label class="col-md-4 control-label">密码</label>
					<div class="col-md-4">
						<form:password path="password" cssClass="form-control" />
					</div>
					<span class="col-md-4 help-inline"><form:errors
							path="password" /></span>
				</div>
				<div class="form-group" id="email">
					<label class="col-md-4 control-label">邮箱</label>
					<div class="col-md-4">
						<form:input path="email" id="emailvalue" cssClass="form-control" />
					</div>
					<span class="col-md-4 help-inline"><form:errors path="email" /></span>
				</div>
				<div class="form-group" id="radomCode">
					<label class="col-md-4 control-label">验证码</label>
					<div class="col-md-4">
						<input id="radomCode" name="radomCode" class="form-control">
					</div>
					<div class="col-md-4">
						<input class="btn btn-default" type="button"
							id="sendmail"  value="发送验证码" />
					</div>
				</div>
				<div id="formAlert" class="alert hidden" role="alert"></div>
				<div class="col-md-12">
					<span class="col-md-7"></span> 
					<input class="btn btn-default" type="button" id ="subform" value="注册" />
				</div>
			</form:form>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<script>
	    var randomCode=null;
	    var form_randomCode=null;
	    $("#subform").click(function(){
	    	form_randomCode=myform.radomCode.value;
	       if(form_randomCode==null||form_randomCode==""){
	    	   alert("请输入验证码!");
	       }else if(
    		  form_randomCode!=randomCode){
    	   	  alert("验证码不正确!");
       	  }else {
       		$(this).prop("type","submit");
       	  }
	       
	       
	    });
		$(document).ready(dataBind("user-add", '${formUrl}', function() {
			window.location.href = '<c:url value="/"/>';
		}));
		
		$("#sendmail").click(function(){
			var daa=$("#emailvalue").val();
			var url ='<c:url value="/u/sendmail"/>';
			$.ajax({
		        type: "post",
		        url: "/topic/u/sendmail",
		        dataType: 'text',
		        contentType: "application/json; charset=utf-8",
		        data: daa,
		        success: function (data) {
		        	alert("发送成功");
		 	       
		        	randomCode=data;
		        	
		        }
		    });
		})
	</script>
</body>
</html>
