<!-- soldproductreport.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Product Report";
   String PAGE = "sellreport";
%>
<%@ include file="includes/header.jsp"%>

<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
String msg = "";
String custid = request.getParameter("custid");
String custname = request.getParameter("custname");
String custadd = request.getParameter("custadd");
String cpname = request.getParameter("cpname");
String cpquantity = request.getParameter("cpquantity");
String cpeach = request.getParameter("cpeach");
String cptotal = request.getParameter("cptotal");
String cpdate = request.getParameter("cpdate");

String searchsubmit = request.getParameter("searchsubmit");
String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");;

if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}
%>

<!-- Start 2nd Column -->
<div class="col-sm-9 col-md-10 mt-5 text-center">
  <form action="" method="POST" class="d-print-none">
    <div class="form-row">
      <div class="form-group col-md-2">
        <input type="date" class="form-control" id="startdate" name="startdate">
      </div> <span> to </span>
      <div class="form-group col-md-2">
        <input type="date" class="form-control" id="enddate" name="enddate">
      </div>
      <div class="form-group">
        <input type="submit" class="btn btn-secondary" name="searchsubmit" value="Search">
      </div>
    </div>
  </form>
  <p class="bg-dark text-white p-2 mt-4">Details</p> 
      <table class="table"> 
       <thead> 
        <tr> 
         <th scope="col">Customer ID</th> 
         <th scope="col">Customer Name</th> 
         <th scope="col">Address</th> 
         <th scope="col">Product Name</th> 
         <th scope="col">Quantity</th> 
         <th scope="col">Price Each</th> 
         <th scope="col">Total</th> 
         <th scope="col">Date</th> 
        </tr> 
       </thead> 
       <tbody> 
  <%
   if(!(searchsubmit == null)){
    sql = "SELECT * FROM customer_tb WHERE cpdate BETWEEN " + "\"" +  startdate + "\"" + " AND " + "\"" +enddate + "\"";
    db = new dbConnection();
    rs = db.data(sql);
      while(rs.next()){
          custid = rs.getString("custid");
          custname = rs.getString("custname");
          custadd = rs.getString("custadd");
          cpname = rs.getString("cpname");
          cpquantity = rs.getString("cpquantity");
          cpeach = rs.getString("cpeach");
          cptotal = rs.getString("cptotal");
          cpdate = rs.getString("cpdate");
      %>
        <tr> 
         <td><%=custid%></td> 
         <td><%=custname%></td> 
         <td><%=custadd%></td> 
         <td><%=cpname%></td> 
         <td><%=cpquantity%></td> 
         <td><%=cpeach%></td> 
         <td><%=cptotal%></td> 
         <td><%=cpdate%></td> 
         <td><%=custid%></td> 
        </tr> 
      <%}db.closeConnection();}%>
       <tr> 
        <td> 
         <input type="submit" class="btn btn-danger d-print-none" value="Print" onClick="window.print()"> 
        </td> 
       </tr> 
       </tbody> 
      </table> 
</div>

<%@ include file = "includes/footer.jsp" %>