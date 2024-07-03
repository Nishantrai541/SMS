<!-- addproduct.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Add New Product";
   String PAGE = "assets";
%>
<%@ include file="includes/header.jsp"%>

<%
int is_adminlogin = (int)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
String msg = "";
String id = request.getParameter("id");
String psubmit = request.getParameter("psubmit");
String pname = "";
String pdop = "";
String pava = "";
String ptotal = "";
String poriginalcost = "";
String psellingcost = "";

if(is_adminlogin == 1){
   aEmail = (String)session.getAttribute("aEmail");
} else {
   response.sendRedirect("login.jsp");
}
if(!(psubmit==null)){
  pname = request.getParameter("pname");
  pdop = request.getParameter("pdop");
  pava = request.getParameter("pava");
  ptotal = request.getParameter("ptotal");
  poriginalcost = request.getParameter("poriginalcost");
  psellingcost = request.getParameter("psellingcost");
 if((pname.equals("")) || (pdop.equals("")) || (pava.equals("")) || (ptotal.equals("")) || (poriginalcost.equals("")) || (psellingcost.equals(""))){
  msg = "<div class='alert alert-warning col-sm-6 ml-5 mt-2' role='alert'> Fill All Fileds </div>";
 } else {
   db = new dbConnection();
   sql = "INSERT INTO assets_tb (pname, pdop, pava, ptotal, poriginalcost, psellingcost) VALUES ('"+pname+"','"+pdop+"','"+pava+"','"+ptotal+"','"+poriginalcost+"','"+psellingcost+"')";
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
<div class="col-sm-6 mt-5 mx-3 jumbotron">
  <h3 class="text-center">Add New Product</h3>
  <form action="" method="POST">
    <div class="form-group">
      <label for="pname">Product Name</label>
      <input type="text" class="form-control" id="pname" name="pname">
    </div>
    <div class="form-group">
      <label for="pdop">Date of Purchase</label>
      <input type="date" class="form-control" id="pdop" name="pdop">
    </div>
    <div class="form-group">
      <label for="pava">Available</label>
      <input type="text" class="form-control" id="pava" name="pava" onkeypress="isInputNumber(event)">
    </div>
    <div class="form-group">
      <label for="ptotal">Total</label>
      <input type="text" class="form-control" id="ptotal" name="ptotal" onkeypress="isInputNumber(event)">
    </div>
    <div class="form-group">
      <label for="poriginalcost">Original Cost Each</label>
      <input type="text" class="form-control" id="poriginalcost" name="poriginalcost" onkeypress="isInputNumber(event)">
    </div>
    <div class="form-group">
      <label for="psellingcost">Selling Cost Each</label>
      <input type="text" class="form-control" id="psellingcost" name="psellingcost" onkeypress="isInputNumber(event)">
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-danger" id="psubmit" name="psubmit">Submit</button>
      <a href="assets.jsp" class="btn btn-secondary">Close</a>
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