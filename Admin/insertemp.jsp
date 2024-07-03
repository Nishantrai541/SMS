<!-- insertemp.jsp -->
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
String msg = "";
String empsubmit = request.getParameter("empsubmit");
String empName = request.getParameter("empName");
String empCity = request.getParameter("empCity");
String empMobile = request.getParameter("empMobile");
String empEmail = request.getParameter("empEmail");
if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}

 if(!(empsubmit == null)){

  if((empName.equals("")) || (empCity.equals("")) || (empMobile.equals("")) || (empEmail.equals(""))){
    msg = "<div class='alert alert-warning col-sm-6 ml-5 mt-2' role='alert'> Fill All Fileds </div>";
  } else {
   sql = "INSERT INTO technician_tb (empName, empCity, empMobile, empEmail) VALUES ('"+empName+"','"+empCity+"','"+empMobile+"','"+empEmail+"')";
    db = new dbConnection();
    int i = db.indata(sql);
    db.closeConnection();
    if(i==1000){
      msg = "<div class='alert alert-danger col-sm-6 mt-2' role='alert'> Unable to Add </div>";
    } else {
     msg = "<div class='alert alert-success col-sm-6 mt-2' role='alert'> Added Successfully </div>";

    }
  }
  }
 %>
<!-- Start 2nd Column -->
<div class="col-sm-6 mt-5  mx-3 jumbotron">
  <h3 class="text-center">Add New Technician</h3>
  <form action="" method="POST">
    <div class="form-group">
      <label for="empName">Name</label>
      <input type="text" class="form-control" id="empName" name="empName">
    </div>
    <div class="form-group">
      <label for="empCity">City</label><select class="form-control" id="empCity" name="empCity" style="width:160px">  
    <option value="Delhi">Delhi</option>
    <option value="Gurgaon">Gurgaon</option>  
    <option value="Noida">Noida</option>  
    <option value="Mumbai">Mumbai</option>  
    <option value="Banglore">Banglore</option>  
</select>
     <!... <input type="text" class="form-control" id="empCity" name="empCity">
    </div>
    <div class="form-group">
      <label for="empMobile">Mobile</label>
      <input type="text" class="form-control" id="empMobile" name="empMobile" onkeypress="isInputNumber(event)">
    </div>
    <div class="form-group">
      <label for="empEmail">Email</label>
      <input type="email" class="form-control" id="empEmail" name="empEmail">
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-danger" id="empsubmit" name="empsubmit">Submit</button>
      <a href="technician.php" class="btn btn-secondary">Close</a>
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