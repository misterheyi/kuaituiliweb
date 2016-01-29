<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="header">
	<div class="header_main">
		<div class="logo"><a href="${ctx}index.html"><img src="${ctx}images/logo.jpg"></a></div>
		<div class="nav">
			<ul>
				
				<li <c:if test="${cType == 'INDEX'}">class="select_nav"</c:if>><a href="${ctx}index.html">首页</a></li>
				<li <c:if test="${cType == 'ESSAY'}">class="select_nav"</c:if>><a href="${ctx}essay.html">短文</a></li>
				<li <c:if test="${cType == 'FAMOUS'}">class="select_nav"</c:if>><a href="${ctx}famous.html">名家</a></li>
				<li <c:if test="${cType == 'RIDDLE'}">class="select_nav"</c:if>><a href="${ctx}riddle.html">谜语</a></li>
				<li <c:if test="${cType == 'MYSTERY'}">class="select_nav"</c:if>><a href="${ctx}mystery.html">未解之谜</a></li>
				<li <c:if test="${cType == 'INFO'}">class="select_nav"</c:if>><a href="${ctx}info.html">资讯</a></li>
				<li <c:if test="${cType == 'BAIKE'}">class="select_nav"</c:if>><a href="${ctx}baike.html">百科</a></li>
			</ul>
		</div>
	</div>
</div>
<body>