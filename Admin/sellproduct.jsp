<!-- sellproduct.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Sell Product";
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
String psubmit = request.getParameter("psubmit");
String msg = "";

String pid = request.getParameter("id");
String cname = "";
String cadd = "";
String pname = "";
String pquantity = "";
String psellingcost = "";
String totalcost = "";
String selldate = "";
String pava = "";
int genid = 0;
if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}

if(!(psubmit == null)){
  pava = request.getParameter("pava");
  pquantity = request.getParameter("pquantity");
  int temp = Integer.parseInt(pava) - Integer.parseInt(pquantity);
  pava = String.valueOf(temp);
  cname = request.getParameter("cname");
  cadd = request.getParameter("cadd");
  pname = request.getParameter("pname");
  pquantity = request.getParameter("pquantity");
  psellingcost = request.getParameter("psellingcost");
  totalcost = request.getParameter("totalcost");
  selldate = request.getParameter("selldate");

 if((cname.equals("")) || (cadd.equals("")) || (pname.equals("")) || (pquantity.equals("")) || (psellingcost.equals("")) || (totalcost.equals("")) || (selldate.equals(""))){
  msg = "<div class='alert alert-warning col-sm-6 ml-5 mt-2' role='alert'> Fill All Fileds </div>";
 } else {
  sql = "INSERT INTO customer_tb (custname, custadd, cpname, cpquantity, cpeach, cptotal, cpdate) VALUES ('"+cname+"','"+cadd+"','"+pname+"','"+pquantity+"','"+psellingcost+"','"+totalcost+"','"+selldate+"')";
  db = new dbConnection();
  int i = db.indata(sql);
  db.closeConnection();
  if(!(i==1000)){
    db = new dbConnection();
    genid = db.get_id("SELECT count(*) as rowcount FROM customer_tb");
    session.setAttribute("myid", genid);
    db.closeConnection();
    db = new dbConnection();
    int j = db.indata("UPDATE assets_tb SET pava = " + "\"" + pava + "\"" + " WHERE pid = " + "\"" + pid + "\"");
    db.closeConnection();
    response.sendRedirect("productsellsuccess.jsp");
  }
 }
} 
%>

<!-- Start 2nd Column -->
<div class="col-sm-6 mt-5 mx-3 jumbotron">
  <h3 class="text-center">Customer Bill</h3>
  <%
   if(!(request.getParameter("issue")==null)){
   sql = "SELECT * FROM assets_tb WHERE pid =  " + "\"" + pid + "\"";
   db = new dbConnection();
   rs = db.data(sql);
   rs.next();
   pname = rs.getString("pname");
   pava = rs.getString("pava");
   psellingcost = rs.getString("psellingcost");
    db.closeConnection();
   }
  %>
  <form action="" method="POST">
    <div class="form-group">
      <label for="pid">Product ID</label>
      <input type="text" class="form-control" id="pid" name="id" value="<%=pid%>" readonly>
    </div>
    <div class="form-group">
      <label for="cname">Customer Name</label>
      <input type="text" class="form-control" id="cname" name="cname">
    </div>
    <div class="form-group">
      <label for="cadd">Customer Address</label>
      <input type="text" class="form-control" id="cadd" name="cadd">
    </div>
    <div class="form-group">
      <label for="pname">Product Name</label>
      <input type="text" class="form-control" id="pname" name="pname" value="<%=pname%>">
    </div>
    <div class="form-group">
      <label for="pava">Available</label>
      <input type="text" class="form-control" id="pava" name="pava" onkeypress="isInputNumber(event)" value="<%=pava%>" readonly>
    </div>
    <div class="form-group">
      <label for="pquantity">Quantity</label>
      <input type="text" class="form-control" id="pquantity" name="pquantity" onkeypress="isInputNumber(event)">
    </div>
    <div class="form-group">
      <label for="psellingcost">Price Each</label>
      <input type="text" class="form-control" id="psellingcost" name="psellingcost" onkeypress="isInputNumber(event)" value="<%=psellingcost%>">
    </div>
    <div class="form-group">
      <label for="totalcost">Total Price</label>
      <input type="text" class="form-control" id="totalcost" name="totalcost" onkeypress="isInputNumber(event)">
    </div>
    <div class="form-group col-md-4">
      <label for="inputDate">Date</label>
      <input type="date" class="form-control" id="inputDate" name="selldate">
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-danger" id="psubmit" name="psubmit">Submit</button>
      <a href="assets.php" class="btn btn-secondary">Close</a>
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