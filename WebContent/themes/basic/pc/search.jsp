<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/nlft" prefix="nlft"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/themes/basic/pc/include.jsp" />
<title>搜索 ${s} - ${WEB_NAME}</title>
</head>
<body>
    <jsp:include page="/themes/basic/pc/header_home.jsp" />
    <div class="body">
        <div class="left">
        <div class="title">搜索 ${s} 的结果</div>
        <c:choose>
          <c:when test="${empty nlfPagingData.data}"><ul><li><div class="art_desc">没有数据！</div></li></ul></c:when>
          <c:otherwise>
            <ul>
            <c:forEach items="${nlfPagingData.data}" var="o">
            <li>
              <div class="art_header"><a href="${PATH}/action-Article/detail?id=${o.id}">${o.title}</a></div>
              <div class="art_desc"><c:if test="${not empty o.pic}">
                <img class="pic" src="${o.pic}" width="${PIC_WIDTH}" height="${PIC_HEIGHT}" />
              </c:if>
              ${o.description}...<a class="detail" href="${PATH}/action-Article/detail?id=${o.id}">阅读全文</a></div>
              <div class="art_footer">
                <div class="pull-right">
                  <a class="fa fa-share-alt">
                    <ol>
                      <li class="fa fa-weibo" onclick="shareTo('weibo','${o.title}','http://${DOMAIN}${PATH}/action-Article/detail?id=${o.id}');">分享到新浪微博</li>
                      <li class="fa fa-qq" onclick="shareTo('qzone','${o.title}','http://${DOMAIN}${PATH}/action-Article/detail?id=${o.id}');">分享到QQ空间</li>
                    </ol>
                  </a>
                </div>
                <i class="fa fa-calendar">&nbsp;${o.day}</i>
                <i class="fa fa-tags">
                <c:forEach items="${o.tags}" var="tag" varStatus="index">
                  <c:if test="${index.index>0}">|</c:if>
                  <a class="tag" href="${PATH}/action-Cat/page?id=${tag.id}" target="_self">${tag.name}</a>
                </c:forEach>
                <c:if test="${empty o.tags}">无标签</c:if>
                </i>
              </div>
              <div class="clear"></div>
            </li>
            </c:forEach>
            </ul>
            <div><nlft:page near="1" /></div>
          </c:otherwise>
        </c:choose>
        </div>
        <div class="right">
          <jsp:include page="/themes/basic/pc/comp/plugin_5.jsp" />
          <jsp:include page="/themes/basic/pc/comp/cat.jsp" />
          <jsp:include page="/themes/basic/pc/comp/plugin_3.jsp" />
        </div>
        <div class="clear"></div>
    </div>
    <jsp:include page="/themes/basic/pc/footer.jsp" />
</body>
</html>