<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>jsp example</title>
    <link rel="stylesheet" href="public/index.css" />
  </head>
  <body>
  	<%@ include file="common/header.jsp" %>
  	<%@ include file="common/nav.jsp" %>
  	<section>
  	<%
  	String routes = request.getParameter("routes") != null ? request.getParameter("routes") : "";
  	switch(routes){
  	case "salesRegistration":
  	%><%@ include file="routes/salesRegistration.jsp" %><%
  		break;
  	case "viewConsolidatedSalesHistory":
  	%><%@ include file="routes/viewConsolidatedSalesHistory.jsp" %><%
  		break;
  	case "salesStatusByProduct":
  	%><%@ include file="routes/salesStatusByProduct.jsp" %><%
  		break;
  	case "salesStatusByCategory":
  	%><%@ include file="routes/salesStatusByCategory.jsp" %><%
  		break;
  	default:
  	%>
  	<div style="text-align: left;">
  	<h3>쇼핑몰 관리 프로그램</h3>
  	<br/>
  	<pre>
쇼핑몰을 관리하기 위한 프로그램이다
  	
1.상품테이블, 카테고리 테이블, 매출정보 테이블을 생성한다.
2.판매 등록, 통합 매출 내역 조회, 상품별 매출현황, 카테고리별 매출현황 조회 페이지를 작성한다. 
3.올바르게 구현되었는지 확인한다.  	
  	</pre>
  	</div>
  	<%
  		break;
  	}
  	%>
  	</section>
  	<%@ include file="common/footer.jsp" %>
  </body>
</html>
