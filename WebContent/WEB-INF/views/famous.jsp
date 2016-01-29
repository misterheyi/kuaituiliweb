<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>推理名人_推理作家_酷爱推理</title>
    <meta name="description" content="酷爱推理为“酷爱”而生。我们有最多的经典推理题及答案，侦探推理，恐怖推理，推理游戏，甚至酷爱还收集谜题，资讯，推理知识百科，让读者沉溺在悬疑的世界中，从而爱上分析，爱上推理，爱上“酷爱”。" />
    <meta name="keywords"  content="推理，侦探，侦探推理，恐怖推理，推理游戏，谜语，未解之谜，推理知识，推理题及答案" />
	<%@ include file="common.jsp"%>
</head>
<script type="text/javascript">
	function search(){
		var key = $("#searchKey").val();
		window.location.href = "famous.html?title="+key;
	}
</script>
<body>

	<%@ include file="header.jsp"%>
	
	<div class="mainContent">
		<div class="main clearfix">
			<p>您当前位置：<a href="${ctx}index.html">首页</a> > <a href="${ctx}famous.html">名家</a></p>
			
			<!--  S-->
			<div class="classify books_list clearfix">
				
				<!--小说列表 -L  S-->
				 <div class=" book_left clearfix">
				 	<h1 class="seach_all">
						<img  src="${ctx}images/ss.png"/>
						<input id="searchKey" type="text" value="${searchTitle}"/>
						<button id="searchFamous" onclick="javascript:search();"> 搜索</button>
						<p>
						<c:forEach items="${famousTopList}" var="famousTop" varStatus="status">
							<c:if test="${status.count <=3}">
								<a href="${ctx}famous/detail/${famousTop.id}.html" title="${famousTop.title}">${famousTop.title}</a>
							</c:if>
						</c:forEach>
						</p>
					</h1>
					<ul class="peplist clearfix">
						<c:forEach items="${famousList}" var="famous">
							<li><a href="${ctx}famous/detail/${famous.id}.html" target="_blank" title="${famous.title}"><img src="${imgContext}${famous.logoUrl}"  alt="${famous.title}" title="${famous.title}"/><h3>${famous.title}</h3></a></li>
						</c:forEach>
					</ul>
					
					<!-- 分页 S -->
					 ${pageText}
					<!-- 分页 E -->		
				 </div>
				 <!--小说列表 -L  E-->
				 
				 
				 
				 <div class=" books_right clearfix">
					 <h1>点击排行榜</h1>
					 <ul class="books_123" id="books_123">
					 	<c:forEach items="${famousTopList}" var="famousTop" varStatus="status">
								<c:choose>
									<c:when test="${status.count <=3}">
										<li><span class="bj">${status.count}</span><a href="${ctx}famous/detail/${famousTop.id}.html" title="${famousTop.title}"><h3>${famousTop.title}<i>阅读(${famousTop.clickTimes})</i></h3></a></li>
									</c:when>
									<c:otherwise>
										<li><span class="bj1">${status.count}</span><a href="${ctx}famous/detail/${famousTop.id}.html" title="${famousTop.title}"><h3>${famousTop.title}<i>阅读(${famousTop.clickTimes})</i></h3></a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</ul>
				 </div>
				 
				 <!-- 广告位 S -->
				 <div class=" books_right clearfix" style="margin-top:10px; height:250px">
					<img src="${ctx}images/g6.png" style="width: 250px;height:250px" />
				 </div>
				 <!-- 广告位 E -->
				 <!-- 广告位 S -->
				 <div class=" books_right clearfix" style="margin-top:10px; height:250px">
					<img src="${ctx}images/g3.png" style="width: 250px;height:250px" />
				 </div>
				 <!-- 广告位 E -->
				 <!-- 广告位 S -->
				 <div class=" books_right clearfix" style="margin-top:10px; height:250px">
					<img src="${ctx}images/g5.png" style="width: 250px;height:250px" />
				 </div>
				 <!-- 广告位 E -->
				 
				 
			</div>
			<!--  E-->
			
			
		</div>
	</div>
	
	<!-- 尾部 S -->
    <%@ include file="footer.jsp"%>
    <!-- 尾部 E -->
	

</body>
</html>
