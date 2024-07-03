<!-- assets.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Assets";
   String PAGE = "assets";
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
<!-- Start 2nd Column -->
<div class="col-sm-9 col-md-10 mt-5 text-center">
 <p class="bg-dark text-white p-2">Product/Part Details</p>
 <table class="table">
   <thead>
    <tr>
     <th scope="col">Product ID</th>
     <th scope="col">Name</th>
     <th scope="col">DOP</th>
     <th scope="col">Available</th>
     <th scope="col">Total</th>
     <th scope="col">Original Cost Each</th>
     <th scope="col">Selling Cost Each</th>
     <th scope="col">Action</th>
    </tr>
   </thead>
   <tbody>
 <%
  sql = "SELECT * FROM assets_tb"; 
  db = new dbConnection();
  rs = db.data(sql);
  while(rs.next()){
     int pid = rs.getInt("pid");
     String pname = rs.getString("pname");
     String pdop = rs.getString("pdop");
     String pava = rs.getString("pava");
     String ptotal = rs.getString("ptotal");
     String poriginalcost = rs.getString("poriginalcost");
     String psellingcost = rs.getString("psellingcost");
 %>
      <tr>
       <td><%=pid%></td>
       <td><%=pname%></td>
       <td><%=pdop%></td>
       <td><%=pava%></td>
       <td><%=ptotal%></td>
       <td>INR <%=poriginalcost%></td>
       <td>INR <%=psellingcost%></td>
       <td>
        <form action="editproduct.jsp" class="d-inline" method="POST">
         <input type="hidden" name="id" value="<%=pid%>"><button type="submit" class="btn btn-info mr-3" name="edit" value="Edit"><i class="fas fa-pen"></i></button>
        </form>
        <form action="" method="POST" class="d-inline">
        <input type="hidden" name="id" value="<%=pid%>"><button type="submit" class="btn btn-secondary mr-3" name="delete" value="Delete"><i class="far fa-trash-alt"></i></button>
       </form>
       <form action="sellproduct.jsp" class="d-inline" method="POST">
         <input type="hidden" name="id" value="<%=pid%>"><button type="submit" class="btn btn-warning mr-3" name="issue" value="Issue"><i class="fas fa-handshake"></i></button>
        </form>
       </td>
      </tr>
<%
  }
  db.closeConnection();
 %>
</tbody>
</table>
</div>
<%
 if(!(delete==null)){
 sql = "DELETE FROM assets_tb WHERE pid = " + "\"" + id + "\"";
 db = new dbConnection();
 int i = db.indata(sql);
 db.closeConnection();
 if(i==1000){
   out.println("Unable to Delete");
 } else {
    response.sendRedirect("assets.jsp");
 }
 }
%>
  </div> <!-- End Row -->
  <div class="float-right"><a href="addproduct.jsp" class="btn btn-danger"><i class="fas fa-plus fa-2x"></i></a></div>
 </div> <!-- End Container -->

 <!-- JavaScript -->
  <script src="../js/jquery.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/all.min.js"></script>
 </body>
</html>