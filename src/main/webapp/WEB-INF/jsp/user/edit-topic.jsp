<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="content">
    <div class="container">
        <div class="user-show">
            <jsp:include page="../common/user-edit.jsp"/>
            <div class="user-show-top">
                <h4>全部帖子</h4>
                
            </div>
            <div class="user-show-main">
             
             <div class="list-group">
                    <li class="list-group-item">
                        <div class="post-bottom clearfix" >
	                        <div class="author-div">
	                         <a class="author-head" href="#"><img src="<c:url value="/resource/image/author.png"/>"></a>
	                        </div>
	                        <div class="author-content">
	                        	<span>huihui</span>
	                            <%-- <spring:eval expression="post.createTime"/> --%>
	                        </div>       
                        </div>
                        <div class="post-top ">
                            <a href="<c:url value="#"/>">云南大理</a>
                        </div>
                        <div class="post-bottom">
                            <i class="fa fa-eye" title="浏览数"></i>12 
                            <i class="fa fa-envelope" title="回复数"></i>1

                            <i class="fa fa-heart" title="点赞数"></i>12

                        </div>
					    
                    </li>
            </div>
            <jsp:include page="../common/page.jsp"/>
            </div>
            
        </div>
    </div>

</div>
<jsp:include page="../common/footer.jsp"/>
<script>
    
</script>
</body>
</html>
