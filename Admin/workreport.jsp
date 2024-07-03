<!-- workreport.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Work Report";
   String PAGE = "workreport";
%>
<%@ include file="includes/header.jsp"%>

<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
String msg = "";
String request_id = request.getParameter("request_id");
String request_info = request.getParameter("request_info");
String requester_name = request.getParameter("requester_name");
String requester_add2 = request.getParameter("requester_add2");
String requester_city = request.getParameter("requester_city");
String requester_mobile = request.getParameter("requester_mobile");
String assign_tech = request.getParameter("assign_tech");
String assign_date = request.getParameter("assign_date");

String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");

String searchsubmit = request.getParameter("searchsubmit");


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
          <th scope="col">Req ID</th>  
          <th scope="col">Request Info</th>  
          <th scope="col">Name</th>  
          <th scope="col">Address</th>  
          <th scope="col">City</th>  
          <th scope="col">Mobile</th>  
          <th scope="col">Technician</th>  
          <th scope="col">Assigned Date</th>  
         </tr>  
        </thead>  
        <tbody>
  <%
   if(!(searchsubmit == null)){
    sql = "SELECT * FROM assignwork_tb WHERE assign_date BETWEEN " + "\"" +  startdate + "\"" + " AND " + "\"" +enddate + "\"";
    db = new dbConnection();
    rs = db.data(sql);
      while(rs.next()){
        request_id = rs.getString("request_id");
        request_info = rs.getString("request_info");
        requester_name = rs.getString("requester_name");
        requester_add2 = rs.getString("requester_add2");
        requester_city = rs.getString("requester_city");
        requester_mobile = rs.getString("requester_mobile");
        assign_tech = rs.getString("assign_tech");
        assign_date = rs.getString("assign_date");
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
         </tr>  
      <%} db.closeConnection();}%>
        <tr>  
         <td>  
          <input type="submit" class="btn btn-danger d-print-none" value="Print" onClick="window.print()">  
         </td>  
        </tr>  
        </tbody>  
       </table>  
</div>


<%@ include file = "includes/footer.jsp" %>