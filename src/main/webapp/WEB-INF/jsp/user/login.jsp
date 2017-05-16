<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="content">
    <div class="edit-bar container">
        <form id="ajaxForm" action="" method="post" class="form-horizontal">
            <h2 style="text-align: center">登录</h2>
            <br>
            <div class="form-group">
                <label class="col-md-4 control-label">用户名</label>
                <div class="col-md-4">
                    <input name="username" type="text" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label">密码</label>
                <div class="col-md-4">
                    <input name="password" type="password" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-4"></div>
                <div class="col-sm-8">
                    <div class="checkbox">
                        <label><input type="checkbox" name="rememberPassword">记住密码</label>
                        <a class="pwd_right" href ="<c:url value="/u/user/forget-pwd"/>">忘记密码</a>
                    </div>
                </div>
            </div>
            <div id="formAlert" class="alert hidden" role="alert"></div>
            <div class="col-md-12">
                <span class="col-md-7"></span>
                 <input class="btn btn-default" type="button" onclick="login()" value="登录"/>
            </div>
        </form>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>

<script>
    $(function () {
    	/* 记住密码 */
        var rem = $.cookie("rememberPassword");
        if (rem != undefined) {
            $("input[name='username']").val($.cookie("username"));
            $("input[name='password']").val($.cookie("password"));
            $("input[name='rememberPassword']").attr("checked", "checked");
        }
    });
    function login() {
        myAjaxForm({
            url: '<c:url value="/u/valid"/>', params: undefined, $formAlert: undefined, callback: function () {
                $.removeCookie("username");
                $.removeCookie("password");
                if ($("input[name='rememberPassword']").is(":checked")) {
                    $.cookie("rememberPassword", true);
                    $.cookie("username", $("input[name='username']").val(), {expires: 30});
                    $.cookie("password", $("input[name='password']").val(), {expires: 30});
                } else {
                    $.removeCookie("rememberPassword");
                }
            }
        });
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
    	            if (callback != undefined) {
    	                showAlert({
    	                    $formAlert: $formAlert,
    	                    data: data,
    	                    callback: callback
    	                });
    	            } else {
    	                showAlert({$formAlert: $formAlert, data: data});
    	            }
    	            
    	            if(data.message=="管理员登录"){
    	         	   console.log(data.message);
    	         	   window.location.href = '<c:url value="/admin/topic/"/>';
    	            }else{
    	         	   window.location.href = '<c:url value="/"/>';
    	            }
    	        }
    	    });
    	}
    }
</script>
</body>
</html>
