<!-- productsellsuccess.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Sell Product";
   String PAGE = "assets";
%>
<%@ include file="includes/header.jsp"%>

<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
int myid = (int)session.getAttribute("myid");
dbConnection db = null;
ResultSet rs = null;
if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}

sql = "SELECT * FROM customer_tb WHERE custid = " + "\"" + myid + "\"";
db = new dbConnection();
rs = db.data(sql);
if(rs.next()){
  int custid = rs.getInt("custid");
  String custname = rs.getString("custname");
  String custadd = rs.getString("custadd");
  String cpname = rs.getString("cpname");
  String cpquantity = rs.getString("cpquantity");
  String cpeach = rs.getString("cpeach");
  String cptotal = rs.getString("cptotal");
  String cpdate = rs.getString("cpdate");
  db.closeConnection();
%>
 <div class='ml-5 mt-5'>
 <h3 class='text-center'>Customer Bill</h3>
 <table class='table'>
  <tbody>
  <tr>
    <th>Customer ID</th>
    <td><%=custid%></td>
  </tr>
   <tr>
     <th>Customer Name</th>
     <td><%=custname%></td>
   </tr>
   <tr>
     <th>Address</th>
     <td><%=custadd%></td>
   </tr>
   <tr>
   <th>Product</th>
   <td><%=cpname%></td>
  </tr>
   <tr>
    <th>Quantity</th>
    <td><%=cpquantity%></td>
   </tr>
   <tr>
    <th>Price Each</th>
    <td><%=cpeach%></td>
   </tr>
   <tr>
    <th>Total Cost</th>
    <td><%=cptotal%></td>
   </tr>
   <tr>
   <th>Date</th>
   <td><%=cpdate%></td>
  </tr>
   <tr>
    <td><form class='d-print-none'><input class='btn btn-danger' type='submit' value='Print' onClick='window.print()'></form></td>
    <td><a href='assets.jsp' class='btn btn-secondary d-print-none'>Close</a></td>
  </tr>
  </tbody>
 </table> </div>
<%} else {
  out.println("Failed");
}
%>
<%@ include file = "includes/footer.jsp" %>