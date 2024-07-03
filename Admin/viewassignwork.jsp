<!-- viewassignwork.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Work Order";
   String PAGE = "work";
%>
<%@ include file="includes/header.jsp"%>

<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
String view = request.getParameter("view");
String id = request.getParameter("id");
if(is_adminlogin == null){
   response.sendRedirect("login.jsp");
 } else {
   aEmail = (String)session.getAttribute("aEmail");
 }
%>
<!-- Start 2nd COlumn -->
<div class="col-sm-6 mt-5 mx-3">
 <h3 class="text-center">Assigned Work Details</h3>
 <%
  if(!(view == null)){
   sql = "SELECT * FROM assignwork_tb WHERE request_id = " + "\"" + id + "\"";
   db = new dbConnection();
   rs = db.data(sql);
   if(rs.next()){ 
    String request_id = rs.getString("request_id");
    String request_info = rs.getString("request_info");
    String request_desc = rs.getString("request_desc");
    String requester_name = rs.getString("requester_name");
    String requester_add1 = rs.getString("requester_add1");
    String requester_add2 = rs.getString("requester_add2");
    String requester_city = rs.getString("requester_city");
    String requester_state = rs.getString("requester_state");
    String requester_zip = rs.getString("requester_zip");
    String requester_email = rs.getString("requester_email");
    String requester_mobile = rs.getString("requester_mobile");
    String assign_date = rs.getString("assign_date");
    String assign_tech = rs.getString("assign_tech");
    db.closeConnection();
  %>
  <table class="table table-bordered">
   <tbody>
    <tr>
     <td>Request ID</td>
     <td><%if(!(request_id.equals(""))){out.println(request_id);} %></td>
    </tr>
    <tr>
     <td>Request Info</td>
     <td><%if(!(request_info.equals(""))){out.println(request_info);} %></td>
    </tr>
    <tr>
     <td>Request Description</td>
     <td><%if(!(request_desc.equals(""))){out.println(request_desc);} %></td>
    </tr>
    <tr>
     <td>Name</td>
     <td>
       <%if(!(requester_name.equals(""))){out.println(requester_name);} %>
     </td>
    </tr>
    <tr>
     <td>Address Line 1</td>
     <td>
       <%if(!(requester_add1.equals(""))){out.println(requester_add1);} %>
     </td>
    </tr>
    <tr>
     <td>Address Line 2</td>
     <td>
      <%if(!(requester_add2.equals(""))){out.println(requester_add2);} %>
     </td>
    </tr>
    <tr>
     <td>City</td>
     <td>
      <%if(!(requester_city.equals(""))){out.println(requester_city);} %>
     </td>
    </tr>
    <tr>
     <td>State</td>
     <td>
      <%if(!(requester_state.equals(""))){out.println(requester_state);} %>
     </td>
    </tr>
    <tr>
     <td>Pin Code</td>
     <td>
      <%if(!(requester_zip.equals(""))){out.println(requester_zip);} %>
     </td>
    </tr>
    <tr>
     <td>Email</td>
     <td>
      <%if(!(requester_email.equals(""))){out.println(requester_email);} %>
     </td>
    </tr>
    <tr>
     <td>Mobile</td>
     <td>
      <%if(!(requester_mobile.equals(""))){out.println(requester_mobile);} %>
     </td>
    </tr>
    <tr>
     <td>Assigned Date</td>
     <td>
      <%if(!(assign_date.equals(""))){out.println(assign_date);} %>
     </td>
    </tr>
    <tr>
     <td>Technician Name</td>
     <td><%if(!(assign_tech.equals(""))){out.println(assign_tech);} %></td>
    </tr>
    <tr>
     <td>Customer Sign</td>
     <td></td>
    </tr>
    <tr>
     <td>Technician Sign</td>
     <td></td>
    </tr>
   </tbody>
  </table>
    <div class="text-center">
     <form action="" class="mb-3 d-print-none d-inline">
      <input class="btn btn-danger" type="submit" value="Print" onClick="window.print()"> </form>
      <form action="work.jsp" class="mb-3 d-print-none d-inline"><input class="btn btn-secondary" type="submit" value="Close">
     </form>
    </div>
 <% }} %>
</div>
<!-- End 2nd COlumn -->
<%@ include file = "includes/footer.jsp" %>