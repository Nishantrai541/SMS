<!-- work.jsp -->
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
String id = request.getParameter("id");
String delete = request.getParameter("delete");
if(is_adminlogin == null){
   response.sendRedirect("login.jsp");
 } else {
   aEmail = (String)session.getAttribute("aEmail");
 }
%>
<!-- Start 2nd COlumn -->
<div class="col-sm-9 col-md-10 mt-5">
   <table class="table">
      <thead>
       <tr>
        <th scope="col">Req ID</th>
        <th scope="col">Req Info</th>
        <th scope="col">Name</th>
        <th scope="col">Address</th>
        <th scope="col">City</th>
        <th scope="col">Mobile</th>
        <th scope="col">Technician</th>
        <th scope="col">Assigned Date</th>
        <th scope="col">Action</th>
       </tr>
      </thead>
      <tbody>
      <%
         sql = "SELECT * FROM assignwork_tb";
         db = new dbConnection();
         rs = db.data(sql);
         while(rs.next()) {
            int request_id = rs.getInt("request_id");
            String request_info = rs.getString("request_info");
            String requester_name = rs.getString("requester_name");
            String requester_add2 = rs.getString("requester_add2");
            String requester_city = rs.getString("requester_city");
            String requester_mobile = rs.getString("requester_mobile");
            String assign_tech = rs.getString("assign_tech");
            String assign_date = rs.getString("assign_date");
      %>

      <tr>
         <td><%=request_id%></td>
         <td><%=request_info%></td>
         <td><%=requester_name%></td>
         <td><%=requester_add2%></td>
         <td><%=requester_city%></td>
         <td><%=requester_mobile%></td>
         <td><%=assign_tech%></td>
         <td><%=assign_date%></td>
         <td>
        <form action="viewassignwork.jsp" method="POST" class="d-inline mr-2">
         <input type="hidden" name="id" value="<%=request_id%>"><button class="btn btn-warning" name="view" value="View" type="submit"><i class="far fa-eye"></i></button>
        </form>
        <form action="" method="POST" class="d-inline">
        <input type="hidden" name="id" value="<%=request_id%>"><button class="btn btn-secondary" name="delete" value="Delete" type="submit"><i class="far fa-trash-alt"></i></button>
       </form>
       </td>
      </tr>
   <%
   }
   db.closeConnection();
  if(!(delete == null)){
  sql= "DELETE FROM assignwork_tb WHERE request_id = " + "\"" + id + "\"";
  db = new dbConnection();
  int i = db.indata(sql);
  db.closeConnection();
  if(i==1000){
     out.println("Unable to delete data");
  } else {
     response.sendRedirect("work.jsp");
  }
  }
 %>
</tbody>
</table>
</div> <!-- End 2nd COlumn -->
<%@ include file = "includes/footer.jsp" %>