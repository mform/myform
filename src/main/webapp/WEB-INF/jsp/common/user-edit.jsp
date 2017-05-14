<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="user-show-list">
    <ul class="list-group">
        <a class="list-group-item" href="<c:url value="/u/edit/msg"/>">个人信息</a>
        <a class="list-group-item" href='<c:url value='/u/edit/topic/${sessionScope.sessionId}'/>'>用户帖子</a>
    </ul>
</div>
