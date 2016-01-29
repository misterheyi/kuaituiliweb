<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>推理_推理网_推理题及答案_推理百科知识_酷爱推理 </title>
    <meta name="description" content="酷爱推理为“酷爱”而生。我们有最多的经典推理题及答案，侦探推理，恐怖推理，推理游戏，甚至酷爱还收集谜题，资讯，推理知识百科，让读者沉溺在悬疑的世界中，从而爱上分析，爱上推理，爱上“酷爱”。" />
    <meta name="keywords"  content="推理，侦探，侦探推理，恐怖推理，推理游戏，谜语，未解之谜，推理知识，推理题及答案" />
	<%@ include file="common.jsp"%>
	<script type="text/javascript">
		var browser = {
			versions : function() {
			var u = navigator.userAgent, app = navigator.appVersion;
			return {//移动终端浏览器版本信息 
				mobile : (!!u.match(/AppleWebKit.*Mobile/) || !!u.match(/Windows Phone/) || !!u.match(/Android/) || !!u.match(/MQQBrowser/)) && !u.match(/iPad/)//是否为移动终端 
			};
			}()
		}
		if(browser.versions.mobile){
			window.location.href="http://m.kuaituili.com";
		}
	</script>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class="mainContent">
		<div class="main clearfix">
			
			<div class="index_tab">
				<div class="slideTxtBox">
					<div class="hd">
						<ul>
							<!-- <li class="on"><a href="#">最近更新</a></li> -->
							<li class=""><a href="#">未解之谜</a></li>
							<li class=""><a href="#">推理百科</a></li>
							<li class=""><a href="#">资讯中心</a></li>
						</ul>
					</div>
					<div class="bd">
<!-- 						<ul style="display: none;" class="news_list">
							<li> <a href="#" target="_blank" title="[福尔摩斯探案]第一百章：王者归来干嘛"><h3>[福尔摩斯探案]第一百章：王者归来干嘛</h3></a><i>2015/09/02</i></li>
							 
						</ul> -->
						<ul style="display: block;" class="news_list">
							<c:forEach items="${mysteryList}" var="mystery">
								<li> <a href="${ctx}mystery/detail/${mystery.id}.html" target="_blank" title="${mystery.title}"><h3>${mystery.title}</h3></a>
								<i><fmt:formatDate value="${mystery.createTime}" pattern="yyyy/MM/dd"/></i></li>
							</c:forEach>
						</ul>
						<ul style="display: block;" class="news_list">
							<c:forEach items="${baikeList}" var="baike">
								<li> <a href="${ctx}baike/detail/${baike.id}.html" target="_blank" title="${baike.title}"><h3>${baike.title}</h3></a>
								<i><fmt:formatDate value="${baike.createTime}" pattern="yyyy/MM/dd"/></i></li>
							</c:forEach>
						</ul>
						<ul style="display: none;" class="news_list">
							<c:forEach items="${infoList}" var="info">
								<li> <a href="${ctx}info/detail/${info.id}.html" target="_blank" title="${info.title}"><h3>${info.title}</h3></a>
								<i><fmt:formatDate value="${info.createTime}" pattern="yyyy/MM/dd"/></i></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">jQuery(".slideTxtBox").slide();</script>
			
			<!-- 图片 S-->
			<div class="index_intro">
				<a href="${ctx}famous/detail/${famous.id}.html">
					<img src="${imgContext}${famous.logoUrl}" />
					<h1>${famous.title}</h1>
				</a>
			</div>
			<!-- 图片 E-->
			
			<!-- 精彩短文 s -->
			<div class="th_2">
					<p><strong class="tip">推理短文</strong> <i><a href="${ctx}essay.html">更多+</a></i> </p>
					<ul class="short_list">
						<c:forEach items="${essayList}" var="essay">
							<li>
								<a class="img_a" href="${ctx}essay/detail/${essay.id}.html" target="_blank" title="${essay.title}"><img src="${imgContext}${essay.logoUrl}" alt="${essay.title}" title="${essay.title}" />
									<h3>${essay.title}</h3>
									<p class="infotxt">${essay.description}</p>
									<p class="readmore"><fmt:formatDate value="${essay.createTime}" pattern="yyyy/MM/dd"/>&nbsp;&nbsp;&nbsp;&nbsp;<span>阅读(${essay.clickTimes})</span></p>
								</a>
							</li>
						</c:forEach>
					</ul>
			</div>
			<!-- 精彩短文 E -->
			
			<!-- 推理小说 S -->
			<div class="novel" style="display: none;">
				<p><strong class="tip">推理小说</strong> <i><a href="${ctx}essay.html" target="_blank">更多+</a></i> </p>
				<ul class="novel_list">
					<li>
						<a class="img_a" href="./小说介绍页.html" target="_blank"  title="小说的名字" ><img src="images/b1.jpg" alt="小说的名字" title="小说的名字" />
							<h3>重生之国民男神</h3>
							<p class="infotxt">本文女扮男装，重生虐渣，酸爽无比宠文爽文无虐，双强双洁一对一，欢迎跳坑！前生司凰被至亲控制陷害，贵为连冠影帝，却死无葬身...</p>
							<p class="readmore">2015/11/17</p>
						</a>
					</li>
				</ul>
			</div>
			<!-- 推理小说 E -->
			
			
			<!-- 推理名家 S -->
			<div class="scrollBox">
			 	<p><strong class="tip">推理名家</strong> <i><a href="${ctx}famous.html" target="_blank" >更多+</a></i> </p>
				<div class="ohbox">
						<ul class="piclist">
							<c:forEach items="${famousList}" var="famous">
								<li><a href="${ctx}famous/detail/${famous.id}.html" target="_blank" title="${famous.title}"><img src="${imgContext}${famous.logoUrl}"  alt="${famous.title}" title="${famous.title}"/><h3>${famous.title}</h3></a></li>
							</c:forEach>
						</ul>
				</div>
				<div class="pageBtn">
					<span class="prev">&lt;</span>
					<span class="next">&gt;</span>
					<ul class="list"><li>0</li><li>1</li><li>2</li></ul>
				</div>
		 	 </div>
			<script type="text/javascript">jQuery(".scrollBox").slide({ titCell:".list li", mainCell:".piclist", effect:"left",vis:6,scroll:6,delayTime:800,trigger:"click",easing:"easeOutCirc"});</script>
		 	<!-- 推理名家 E -->
			 
			 <!-- 广告位 E -->
			 <div style="background-color:#CCCCCC; padding:5px 30px; width:1038px; height:100px; float:left; margin-top:10px; display: none;">
			 	 <div>广告</div>
			 </div>
			 <!-- 广告位 E -->
			 
			<!-- 百科中心 s -->
			<div class="th_2">
					<p><strong class="tip">百科中心</strong> <i><a href="${ctx}baike.html">更多+</a></i> </p>
					<ul class="short_list">
						<c:forEach items="${baikeList}" var="baike" varStatus="status">
							<c:if test="${status.count <= 6}">
								<li>
									<a class="img_a" href="${ctx}baike/detail/${baike.id}.html" target="_blank" title="${baike.title}"><img src="${imgContext}${baike.logoUrl}" alt="${baike.title}" title="${baike.title}" />
										<h3>${baike.title}</h3>
										<p class="infotxt">${baike.description}</p>
										<p class="readmore"><fmt:formatDate value="${baike.createTime}" pattern="yyyy/MM/dd"/>&nbsp;&nbsp;&nbsp;&nbsp;<span>阅读(${baike.clickTimes})</span></p>
									</a>
								</li>
							</c:if>
						</c:forEach>
					</ul>
			</div>
			<!-- 精彩短文 E -->
			 
			 <!-- 推理电影 S -->
			 <div class="scrollBox" id="qq" style="display: none;">
			 	<p><strong class="tip">推理电影</strong> <i><a href="${ctx}/moive.html" target="_blank">更多+</a></i> </p>
				<div class="ohbox">
						<ul class="piclist">
							<li><a href="./电影介绍页.html" target="_blank" title="惊天魔盗团"><img src="images/dy.jpg"  alt="惊天魔盗团" title="惊天魔盗团"/><h3>惊天魔盗团</h3></a></li>
						</ul>
				</div>
				<div class="pageBtn">
					<span class="prev">&lt;</span>
					<span class="next">&gt;</span>
					<ul class="list"><li>0</li><li>1</li><li>2</li></ul>
				</div>
			</div>
			<script type="text/javascript">jQuery("#qq").slide({ titCell:".list li", mainCell:".piclist", effect:"left",vis:6,scroll:6,delayTime:800,trigger:"click",easing:"easeOutCirc"});</script>
		    <!-- 推理电影 E -->
			
			  <!-- 广告位 E -->
			 <div style="background-color:#CCCCCC; padding:5px 30px; width:1038px; height:100px; float:left; margin-top:10px; display: none;">
			 	 <div>广告</div>
			 </div>
			 <!-- 广告位 E -->
			 
			 
			<div class="tab_3">
				<p><strong class="tip">谜语大全</strong> <i><a href="${ctx}riddle.html" target="_blank">更多+</a></i> </p>
				<ul class="news_list">
					<c:forEach items="${riddleList}" var="riddle">
						<li> 
							<a href="${ctx}riddle.html" target="_blank" title="${riddle.question}"><h3>${riddle.question}</h3></a>
							<i><fmt:formatDate value="${riddle.createTime}" pattern="yyyy/MM/dd"/></i>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="tab_3">
				<p style="background-color:#8edd81"><strong class="tip">未解之谜</strong> <i><a href="${ctx}mystery.html" target="_blank">更多+</a></i> </p>
				<ul class="news_list">
					<c:forEach items="${mysteryList}" var="mystery">
						<li> <a href="${ctx}mystery/detail/${mystery.id}.html" target="_blank" title="${mystery.title}"><h3>${mystery.title}</h3></a>
						<i><fmt:formatDate value="${mystery.createTime}" pattern="yyyy/MM/dd"/></i></li>
					</c:forEach>
				</ul>
			</div>
			<div class="tab_3" style="margin-right:0px;">
				<p style="background-color:#d9c684"><strong class="tip">推理百科</strong> <i><a href="${ctx}baike.html" target="_blank">更多+</a></i> </p>
				<ul class="news_list">
					<c:forEach items="${baikeList}" var="baike">
						<li> <a href="${ctx}baike/detail/${baike.id}.html" target="_blank" title="${baike.title}"><h3>${baike.title}</h3></a>
						<i><fmt:formatDate value="${baike.createTime}" pattern="yyyy/MM/dd"/></i></li>
					</c:forEach>
				</ul>
			</div>
			 
			
			<!-- 历史名人 s -->
			<div class="th_3 bt_gg ">
			  <div class="hisCelebrity">
				 	<h4>
						相关人物
					</h4>
					<p>
							<c:forEach items="${famousList}" var="famous">
								<i><a href="${ctx}famous/detail/${famous.id}.html">${famous.title}</a></i>
							</c:forEach>
					</p>
					<h5>
						<a  href="${ctx}/famous.html" target="_blank">更多</a>
					</h5>
				 </div>
				<div class="hisCelebrity" style="margin-top:10px;"> 
				 	<h4>
						友情链接
					</h4>
					<p>
						<c:forEach items="${linkList}" var="link">
							<i><a href="${link.targetUrl}">${link.title}</a></i>
						</c:forEach>
					</p>
					<h5>
						<a href="${ctx}aboutus.html">站长</a>
					</h5>
				 </div>
				
			</div>
			<!-- 历史名人 s -->
		</div>
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>
