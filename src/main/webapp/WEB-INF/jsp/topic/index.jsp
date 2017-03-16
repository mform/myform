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
	    <div id="myCarousel" class="carousel slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>   
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="<c:url value="/resource/image/screenshot/one.jpg"/>" alt="First slide">
			</div>
			<div class="item">
				<img src="<c:url value="/resource/image/screenshot/two.jpg"/>" alt="Second slide">
			</div>
			<div class="item">
			
				<img src="<c:url value="/resource/image/screenshot/three.jpg"/>" alt="Third slide">
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	<!-- 全部帖子 -->
        <div class="main-bar">
            <jsp:include page="../common/nav.jsp"/>
            <div class="list-group">
                <c:forEach items="${posts}" var="post">
                    <li class="list-group-item">
                        <div class="post-right">
                                ${post.commentsNumber}
                        </div>
                        <div class="post-top">
                            <a href="<c:url value="/p/${post.id}"/>">${post.title}</a>
                        </div>
                        <div class="post-bottom">
                            作者：<a href="<c:url value="/u/${post.userUsername}"/>">${post.userUsername}</a>
                            创建时间：<spring:eval expression="post.createTime"/>
                            最后回复时间：<spring:eval expression="post.lastTime"/>
                        </div>

                    </li>
                </c:forEach>
            </div>
            <jsp:include page="../common/page.jsp"/>
        </div>
        <jsp:include page="../common/sidebar.jsp"/>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
