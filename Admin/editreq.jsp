<!-- editreqjsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Update Requester";
   String PAGE = "requesters";
%>
<%@ include file="includes/header.jsp"%>

<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
String msg = "";
String r_name = request.getParameter("r_name");
String r_login_id = request.getParameter("id");
String r_email = request.getParameter("r_email");
String edit = request.getParameter("edit");
String requpdate = request.getParameter("requpdate");


if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}
%>
 <!-- Start 2nd COlumn -->
 <div class="col-sm-6 mt-5 mx-3 jumbotron">
  <h3 class="text-center">Update Requester Details</h3>
  <%
   if(!(edit==null)){
   sql = "SELECT * FROM requesterlogin_tb WHERE r_login_id = " + "\"" + r_login_id + "\"";
   db = new dbConnection();
   rs = db.data(sql);
   rs.next();
   r_name = rs.getString("r_name");
   r_login_id = rs.getString("r_login_id");
   r_email = rs.getString("r_email");
   db.closeConnection();
   }
   
   if(!(requpdate==null)){
    if((r_login_id.equals("")) || (r_name.equals("")) || (r_email.equals(""))){
     msg = "<div class='alert alert-warning col-sm-6 mt-2' role='alert'>Fill All Fileds</div>";
    } else {
     sql = "UPDATE requesterlogin_tb SET r_name = " + "\"" + r_name + "\"," + "r_email = +" + "\"" + r_email + "\"" + " WHERE r_login_id = " + "\"" + r_login_id + "\"";
     db = new dbConnection();
     int i = db.indata(sql);
     db.closeConnection();
     if(i==1000){
        msg = "<div class='alert alert-danger col-sm-6 mt-2' role='alert'>Unable to Update</div>";

     } else {
        msg = "<div class='alert alert-success col-sm-6 mt-2' role='alert'>Updated Successfully</div>";
     }
    }
   }
  %>
  <form action="" method="POST">
   <div class="form-group">
    <label for="r_login_id">Requester ID</label>
    <input type="text" class="form-control" name="id" id="r_login_id" Value="<%if(!(r_login_id.equals(""))){out.println(r_login_id);} %>" readonly>
   </div>
   <div class="form-group">
    <label for="r_name">Name</label>
    <input type="text" class="form-control" name="r_name" id="r_name" Value="<%if(!(r_name.equals(""))){out.println(r_name);} %>">
   </div>
   <div class="form-group">
    <label for="r_email">Email</label>
    <input type="text" class="form-control" name="r_email" id="r_email" Value="<%if(!(r_email.equals(""))){out.println(r_email);} %>">
   </div>
   <div class="text-center">
    <button type="submit" class="btn btn-danger" id="requpdate" name="requpdate">Update</button>
    <a href="requester.jsp" class="btn btn-secondary">Close</a>
   </div>
   <%if(!(msg.equals(""))){out.println(msg);}%>
</form>
 </div> <!-- End 2nd COlumn -->

 <%@ include file = "includes/footer.jsp" %>