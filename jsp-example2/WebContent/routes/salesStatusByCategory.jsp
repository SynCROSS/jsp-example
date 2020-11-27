<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<h2>카테고리별 매출현황 조회</h2>
<table border="1">
	<tr>
		<td>카테고리명</td>
		<td>총 판매 금액</td>
		<td>판매 개수</td>
	</tr>
	<%
		try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "smc_user_4", "1234");

		Statement stmt = conn.createStatement();
		String query = " SELECT " + " category.name, " + " SUM(sale_price) AS total_price, "
		+ " SUM(amount) AS total_amount " + " FROM " + " sale, " + " category, " + " product " + " WHERE "
		+ " category.category_id = product.category_id " + " AND product.product_id = sale.product_id "
		+ " GROUP BY " + " category.name " + " ORDER BY " + " total_price DESC ";
		;
		// System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getInt("total_price")%></td>
		<td><%=rs.getInt("total_amount")%></td>
	</tr>
	<%
		}

	stmt.close();
	conn.commit();
	conn.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</table>