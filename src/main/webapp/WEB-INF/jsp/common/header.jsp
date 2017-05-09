<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/resource/module/bootstrap/css/bootstrap.min.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resource/module/button/css/buttons.css"/>"/>
<link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/resource/css/style.css"/>"/>
<script src="<c:url value="/resource/module/jquery/jquery-1.12.3/jquery-1.12.3.min.js"/>"></script>
<script src="<c:url value="/resource/module/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resource/module/jquery-cookie/jquery.cookie.js"/>"></script>
<script src="<c:url value="/resource/js/topic.js"/>"></script>
<script src="<c:url value="/resource/module/button/js/buttons.js"/>"></script>
<div class="top">
    <nav class="navbar-inverse">
        <%-- Logo --%>
        <div class="container container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                </button>
                <a class="navbar-brand" href="<c:url value="/"/>">解惑</a>
            </div>
		   <section class="webdesigntuts-workshop">
			<form action="" method="">		    
				<input name="search" placeholder="热门帖子">	
				<button onclick="search()">搜索</button>
				<%-- <a class="navbar-brand" href="<c:url value="/t/search"/>">搜索</a> --%>
			</form>

		  </section>

            <%----%>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <c:when test="${sessionUser == null}">
                      
                          <a href="<c:url value="/u/login"/>" class="button button-3d button-small button-rounded button-pill" role="button">登录</a>
                          <a href="<c:url value="/u/new" />" class="button button-3d button-small  button-royal button-pill" role="button">注册</a>
                        </c:when>
                        <c:otherwise>
                        <span class="button-dropdown  button-dropdown-primary button-dropdown-inverse" data-buttons="dropdown">
						    <button class="button button-primary button-large button-inverse">
						      <i class="fa fa-user"></i> ${sessionUser.username}
						    </button>
						    <ul class="button-dropdown-list is-below">
						    <c:choose>
						      <c:when test="${sessionUser.id == 1}">
							      <li><a href="<c:url value="/admin"/>"><i class="fa fa-users"></i>&nbsp; 管理员界面</a></li>
							      <li><a href="<c:url value="/u/${sessionUser.id}"/>"><i class="fa fa-heart-o"></i>&nbsp;  个人信息</a></li>
							      <li><a href="<c:url value="/p/new?topicId=${id}"/>"><i class="fa fa-file-text"></i>&nbsp;  发帖子</a></li>
							      <li class="button-dropdown-divider">
							        <a href="<c:url value="/u/logout"/>"><i class="fa fa-power-off"></i>&nbsp;  退出登录</a>
							      </li>
							  </c:when>
						      <c:otherwise>
						      <li><a href="<c:url value="/u/${sessionUser.id}"/>"><i class="fa fa-heart-o"></i>  个人信息</a></li>
						      <li><a href="<c:url value="/p/new?topicId=${id}"/>"><i class="fa fa-file-text"></i>  发帖子</a></li>
						      <li class="button-dropdown-divider">
						        <a href="<c:url value="/u/logout"/>"><i class="fa fa-power-off"></i>  退出登录</a>
						      </li>
						       </c:otherwise>
						    </c:choose>
						    </ul>
						  </span>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
