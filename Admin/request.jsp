<!-- request.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Requests";
   String PAGE = "request";
%>
<%@ include file="includes/header.jsp"%>

<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
int submitrequest = 0;
int assignwork = 0;
int totaltech = 0;
String del = "";
if(is_adminlogin == null){
   response.sendRedirect("login.jsp");
 } else {
   aEmail = (String)session.getAttribute("aEmail");
 }
%>
<!-- Start 2nd Column -->
<div class="col-sm-4 mb-5">
 <%
  sql = "SELECT request_id, request_info, request_desc, request_date FROM submitrequest_tb";
  db = new dbConnection();
  rs = db.data(sql);
   while(rs.next()){
      int request_id = rs.getInt("request_id");
      String request_info = rs.getString("request_info");
      String request_desc = rs.getString("request_desc");
      String request_date = rs.getString("request_date");
      %>
    <div class="card mt-5 mx-5">
     <div class="card-header">
      Request ID:<%=request_id%>
     </div>
     <div class="card-body">
      <h5 class="card-title">Request Info: <%=request_info%>
      </h5>
      <p class="card-text"><%=request_desc%>
      </p>
      <p class="card-text">Request Date: <%=request_date%>
      </p>
      <div class="">
       <form action="" method="POST">
        <input type="hidden" name="id" value="<%=request_id%>">
        <input type="submit" class="btn btn-danger mr-3" value="View" name="view">
        <input type="submit" class="btn btn-secondary" value="Close" name="close">
        <%if(!(del.equals(""))){out.println(del);}%>
       </form>
      </div>
     </div>
    </div>
   <%}
   db.closeConnection();
 %>
</div> <!-- End 2nd Column -->
<%@ include file = "assignworkform.jsp" %>
<%@ include file = "includes/footer.jsp" %>