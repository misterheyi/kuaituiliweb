package com.yzq.katl.util;

public class PageView {

	public static String getPage(Integer currPage, Integer pageSize,
			Integer total, String url, String param) {
		StringBuffer sb = new StringBuffer("");
		String fix = ".html";

		sb.append("<div style=\"border-top:none\" class=\"main_bearing_page\">");
		sb.append("<div class=\"paging_list\">");

		// 总页数
		int sumPage = total / pageSize;
		if (total % pageSize > 0) {
			sumPage++;
		}

		if (currPage > 1) {
			sb.append("<span class=\"page-syy\"><a class=\"p\" href='");
			sb.append(url).append(currPage - 1).append(fix);
			if (param != null) {
				sb.append("?" + param);
			}
			sb.append("'><&nbsp;上一页</a></span>");
		}
		int forSize = 11;
		int StartSize = 1;
		int endSize = 11;
		if (sumPage <= forSize) {
			endSize = sumPage;
		} else {
			int rollSize = 5;
			if (currPage > 5) {
				StartSize = currPage - rollSize;
				endSize = currPage + rollSize;
				if (endSize > sumPage) {
					endSize = sumPage;
					StartSize = sumPage - rollSize * 2;
				}
			}
		}

		if (currPage > 11) {
			sb.append("<span><a class=\"num\" href='");
			sb.append(url).append("1").append(fix);
			if (param != null) {
				sb.append("?" + param);
			}
			sb.append("'>1</a></span>");
			sb.append("<span class=\"ellipsis\">...</span>");
		}

		for (int i = StartSize; i <= endSize; i++) {
			String u = url + i + fix;
			String className = "class=\"num\"";
			if (i == currPage) {
				className = " class='page_current'";
			}
			sb.append("<span><a href='").append(u);
			if (param != null) {
				sb.append("?" + param);
			}
			sb.append("'");
			sb.append(className);
			sb.append(">");
			sb.append(i);
			sb.append("</a></span>");
		}

		if (currPage < 11 && sumPage > 11) {
			sb.append("<span class=\"ellipsis\">...</span>");
			sb.append("<span><a class=\"num\" href='");
			sb.append(url).append(sumPage).append(fix);
			if (param != null) {
				sb.append("?" + param);
			}
			sb.append("'>").append(sumPage).append("</a></span>");
		}

		if (currPage < sumPage) {
			sb.append("<span class=\"page-xyy\"><a class=\"p\" href='");
			sb.append(url).append(currPage + 1).append(fix);
			if (param != null) {
				sb.append("?" + param);
			}
			sb.append("'>下一页&nbsp;></a></span>");
		}

		sb.append("</div>");
		sb.append("<p>第" + currPage + "页 / 共" + sumPage + "页（共" + total
				+ "条记录）</p>");
		sb.append("</div>");
		return sb.toString();
	}

}
