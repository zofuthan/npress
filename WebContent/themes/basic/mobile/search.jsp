<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/nlft" prefix="nlft"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <jsp:include page="/themes/basic/mobile/include.jsp" />
    <script type="text/javascript" src="${PATH}/js/share.js"></script>
    <title>搜索 ${s} - ${WEB_NAME}</title>
  </head>
  <body>
    <header>
      <nav><a class="fa fa-chevron-left" href="${PATH}/"></a></nav>
      <i>搜索 ${s}</i>
      <nav>
        <a class="fa fa-bars"></a>
      </nav>
    </header>
    <article>
      <c:choose>
        <c:when test="${empty nlfPagingData.data}"><ul><li>没有数据！</li></ul></c:when>
        <c:otherwise>
          <ul>
          <c:forEach items="${nlfPagingData.data}" var="o">
          <li class="thumb">
            <c:if test="${not empty o.pic}">
              <a href="${PATH}/action-Article/detail?id=${o.id}"><img class="pic" src="${o.pic}" width="${PIC_WIDTH}" height="${PIC_HEIGHT}" /></a>
            </c:if>
            <div>
            <div class="on-right">
            <i class="fa fa-clock-o">&nbsp;${o.day}</i>
            </div>
            <strong><a href="${PATH}/action-Article/detail?id=${o.id}">${o.title}</a></strong>
            <div class="space"></div>
            <div class="content">${o.description}</div>
            </div>
          </li>
          </c:forEach>
          </ul>
          <div><nlft:page near="1" /></div>
        </c:otherwise>
      </c:choose>
    </article>
    <jsp:include page="/themes/basic/mobile/footer_home.jsp" />
    <jsp:include page="/themes/basic/mobile/include_cat.jsp" />
  </body>
</html>