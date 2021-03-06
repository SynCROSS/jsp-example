<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	int product_id = Integer.parseInt(request.getParameter("product_id"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	String purchase_date = request.getParameter("purchase_date");

	try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "smc_user_4", "1234");

	Statement stmt = conn.createStatement();
	String insert_query = " INSERT INTO " + " sale(sale_id, product_id, purchase_date, sale_price, amount) "
	+ " VALUES(seq_sale.nextval, %d, '%s', %d, %d) ";
	String select_query = 
            " SELECT "+
            " price "+
       		" FROM "+
            " product, "+
            " sale "+
        	" WHERE "+
           " %d = product.product_id ";
    

	// System.out.println(String.format(select_query, product_id));
	ResultSet rs = stmt.executeQuery(String.format(select_query, product_id));
	rs.next();
	
	// System.out.println(String.format(insert_query, product_id, purchase_date, rs.getInt(1)*amount, amount));
	rs = stmt.executeQuery(String.format(insert_query, product_id, purchase_date, rs.getInt(1)*amount, amount));
	
	stmt.close();
	conn.commit();
	conn.close();
	
	response.sendRedirect("../index.jsp?routes=salesRegistration");
} catch (Exception e) {
	e.printStackTrace();
}
%>