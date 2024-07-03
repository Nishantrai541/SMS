<!-- editproduct.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Update Product";
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
String pupdate = request.getParameter("pupdate");
String msg = "";
String pid = request.getParameter("id");
String pname = "";
String pdop = "";
String pava = "";
String ptotal = "";
String poriginalcost = "";
String psellingcost = "";
String edit = request.getParameter("edit");
if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}
if(!(pupdate == null)){
  pid = request.getParameter("pid");
  pname = request.getParameter("pname");
  pdop = request.getParameter("pdop");
  pava = request.getParameter("pava");
  ptotal = request.getParameter("ptotal");
  poriginalcost = request.getParameter("poriginalcost");
  psellingcost = request.getParameter("psellingcost");
  if((pname.equals("")) || (pdop.equals("")) || (pava.equals("")) || (ptotal.equals("")) || (poriginalcost.equals("")) || (psellingcost.equals(""))){
    msg = "<div class='alert alert-warning col-sm-6 mt-2' role='alert'> Fill All Fileds </div>";
   } else {
     sql = "UPDATE assets_tb SET pname = " + "\"" + pname + "\"," + "pdop = " + "\"" + pdop + "\"," + "pava = "+ "\"" + pava + "\"," + "ptotal = " + "\"" + ptotal + "\"," + "poriginalcost = " + "\"" + poriginalcost + "\"," + "psellingcost = " + "\"" + psellingcost + "\"" + " WHERE pid = " + "\"" +pid + "\"";
     db = new dbConnection();
     int i = db.indata(sql);
     db.closeConnection();
     if(i == 1000){
      msg = "<div class='alert alert-danger col-sm-6 mt-2' role='alert'> Unable to Update </div>";
     } else {
      msg = "<div class='alert alert-success col-sm-6 mt-2' role='alert'> Updated Successfully </div>";
     }
   }
}
%>

<!-- Start 2nd Column -->
<div class="col-sm-6 mt-5 mx-3 jumbotron">
  <h3 class="text-center">Update Product Details</h3>
  <%
   if(!(edit==null)){
   sql = "SELECT * FROM assets_tb WHERE pid = " + "\"" + pid + "\"";
   db = new dbConnection();
   rs = db.data(sql);
     if(rs.next()){
     pname = rs.getString("pname");
     pdop = rs.getString("pdop");
     pava = rs.getString("pava");
     ptotal = rs.getString("ptotal");
     poriginalcost = rs.getString("poriginalcost");
     psellingcost = rs.getString("psellingcost");
     db.closeConnection();
   }
  }
  %>
  <form action="" method="POST">
    <div class="form-group">
      <label for="pid">Product ID</label>
      <input type="text" class="form-control" id="pid" name="pid" value="<%=pid%>" readonly>
    </div>
    <div class="form-group">
      <label for="pname">Product Name</label>
      <input type="text" class="form-control" id="pname" name="pname" value="<%=pname%>">
    </div>
    <div class="form-group">
      <label for="pdop">Date of Purchase</label>
      <input type="date" class="form-control" id="pdop" name="pdop" value="<%=pdop%>">
    </div>
    <div class="form-group">
      <label for="pava">Available</label>
      <input type="text" class="form-control" id="pava" name="pava" onkeypress="isInputNumber(event)" value="<%=pava%>">
    </div>
    <div class="form-group">
      <label for="ptotal">Total</label>
      <input type="text" class="form-control" id="ptotal" name="ptotal" onkeypress="isInputNumber(event)" value="<%=ptotal%>">
    </div>
    <div class="form-group">
      <label for="poriginalcost">Original Cost Each</label>
      <input type="text" class="form-control" id="poriginalcost" name="poriginalcost" onkeypress="isInputNumber(event)" value="<%=poriginalcost%>">
    </div>
    <div class="form-group">
      <label for="psellingcost">Selling Cost Each</label>
      <input type="text" class="form-control" id="psellingcost" name="psellingcost" onkeypress="isInputNumber(event)" value="<%=psellingcost%>">
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-danger" id="pupdate" name="pupdate">Update</button>
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