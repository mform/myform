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
   <div class="main-bar" >
            <jsp:include page="../common/nav.jsp"/>
            <div class="list-group">
               <c:forEach items="${posts}" var="post"> 
                    <li class="list-group-item">
                        
                        <div class="post-bottom clearfix" >
	                        <div class="author-div">
	                         <a class="author-head" href="<c:url value="/u/${post.userUsername}"/>"><img src="<c:url value="/resource/image/author.png"/>"></a>
	                        </div>
	                        <div class="author-content">
	                        	<span>{post.userUsername}</span>
	                            <spring:eval expression="post.createTime"/>
	                        </div>       
                        </div>
                        <div class="post-top ">
                            <a href="<c:url value="/p/${post.id}"/>">{post.title}</a>
                        </div>
                        <div class="post-bottom">
                            <i class="fa fa-eye" title="浏览数"></i>{post.watchnumber }
                            <i class="fa fa-envelope" title="回复数"></i>{post.commentsNumber}

                            <i class="fa fa-heart" title="点赞数"></i>{post.agree}

                        </div>
					    
                    </li>
               </c:forEach> 
            </div>
    </div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>