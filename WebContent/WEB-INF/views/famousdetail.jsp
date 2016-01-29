<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${famous.title}_推理名人_推理作家_酷爱推理</title>
    <meta name="description" content="酷爱推理为“酷爱”而生。我们有最多的经典推理题及答案，侦探推理，恐怖推理，推理游戏，甚至酷爱还收集谜题，资讯，推理知识百科，让读者沉溺在悬疑的世界中，从而爱上分析，爱上推理，爱上“酷爱”。" />
    <meta name="keywords"  content="推理，侦探，侦探推理，恐怖推理，推理游戏，谜语，未解之谜，推理知识，推理题及答案" />
	<%@ include file="common.jsp"%>	
</head>

<body>

	<%@ include file="header.jsp"%>
	<div class="mainContent">
		<div class="main clearfix">
			<p>您当前位置：<a href="${ctx}index.html">首页</a> > <a href="${ctx}famous.html">名家</a> > <span>${famous.title}</span></p>
			
			<!-- 主页 S-->
			<div class="classify books_list clearfix" >
			
				<!-- 左侧 S -->
				 <div class=" book_left clearfix">
				 	 
					<div class="bookcover-hd">
						<i class="st-icon" style="background-color:#666666; border-radius:6px;"></i>
						<div class="booktitle">
							<div class="name"><h1>${famous.title}</h1></div>
							<p><a href="./人物列表页.html" title="人物" target="_blank">人物</a><em>|</em>${famous.clickTimes}</p>
						</div>
					</div>
					
					<!-- 人物介绍正文 S -->
					<div class="mt20 clearfix bookcover-bd">
						<div style=" text-align: center;"><img src="${imgContext}${famous.logoUrl}" alt="惊天魔盗团"></div>
						 ${famous.brief}
					</div>
					<!-- 人物介绍正文 E -->
					
				 </div>
				 <!-- 左侧 E -->
				 
				 
				 <!-- 右侧 S -->
				 <div class=" books_right clearfix">
					 <h1>基本信息</h1>  
					<div class="authorotherbook">
						${famous.basic}
						<div class="authorotherbook">
					</div>
					</div>
				 </div>
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
				 
				 <!-- 右侧 E -->
				 
			</div>
			<!-- 主页 E-->
		
			<!-- 广告位 S -->
			 <div style="background-color:#fff; padding:5px 30px; width:1038px; height:100px; float:left; margin:10px 0px;display: none;">
			 	 <div>广告</div>
			 </div>
			 <!-- 广告位 E -->
		
			<div class="classify books_list clearfix mt20">
				 <div class=" book_left clearfix book_left_bottom"  style=" width:1060px; ">
				 	<h1>其他名家</h1>
					<ul>
				   		<c:forEach items="${famousRandomList}" var="famousRandom">
					   		<li>
								<a href="${ctx}famous/detail/${famousRandom.id}.html" title="${famousRandom.title}" class="pic">
									<img src="${imgContext}${famousRandom.logoUrl}" alt="${famousRandom.title}">
								</a>
								<div class="graybg">
									<p class="author" style="height:30px; line-height:30px;">${famousRandom.title}</p>
								</div>
								<a href="${ctx}famous/detail/${famousRandom.id}.html" class="introlink">
									<span class="intro">${famousRandom.description}</span>
									<span class="readbtn">详细介绍</span>
								</a>
								<div class="introbg"></div>
							</li>
				   		</c:forEach>
					</ul>
				 </div>
			</div>
		</div>
	</div>
	<!-- 尾部 S -->
    <%@ include file="footer.jsp"%>
    <!-- 尾部 E -->
	
	<script >
	$(function () {
		$(".books_list li").hover(function () {
			$(this).children(".introbg").stop(true, true).fadeTo("fast", 0.6);
			$(this).children(".introlink").stop(true, true).fadeIn("fast");
		}, function () {
			$(this).children(".introbg").stop(true, true).fadeTo("fast", 0);
			$(this).children(".introlink").stop(true, true).fadeOut("fast");
		});
	 
	});
	</script>
</body>
</html>
