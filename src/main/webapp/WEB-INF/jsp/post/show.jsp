<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="content">
    <div class="container">
        <div class="main-bar">
            <jsp:include page="../common/nav.jsp"/>
            <%-- 帖子主要内容 --%>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span>${post.title}</span>
                    <span class="navbar-right">
                    创建时间：<spring:eval expression="post.createTime"/>
                    来自: <a href="<c:url value="/u/${user.username}"/>">${user.username}</a>
                </span>
                
                </div>
                <div class="panel-body">
                    <pre>${post.content}</pre>
                    <i id="content-agree" class="fa fa-heart-o " title="点赞数"> &nbsp;<a>0 赞</a>  </i>
                </div>
            </div>
            <%-- 帖子评论列表 --%>
            <ul class="list-group">
                <c:forEach items="${comments}" varStatus="status" var="comment">
                    <li class="list-group-item">
                            ${status.count}#
                        <a href="<c:url value="/u/${comment.userUsername}"/>">${comment.userUsername}</a>:
                        发表时间：<spring:eval expression="comment.createTime"/>
                        <pre>${comment.content}</pre>
                         <i id="agree" class="fa fa-heart-o " title="点赞数"> &nbsp;<a>0 赞</a>  </i>
                    </li>
                </c:forEach>
            </ul>
            <div class="panel panel-default">
                <div class="panel-heading">
                    回复
                </div>
                <div class="panel-body">
                    <form id="ajaxForm">
                        <input name="postId" value="${post.id}" type="hidden">
                        <textarea name="content" class="form-control" rows="5"></textarea>
                        <div id="formAlert" class="alert hidden" role="alert"></div>
                        <button type="button" class="btn btn-default" onclick="postComments()">回复
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <%--<jsp:include page="../sidebar.jsp"/>--%>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>

<script>
     var flag=true;
     $('#agree').click(function(){
    	 if(flag){
    		 $('#agree').attr("class", "fa fa-heart");
    		 flag=false;
    	 }else{
    		 $('#agree').attr("class", "fa fa-heart-o");
    		 flag=true;
    	 }
    	 $.post("<c:url value="/c/like"/>",
    			  {
    			    flag:!flag
    			  },
    			  function(data,status){
    	});
    	 
     });
     var cflag=true;
     $('#content-agree').click(function(){
    	 if(cflag){
    		 $('#content-agree').attr("class", "fa fa-heart");
    		 cflag=false;
    	 }else{
    		 $('#content-agree').attr("class", "fa fa-heart-o");
    		 cflag=true;
    	 }
    	 $.post("<c:url value="/p/like"/>",
   			  {
   			    flag:!cflag
   			  },
   			  function(data,status){
   	   });
    	 
     });
     
    function postComments() {
        myAjaxForm({
            url: '<c:url value="/c"/>', callback: function () {
                window.location.reload();
            }
        });
    }
</script>
</body>
</html>

