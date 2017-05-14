<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="side-bar">
    <div class="panel panel-default">
        <div class="main-bar-author">
            <div class="list-group">
                                       推荐作者
                <c:forEach items="${users}" var="user">
                    <li class="list-group-item">
                        
                        <div class="post-bottom clearfix" >
	                        <div class="author-photo">
	                         <a class="author-head" href="<c:url value="/u/user/${user.id}"/>"><img src="<c:url value="/resource/upload/photo/${user.photo}"/>"></a>
	                        </div>
	                        <div class="author-content">
	                        	<span>${user.username}</span>
	                        </div>       
                        </div>
                    </li>
                </c:forEach>
            </div>
          </div>
    </div>
</div>
