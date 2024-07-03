<!-- submitrequestsuccess.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% String TITLE = "Success";String PAGE = "Success";%>
<%@ include file="includes/header.jsp"%>
<%
 dbConnection db;
 String email = "";
 String name = "";
 String passmsg = "";
 ResultSet rs = null;
 String msg = "";
 String sql = "";
 int genid = (int)session.getAttribute("myid");
 if(session.getAttribute("is_login")==null){
   response.sendRedirect("RequesterLogin.jsp");
 } else { 
  email = (String)session.getAttribute("email");
 }
sql = "SELECT * FROM submitrequest_tb WHERE request_id=" + "\"" + genid + "\"";
db = new dbConnection();
rs = db.data(sql);
if(rs.next()){
  %>
 <div class='ml-5 mt-5'>
 <table class='table'>
  <tbody>
   <tr>
     <th>Request ID</th>
     <td><%=rs.getString("request_id")%></td>
   </tr>
   <tr>
     <th>Name</th>
     <td><%=rs.getString("requester_name")%></td>
   </tr>
   <tr>
   <th>Email ID</th>
   <td><%=rs.getString("requester_email")%></td>
  </tr>
   <tr>
    <th>Request Info</th>
    <td><%=rs.getString("request_info")%></td>
   </tr>
   <tr>
    <th>Request Description</th>
    <td><%=rs.getString("request_desc")%></td>
   </tr>

   <tr>
    <td><form class='d-print-none'><input class='btn btn-danger' type='submit' value='Print' onClick='window.print()'></form></td>
  </tr>
  </tbody>
 </table> </div>
<%} else {
 out.println("Failed");
}
db.closeConnection();
%>
<%@ include file="includes/footer.jsp"%>