<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${baike.title}_推理百科_推理知识_酷爱推理</title>
    <meta name="description" content="酷爱推理为“酷爱”而生。我们有最多的经典推理题及答案，侦探推理，恐怖推理，推理游戏，甚至酷爱还收集谜题，资讯，推理知识百科，让读者沉溺在悬疑的世界中，从而爱上分析，爱上推理，爱上“酷爱”。" />
    <meta name="keywords"  content="推理，侦探，侦探推理，恐怖推理，推理游戏，谜语，未解之谜，推理知识，推理题及答案" />
	<%@ include file="common.jsp"%>
</head>

<body>

	<%@ include file="header.jsp"%>
	
	<div class="mainContent">
		<div class="main clearfix">
			<p>您当前位置：<a href="${ctx}index.html">首页</a> > <a href="${ctx}baike.html">百科</a> > <span>${baike.title}</span></p>
			
			<!-- 正文 S-->
			<div class="classify clearfix">
				 <div class="c_left">
					<div class="article_cont">
						<h1>${baike.title}</h1>
						${baike.htmlText}
						<div class="detal_page">
							<h5>文章关键字</h5>
							<c:if test="${not empty next}">
								<a href="${ctx}baike/detail/${next.id}.html" class="next"><span>上一篇 : </span>${next.title}</a>
							</c:if>
							<c:if test="${not empty pre}">
								<a href="${ctx}baike/detail/${pre.id}.html" class="next" style="float:right"><span>下一篇 : </span>${pre.title}</a>
							</c:if>
							<h9 style="float:left" class="bnt">
								<a href="${ctx}baike.html">返回列表</a>
							</h9>
						</div>
					
					</div>
				</div>
				 
				<!-- 右侧 - 广告  S-->
				<div class="c_right " style="margin-bottom:10px;height:250px; ">
					  <img src="${ctx}images/g8.png" style="width: 300px;height:250px" />
				</div>
				<!-- 右侧 - 广告  E-->
				 
				<!-- 右侧 - 最热文章  S-->
				<div class="c_right ">
					 <div class="hot_article clearfix">
					 	<h1>其他文章</h1>
						<ul class="con_tuju">
							<c:forEach items="${baikeTopList}" var="baikeTop" varStatus="status">
								<c:choose>
									<c:when test="${status.count <=3}">
										<li><span class="bj">${status.count}</span><a href="${ctx}baike/detail/${baikeTop.id}.html" title="${baikeTop.title}"><h3>${baikeTop.title}<i>阅读(${baikeTop.clickTimes})</i></h3></a></li>
									</c:when>
									<c:otherwise>
										<li><span class="bj1">${status.count}</span><a href="${ctx}baike/detail/${baikeTop.id}.html" title="${baikeTop.title}"><h3>${baikeTop.title}<i>阅读(${baikeTop.clickTimes})</i></h3></a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					 </div>
				</div>
				<!-- 右侧 - 最热文章  E-->
				
				<!-- 右侧 - 广告  S-->
				<div class="c_right " style="margin-top:10px; height:250px">
					  <img src="${ctx}images/g6.png" style="width: 300px;height:250px" />
				</div>
				<!-- 右侧 - 广告  E-->
				 
				
				 
			</div>
			<!-- 正文 E-->
			
			
			 <!-- 广告位 E -->
			 <div style="background-color:#CCCCCC; padding:5px 30px; width:1038px; height:100px; float:left; margin-top:10px;display: none;">
			 	 <div>广告</div>
			 </div>
			 <!-- 广告位 E -->
			
			
			<!-- 相关文章 s -->
			<div class="read_link  ">
			 	<h1>相关文章</h1>
				 <ul class="short_list">
				 	<c:forEach items="${baikeRandomList}" var="randomBaike">
				 		<li>
							<a class="img_a" href="${ctx}info/detail/${randomBaike.id}.html"  title="${randomBaike.title}"><img src="${imgContext}${randomBaike.logoUrl}" alt="${randomBaike.title}" title="${randomBaike.title}" />
								<h3>${randomBaike.title}</h3>
								<p class="infotxt">${randomBaike.description}</p>
								<p class="readmore"><fmt:formatDate value="${randomBaike.createTime}" pattern="yyyy/MM/dd"/>&nbsp;&nbsp;&nbsp;&nbsp;<span>阅读(${randomBaike.clickTimes})</span></p>
							</a>
						</li>
				 	</c:forEach>
				</ul>
			</div>
			<!-- 相关文章 s -->
			
			
			
		</div>
	</div>
	
	<!-- 尾部 S -->
    <%@ include file="footer.jsp"%>
    <!-- 尾部 E -->
	

</body>
</html>
