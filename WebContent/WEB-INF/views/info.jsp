<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>推理资讯_推理新闻_酷爱推理</title>
    <meta name="description" content="酷爱推理为“酷爱”而生。我们有最多的经典推理题及答案，侦探推理，恐怖推理，推理游戏，甚至酷爱还收集谜题，资讯，推理知识百科，让读者沉溺在悬疑的世界中，从而爱上分析，爱上推理，爱上“酷爱”。" />
    <meta name="keywords"  content="推理，侦探，侦探推理，恐怖推理，推理游戏，谜语，未解之谜，推理知识，推理题及答案" />
	<%@ include file="common.jsp"%>
</head>

<body>

	<%@ include file="header.jsp"%>
	
	<div class="mainContent">
		<div class="main clearfix">
			<p>您当前位置：<a href="${ctx}index.html">首页</a> > <a href="${ctx}info.html">资讯</a></p>
			
			<!-- 正文 S-->
			<div class="classify clearfix">
				
				 <div class="c_left">
					<div class="article_cont">
						<!-- 短文分类 S-->
						<!-- 短文分类 E-->
						
						<!-- 短文列表 S-->
						<ul class="art_list">
							<c:forEach items="${infoList}" var="info">
								<li>
									<a class="img_a" href="${ctx}info/detail/${info.id}.html" target="_blank" title="${info.title}"><img src="${imgContext}${info.logoUrl}" alt="${info.title}" title="${baike.title}" />
										<h3>${info.title}</h3>
										<p class="infotxt">${info.description}</p>
										<p class="readmore"><fmt:formatDate value="${info.createTime}" pattern="yyyy/MM/dd"/>&nbsp;&nbsp;&nbsp;&nbsp;<span>阅读(${info.clickTimes})</span></p>
									</a>
								</li>
							</c:forEach>
						</ul>
						<!-- 短文列表 E-->
						
						<!-- 分页 S -->
						 ${pageText}
						<!-- 分页 E -->	
						
					</div>
				</div>
				
				<!-- 右侧 - 最热文章  S-->
				<div class="c_right ">
					 <div class="hot_article clearfix">
					 	<h1>最热文章</h1>
						<ul class="con_tuju">
							<c:forEach items="${infoTopList}" var="infoTop" varStatus="status">
								<c:choose>
									<c:when test="${status.count <=3}">
										<li><span class="bj">${status.count}</span><a href="${ctx}info/detail/${infoTop.id}.html" title="${infoTop.title}"><h3>${infoTop.title}<i>阅读(${infoTop.clickTimes})</i></h3></a></li>
									</c:when>
									<c:otherwise>
										<li><span class="bj1">${status.count}</span><a href="${ctx}info/detail/${infoTop.id}.html" title="${infoTop.title}"><h3>${infoTop.title}<i>阅读(${infoTop.clickTimes})</i></h3></a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					 </div>
				</div>
				<!-- 右侧 - 最热文章  E-->
				
				<!-- 右侧 - 广告  S-->
				<div class="c_right " style="margin-top:10px; height:250px">
					  <img src="${ctx}images/g7.png" style="width: 300px;height:250px" />
				</div>
				<!-- 右侧 - 广告  E-->
				
				<!-- W未解之谜  S-->
				<div class="c_right " style="margin-top:10px; height:310px; padding-top:10px;">
					  <div class="hot_pic">
					 	<h1>未解之谜</h1>
						<ul class="hot_pic_list">
							<c:forEach items="${randomMysteryList}" var="randomMystery">
								<li> <a href="${ctx}mystery/detail/${randomMystery.id}.html" target="_blank"><img src="${imgContext}${randomMystery.logoUrl}"><p>${randomMystery.title}</p></a></li>
							</c:forEach>						</ul>
					</div>
				</div>
				<!-- 未解之谜  E-->
				
				<!-- 右侧 - 广告  S-->
				<div class="c_right " style="margin-top:10px; height:250px">
					  <img src="${ctx}images/g8.png" style="width: 300px;height:250px" />
				</div>
				<!-- 右侧 - 广告  E-->
				
			</div>
			
			
			<!-- 正文 E-->
			
		
			
			
			
		</div>
	</div>
	
	<!-- 尾部 S -->
    <%@ include file="footer.jsp"%>
    <!-- 尾部 E -->
	

</body>
</html>
