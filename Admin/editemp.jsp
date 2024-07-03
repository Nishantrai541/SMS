<!-- editemp.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Update Technician";
   String PAGE = "technician";
%>
<%@ include file="includes/header.jsp"%>

<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
String empupdate = request.getParameter("empupdate");
String empName = request.getParameter("empName");
String empCity = request.getParameter("empCity");
String empMobile = request.getParameter("empMobile");
String empEmail = request.getParameter("empEmail");
String id = request.getParameter("id");
String edit = request.getParameter("edit");
String msg = "";
if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}

 if(!(empupdate == null)){
  if((empName.equals("")) || (empCity.equals("")) || (empMobile.equals("")) || (empEmail.equals(""))){
   msg = "<div class='alert alert-warning col-sm-6 ml-5 mt-2' role='alert'> Fill All Fileds </div>";
  } else {
    sql = "UPDATE technician_tb SET empName = " + "\"" + empName + "\"," + "empCity = " + "\"" + empCity + "\"," + "empMobile = "+ "\"" + empMobile + "\"," + "empEmail = " + "\"" + empEmail + "\"" + " WHERE empid = " + "\"" + id + "\"";
    db = new dbConnection();
    int i = db.indata(sql);
    db.closeConnection();
    if(i==1000){
      msg = "<div class='alert alert-danger col-sm-6 mt-2' role='alert'> Unable to Update </div>";
      out.println("lan");
    } else {
      msg = "<div class='alert alert-success col-sm-6 mt-2' role='alert'> Updated Successfully </div>";
    }
  }
  }
 %>
 
<div class="col-sm-6 mt-5  mx-3 jumbotron">
  <h3 class="text-center">Update Technician Details</h3>
  <%
  sql = "SELECT * FROM technician_tb WHERE empid = " + "\"" + id + "\"";
  db = new dbConnection();
  rs = db.data(sql);
  if(rs.next()){
    empName = rs.getString("empName");
    empCity = rs.getString("empCity");
    empMobile = rs.getString("empMobile");
    empEmail = rs.getString("empEmail");
  }
  db.closeConnection();
  %>
  <form action="" method="POST">
    <div class="form-group">
      <label for="empId">Emp ID</label>
      <input type="text" class="form-control" id="empId" name="id" value="<%if(!(id.equals(""))){out.println(id);} %>" readonly>
    </div>
    <div class="form-group">
      <label for="empName">Name</label>
      <input type="text" class="form-control" id="empName" name="empName" value="<%if(!(empName.equals(""))){out.println(empName);} %>">
    </div>
    <div class="form-group">
      <label for="empCity">City</label>
      <input type="text" class="form-control" id="empCity" name="empCity" value="<%if(!(empCity.equals(""))){out.println(empCity);} %>">
    </div>
    <div class="form-group">
      <label for="empMobile">Mobile</label>
      <input type="text" class="form-control" id="empMobile" name="empMobile" value="<%if(!(empMobile.equals(""))){out.println(empMobile);} %>"
        onkeypress="isInputNumber(event)">
    </div>
    <div class="form-group">
      <label for="empEmail">Email</label>
      <input type="email" class="form-control" id="empEmail" name="empEmail" value="<%if(!(empEmail.equals(""))){out.println(empEmail);} %>">
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-danger" id="empupdate" name="empupdate">Update</button>
      <a href="technician.jsp" class="btn btn-secondary">Close</a>
    </div>
    <%if(!(msg.equals(""))){out.println(msg);}%>
  </form>
</div>
<!-- Only Number for input fields -->
<script>
  function isInputNumber(evt) {
    var ch = String.fromCharCode(evt.which);
    if (!(/[0-9]/.test(ch))) {
      evt.preventDefault();
    }
  }
</script>
<%@ include file = "includes/footer.jsp" %>