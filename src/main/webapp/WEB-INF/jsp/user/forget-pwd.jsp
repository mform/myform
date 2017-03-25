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
        <h2 style="text-align: center">邮箱重置密码</h2>
        <br>
        <form  action="" method="get" class="form-horizontal">
            <div class="form-group" id="email">
                <label class="col-md-4 control-label">邮箱</label>
                <div class="col-md-4">
                    <input name="email" type="email" class="form-control"/>
                </div>
            </div>
            <div id="formAlert" class="alert hidden" role="alert"></div>
            <div class="col-md-12">
                <span class="col-md-7"></span>
                <input class="btn btn-default" type="button" onclick="resetPwd()" value="重置密码"/>
            </div>
        </form>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>
	function resetPwd(){
		window.location.href = '<c:url value="/u/user/waiting-email"/>';
		/* $.ajax({
	        type: "get",
	        url: "<c:url value="/u/user/waiting-email"/>",
	        data: "",
	        dataType: "json",
	        success: function (data) {
	        	
	        }
	    }); */
		
	}
</script>
</body>
</html>
