<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div id="main">
    <div class="container main-bar">
        <h1>用户管理</h1>
        <table class="table table-bordered">
            <tr>
                <th>user id</th>
                <th>username</th>
                <th>password</th>
                <th>email</th>
                <th>role</th>
                <th>phone</th>
                <!-- <th>ban</th> -->
                <th>opt</th>
            </tr>
            <c:forEach items="${users}" var="user">
            <c:if test="${user.id != 1}"> 
                <tr>
                    <td>${user.id}</td>
                    <td><a href="<c:url value="/u/${user.username}"/>">${user.username}</a></td>
                    <td>${user.password}</td>
                    <td>${user.email}</td>
                    <td>${user.roleId}</td>
                    <td>${user.phone}</td>
                    <script>
	                var id=${user.id};
	                var url="/admin/user/d/"+id;
	                </script>
                    <td>
                        <%-- <a href="<c:url value="/admin/user/${user.id}"/>">删除</a> --%>
                       <%--  "myAjaxForm({url : '<c:url value="/admin/user/d/${user.id}"/>', params : {_method:'delete'}})" --%>
                       <button onclick="deleteuser()">删除</button>
                    </td>
                </tr>
                <script>
                var id=${user.id};
                </script>
              </c:if>
            </c:forEach>
        </table>
        <jsp:include page="../../common/page.jsp"/>
    </div>
</div>
<script>
	function deleteuser(){
		
	  var url="/topic//admin/user/d/"+id;
		myAjaxForm({url : url, params : {_method:'delete'}});
		function myAjaxForm(parameters) {
    	    var url = parameters.url;
    	    var params = parameters.params;
    	    var $formAlert = parameters.$formAlert;
    	    var callback = parameters.callback;
    	    if (params == undefined)
    	        params = $("#ajaxForm").serialize();
    	    if ($formAlert == undefined)
    	        $formAlert = $("#formAlert");
    	    $.ajax({
    	        type: "post",
    	        url: url,
    	        data: params,
    	        dataType: "json",
    	        success: function (data) {
    	            if(data.message=="删除用户成功"){
    	         	   alert("删除用户成功");
    	         	  window.location.reload();
    	            }else{
    	            	alert("删除用户失败");
    	            }
    	        }
    	    });
    	}
	}
</script>
</body>
</html>
