<!-- technician.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Technician";
   String PAGE = "technician";
%>
<%@ include file="includes/header.jsp"%>

<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
String delete = request.getParameter("delete");
String id = request.getParameter("id");
if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}
%>
<!-- Start 2nd Column -->
<div class="col-sm-9 col-md-10 mt-5 text-center">
 <p class="bg-dark text-white p-2">List of Technician</p>
 <table class="table">
   <thead>
    <tr>
     <th scope="col">Emp ID</th>
     <th scope="col">Name</th>
     <th scope="col">City</th>
     <th scope="col">Mobile</th>
	 <th scope="col">Emp Type</th>
     <th scope="col">Email</th>
     <th scope="col">Action</th>
    </tr>
   </thead>
   <tbody>
 <%
  sql = "SELECT * FROM technician_tb"; 
   db = new dbConnection();
   rs = db.data(sql);
   while(rs.next()){
      String empid = rs.getString("empid");
      String empName = rs.getString("empName");
      String empCity = rs.getString("empCity");
      String empMobile = rs.getString("empMobile");
      String empEmail = rs.getString("empEmail");
	  String empType = rs.getString("empType");
 %>
   
   <tr>
      <td><%=empid%></td>
      <td><%=empName%></td>
      <td><%=empCity%></td>
      <td><%=empMobile%></td>
	  <td><%=empType%></td>
      <td><%=empEmail%></td>
      <td>
         <form action="editemp.jsp" class="d-inline" method="POST">
         <input type="hidden" name="id" value="<%=empid%>"><button type="submit" class="btn btn-info mr-3" name="edit" value="Edit"><i class="fas fa-pen"></i></button>
         </form>
         <form action="" method="POST" class="d-inline">
         <input type="hidden" name="id" value="<%=empid%>"><button type="submit" class="btn btn-secondary mr-3" name="delete" value="Delete"><i class="far fa-trash-alt"></i></button>
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
 if(!(delete == null)){
 sql = "DELETE FROM technician_tb WHERE empid = " + "\"" + id + "\"";
 db = new dbConnection();
 int i = db.indata(sql);
 db.closeConnection();
 if(i == 1000){
   out.println("Unable to Delete");
 } else {
   response.sendRedirect("technician.jsp");
 }
 }
%>
  </div> <!-- End Row -->
  <div class="float-right"><a href="insertemp.jsp" class="btn btn-danger"><i class="fas fa-plus fa-2x"></i></a></div>
 </div> <!-- End Container -->

 <!-- JavaScript -->
  <script src="../js/jquery.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/all.min.js"></script>
 </body>
</html>