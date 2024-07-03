<!-- requester.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Requesters";
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
String r_login_id = request.getParameter("r_login_id");
String r_email = request.getParameter("r_email");
String delete = request.getParameter("delete");

if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}
%>
<!-- Start 2nd Column -->
<div class="col-sm-9 col-md-10 mt-5 text-center">
 <p class="bg-dark text-white p-2">List of Requesters</p>
 <table class="table"> 
   <thead> 
    <tr> 
     <th scope="col">Requester ID</th> 
     <th scope="col">Name</th> 
     <th scope="col">Email</th> 
     <th scope="col">Action</th> 
    </tr> 
   </thead> 
   <tbody> 
 <%
  sql = "SELECT * FROM requesterlogin_tb";
  db = new dbConnection();
  rs = db.data(sql); 
     while(rs.next()){
      r_name = rs.getString("r_name");
      r_email = rs.getString("r_email");
      r_login_id = rs.getString("r_login_id");

   %>
         <tr> 
          <td><%=r_login_id%></td> 
          <td><%=r_name%></td> 
          <td><%=r_email%></td> 
          <td> 
           <form action="editreq.jsp" class="d-inline" method="POST"> 
            <input type="hidden" name="id" value="<%=r_login_id%>"><button type="submit" class="btn btn-info mr-3" name="edit" value="Edit"><i class="fas fa-pen"></i></button> 
           </form> 
           <form action="" method="POST" class="d-inline"> 
           <input type="hidden" name="id" value="<%=r_login_id%>"><button type="submit" class="btn btn-secondary mr-3" name="delete" value="Delete"><i class="far fa-trash-alt"></i></button> 
          </form> 
          </td> 
         </tr> 
     <%}
     db.closeConnection();
 %>
</tbody> 
</table> 
</div>
<%
 if(!(delete==null)){
 sql = "DELETE FROM requesterlogin_tb WHERE r_login_id = " + "\"" + r_login_id + "\"";
 db = new dbConnection();
 int i = db.indata(sql);
 if(i==1000){
  out.println("Unable to Delete"); 
 } else {
   response.sendRedirect("requester.jsp");
}
 }
%>
  </div> <!-- End Row -->
  <div class="float-right"><a href="insertreq.jsp" class="btn btn-danger"><i class="fas fa-plus fa-2x"></i></a></div>
 </div> <!-- End Container -->

 
 <!-- JavaScript -->
  <script src="../js/jquery.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/all.min.js"></script>
 </body>
</html>