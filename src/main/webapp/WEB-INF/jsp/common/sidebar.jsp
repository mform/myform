<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="side-bar">
    <div class="panel panel-default">
        <div class="main-bar-author">
            <div class="list-group">
                                       推荐作者
                <c:forEach items="${posts}" var="post">
                    <li class="list-group-item">
                        
                        <div class="post-bottom clearfix" >
	                        <div class="author-div">
	                         <a class="author-head" href="<c:url value="/u/${post.userUsername}"/>"><img src="<c:url value="/resource/image/author.png"/>"></a>
	                        </div>
	                        <div class="author-content">
	                        	<span>${post.userUsername}</span>
	                            <spring:eval expression="post.createTime"/>
	                        </div>       
                        </div>
                        <div class="post-bottom">
                           <!-- <div class="author-left"> -->
	                          <i class="fa fa-eye" title="浏览数"></i>浏览数：12
                            <i class="fa fa-envelope" title="回复数"></i>回复数：${post.commentsNumber}
                            <!-- </div> -->
                           
                        </div>
                        
					    
                    </li>
                </c:forEach>
            </div>
    </div>
</div>
