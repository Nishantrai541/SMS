<!-- RequesterProfile.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Requester Profile";
   String PAGE = "RequesterProfile";
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
   response.sendRedirect("RequesterLogin.jsp");
 } else { 
  email = (String)session.getAttribute("email");
 }
 String sql = "SELECT * FROM requesterlogin_tb WHERE r_email="+"\"" +email + "\"";
 db = new dbConnection();
 rs = db.data(sql);
 if(rs.next()){
    name = rs.getString("r_name");
 }
 db.closeConnection();
 if(!(nameupdate==null)){
    newname = request.getParameter("rName");
   if(newname.equals("")){
    passmsg = "<div class=" + "\"alert alert-warning col-sm-6 mt-2" + "\"role=" + "alert" +">Fill All Fields</div>";

   } else {
      db = new dbConnection();
     sql = "UPDATE requesterlogin_tb set r_name="+ "\"" + newname +"\""+ " WHERE r_email=" + "\""+email+ "\"";
     int i = db.indata(sql);
     db.closeConnection();
     if(i==1){
     passmsg = "<div class=" + "\"alert alert-success col-sm-6 mt-2" + "\"role=" + "alert" +">Updated Successfully</div>";
     response.sendRedirect("RequesterProfile.jsp");
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
   <label for="rName">Name</label><input type="text" class="form-control" name="rName" id="rName" 
   value="<%=name%>">
  </div>
  <button type="submit" class="btn btn-danger" name="nameupdate">Update</button>
  <%if(!(passmsg.equals(""))){out.println(passmsg);}%>
 </form>
</div> <!-- End Profile Area 2nd Column-->

<%@ include file="includes/footer.jsp"%>