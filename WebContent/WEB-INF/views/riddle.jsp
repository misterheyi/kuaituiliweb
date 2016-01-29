<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>谜语大全_谜语答案_酷爱推理</title>
    <meta name="description" content="酷爱推理为“酷爱”而生。我们有最多的经典推理题及答案，侦探推理，恐怖推理，推理游戏，甚至酷爱还收集谜题，资讯，推理知识百科，让读者沉溺在悬疑的世界中，从而爱上分析，爱上推理，爱上“酷爱”。" />
    <meta name="keywords"  content="推理，侦探，侦探推理，恐怖推理，推理游戏，谜语，未解之谜，推理知识，推理题及答案" />
	<%@ include file="common.jsp"%>
</head>
<script type="text/javascript">
function updateRiddleClickTimes(id){
	$.post("riddle/updateRiddleClickTimes.html",{"id":id},function(result){
	});
}
</script>
<body>
	
	<%@ include file="header.jsp"%>
	
	<div class="mainContent">
		<div class="main clearfix">
			<p>您当前位置：<a href="${ctx}index.html">首页</a> > <a href="${ctx}riddle.html">谜语</a></p>
			
			<!-- 正文 S-->
			<div class="classify clearfix">
				 <div class="c_left">
					<div class="">
						 
						<div class="module" id="module">
							<c:forEach items="${riddleList}" var="riddle">
								<dt>${riddle.question}</dt>
								<dd>
									<span class="trigger-show" onclick="updateRiddleClickTimes(${riddle.id})">显示答案</span>
									<p><span class="answer-hd">答案</span><span class="answer">${riddle.answer}</span></p>
								</dd>
							</c:forEach>
						</div>
						
						<!-- 分页 S -->
						 ${pageText}
						<!-- 正文 E -->		
					
					</div>
				</div>
				<!-- 右侧 - 最热文章  S-->
				<div class="c_right ">
					 <div class="hot_article clearfix">
					 	<h1>最热点击</h1>
						<ul class="con_tuju">
							<c:forEach items="${riddleTopList}" var="riddleTop" varStatus="status">
								<c:choose>
									<c:when test="${status.count <=3}">
										<li><span class="bj">${status.count}</span><a href="${ctx}riddle/detail/${riddleTop.id}.html" title="${riddleTop.question}"><h3>${riddleTop.question}<i>阅读(${riddleTop.clickTimes})</i></h3></a></li>
									</c:when>
									<c:otherwise>
										<li><span class="bj1">${status.count}</span><a href="${ctx}riddle/detail/${riddleTop.id}.html" title="${riddleTop.question}"><h3>${riddleTop.question}<i>阅读(${riddleTop.clickTimes})</i></h3></a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>	
						</ul>
					 </div>
				</div>
				<!-- 右侧 - 最热文章  E-->
				
				<!-- 右侧 - 广告  S-->
				<div class="c_right " style="margin-top:10px; height:250px">
					  <img src="${ctx}images/g4.jpg" style="width: 300px;height:250px" />
				</div>
				<!-- 右侧 - 广告  E-->
				
				<!-- 右侧 - 广告  S-->
				<div class="c_right " style="margin-top:10px; height:250px">
					  <img src="${ctx}images/g5.png" style="width: 300px;height:250px" />
				</div>
				<!-- 右侧 - 广告  E-->
			</div>
			<!-- 正文 E-->
			
		
			
			
			
		</div>
	</div>
	
    <!-- 尾部 S -->
 	<%@ include file="footer.jsp"%>
    <!-- 尾部 E -->
	 <script type="text/javascript">
		<!--
		scroller();
		switchElem();
		share();
		//-->
	</script>
</body>
</html>
