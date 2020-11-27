<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<h2>판매 등록</h2>
<form action="action/saleInsert.jsp">
		<%
			try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "smc_user_4", "1234");
		%>
		
  <table border="1">
    <tr>
      <td>판매한 상품</td>
      <td>
        <select name="product_id" id="product_id">
        <%
			Statement stmt = conn.createStatement();
			String query = " SELECT " + 
			" sale_id, product.name " + 
			" FROM " + 
			" sale, product "+
			" WHERE "+
			" product.product_id = sale.product_id ";
			/* System.out.println(query); */
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
        %>
          <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
          <%} %>
        </select>
      </td>
    </tr>
    <tr>
      <td>수량</td>
      <td><input type="number" name="amount"/></td>
    </tr>
    <tr>
      <td>판매 날짜</td>
      <td><input type="text" name="purchase_date" placeholder="yyyyMMdd"/></td>
    </tr>
    <tr>
      <td><input type="submit" value="제출" onclick="form_submit()"/></td>
      <td><input type="button" value="다시쓰기" onclick="form_reset_value()"/></td>
    </tr>
  </table>
  		<%
			stmt.close();
			conn.commit();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
</form>

<script>
const form_submit = () => {
	  alert('submit!');
	  document.student_insert.submit();
	};
const form_reset_value = () => {
	  alert('reset!');
	  document.student_insert.reset();
	};

</script>