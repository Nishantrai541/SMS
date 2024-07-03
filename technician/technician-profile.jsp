<!-- technician-Profile.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "technician Profile";
   String PAGE = "technicianProfile";
%>
<%@ include file="includes/header.jsp"%>
<%
 dbConnection db;
 String email = "";
 String name = "";
 String passmsg = "";
 ResultSet rs = null;
 String newname = "";
 String nameupdate = request.getParameter("nameupdate");
 if(session.getAttribute("is_login")==null){
   response.sendRedirect("technician-login.jsp");
 } else { 
  email = (String)session.getAttribute("email");
 }
 String sql = "SELECT * FROM technician_tb WHERE empEmail="+"\"" +email + "\"";
 db = new dbConnection();
 rs = db.data(sql);
 if(rs.next()){
    name = rs.getString("empCity");
 }
 db.closeConnection();
 if(!(nameupdate==null)){
    newname = request.getParameter("tCity");
   if(newname.equals("")){
    passmsg = "<div class=" + "\"alert alert-warning col-sm-6 mt-2" + "\"role=" + "alert" +">Fill All Fields</div>";

   } else {
      db = new dbConnection();
     sql = "UPDATE technician_tb set empCity="+ "\"" + newname +"\""+ " WHERE empEmail=" + "\""+email+ "\"";
     int i = db.indata(sql);
     db.closeConnection();
     if(i==1){
     passmsg = "<div class=" + "\"alert alert-success col-sm-6 mt-2" + "\"role=" + "alert" +">Updated Successfully</div>";
     response.sendRedirect("technician-profile.jsp");
    } else {
     passmsg = "<div class=" + "\"alert alert-danger col-sm-6 mt-2" + "\"role=" + "alert" +">Unable to Update</div>";
    }
   }
  }
%>

<div class="col-sm-6 mt-5">  <!-- Start Profile Area 2nd Column-->
 <form action="" method="POST" class="mx-5">
  <div class="form-group">
   <label for="rEmail">Email</label><input type="email" class="form-control" name="rEmail" id="rEmail"
   value="<%=email%>"readonly>
  </div>
  <div class="form-group">
   <label for="tCity">City
      <i class="fas fa-user"></i> <label for="empcity" class="font-weight-bold pl-2"></label></br><select name="tCity" id="empcity" style="width:160px">  
    <option value="Delhi">Delhi</option>
    <option value="Gurgaon">Gurgaon</option>  
    <option value="Noida">Noida</option>  
    <option value="Mumbai">Mumbai</option>  
    <option value="Banglore">Banglore</option>  
   value="<%=name%>"></select>
  </div>
  <button type="submit" class="btn btn-danger" name="nameupdate">Update</button>
  <%if(!(passmsg.equals(""))){out.println(passmsg);}%>
 </form>
</div> <!-- End Profile Area 2nd Column-->

<%@ include file="includes/footer.jsp"%>