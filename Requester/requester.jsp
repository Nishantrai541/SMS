<!-- requester.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Status";
   String PAGE = "CheckStatus";
%>
<%@ include file="includes/header.jsp"%>

<%
dbConnection db;
 String email = "";
 String name = "";
 String passmsg = "";
 ResultSet rs = null;
 String newname = "";
 String msg="";
 String sql;
 if(session.getAttribute("is_login")==null){
   response.sendRedirect("RequesterLogin.jsp");
 } else { 
  email = (String)session.getAttribute("email");
 }
%>

<!-- Start 2nd Column  -->
<div class="col-sm-6 mt-5 mx-3">
 <form action="" method="post" class="form-inline">
  <div class="form-group mr-3">
   <label for="checkid">Enter Request ID: </label>
   <input type="text" class="form-control" name="checkid" id="checkid" onkeypress="isInputNumber(event)">
  </div>
  <button type="submit" class="btn btn-danger">Search</button>
 </form>
 <%

  String checkid = request.getParameter("checkid");
  if(checkid==null){
    msg = "<div class=" + "\"alert alert-warning col-sm-6 mt-2" + "\"role=" + "alert" +">Enter check id</div>";
   } else {
    sql = "SELECT * FROM assignwork_tb WHERE request_id =" + "\""+ checkid + "\"";
    db = new dbConnection();
    rs = db.data(sql);
    if(rs.next()){ 
      String request_id = rs.getString("request_id");
      String request_info = rs.getString("request_info");
      String request_desc = rs.getString("request_desc");
      String requester_name = rs.getString("requester_name");
      String requester_add1 = rs.getString("requester_add1");
      String requester_add2 = rs.getString("requester_add2");
      String requester_city = rs.getString("requester_city");
      String requester_state = rs.getString("requester_state");
      String requester_zip = rs.getString("requester_zip");
      String requester_email = rs.getString("requester_email");
      String requester_mobile = rs.getString("requester_mobile");
      String assign_date = rs.getString("assign_date");
      String assign_tech = rs.getString("assign_tech");
    %>

    <h3 class="text-center mt-5">Assigned Work Details</h3>
    <table class="table table-bordered">
     <tbody>
      <tr>
       <td>Request ID</td>
       <td><%if(!(request_id.equals(""))){out.println(request_id);} %></td>
      </tr>
      <tr>
       <td>Request Info</td>
       <td><%if(!(request_info.equals(""))){out.println(request_info);} %></td>
      </tr>
      <tr>
       <td>Request Description</td>
       <td><%if(!(request_desc.equals(""))){out.println(request_desc);} %></td>
      </tr>
      <tr>
       <td>Name</td>
       <td>
         <%if(!(requester_name.equals(""))){out.println(requester_name);} %>
       </td>
      </tr>
      <tr>
       <td>Address Line 1</td>
       <td>
         <%if(!(requester_add1.equals(""))){out.println(requester_add1);} %>
       </td>
      </tr>
      <tr>
       <td>Address Line 2</td>
       <td>
        <%if(!(requester_add2.equals(""))){out.println(requester_add2);} %>
       </td>
      </tr>
      <tr>
       <td>City</td>
       <td>
        <%if(!(requester_city.equals(""))){out.println(requester_city);} %>
       </td>
      </tr>
      <tr>
       <td>State</td>
       <td>
        <%if(!(requester_state.equals(""))){out.println(requester_state);} %>
       </td>
      </tr>
      <tr>
       <td>Pin Code</td>
       <td>
        <%if(!(requester_zip.equals(""))){out.println(requester_zip);} %>
       </td>
      </tr>
      <tr>
       <td>Email</td>
       <td>
        <%if(!(requester_email.equals(""))){out.println(requester_email);} %>
       </td>
      </tr>
      <tr>
       <td>Mobile</td>
       <td>
        <%if(!(requester_mobile.equals(""))){out.println(requester_mobile);} %>
       </td>
      </tr>
      <tr>
       <td>Assigned Date</td>
       <td>
        <%if(!(assign_date.equals(""))){out.println(assign_date);} %>
       </td>
      </tr>
      <tr>
       <td>Technician Name</td>
       <td><%if(!(assign_tech.equals(""))){out.println(assign_tech);} %></td>
      </tr>
      <tr>
       <td>Customer Sign</td>
       <td></td>
      </tr>
      <tr>
       <td>Technician Sign</td>
       <td></td>
      </tr>
     </tbody>
    </table>
    <div class="text-center">
     <form action="" class="mb-3 d-print-none">
      <input class="btn btn-danger" type="submit" value="Print" onClick="window.print()">
      <input class="btn btn-secondary" type="submit" value="Close">
     </form>
    </div>
    <%} else {
     out.println("<div class='alert alert-info mt-4'>Your Request is Still Pending</div>");
    }
    db.closeConnection();
   }
 %>
 <%if(!(msg.equals(""))){out.println(msg);}%>
</div>
<script>
  function isInputNumber(evt) {
    var ch = String.fromCharCode(evt.which);
    if (!(/[0-9]/.test(ch))) {
      evt.preventDefault();
    }
  }
</script>
<%@ include file="includes/footer.jsp"%><%@page import="SCMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<%
    String msg = "";
    if(request.getMethod().equals("POST")) {
        ResultSet rs = null;
        String email = request.getParameter("rEmail");
        String password = request.getParameter("rPassword");
        dbConnection db = new dbConnection();
        String sql = "SELECT * FROM requesterlogin_tb WHERE r_email=" + "\"" + email + "\"" + " AND r_password=" + "\"" + password + "\"";
        rs = db.data(sql);
        if(rs.next()){
            session.setAttribute("email", email);
            session.setAttribute("is_login", 1);
            response.sendRedirect("RequesterProfile.jsp");
            db.closeConnection();
        } else {
            msg = "<div class=" + "\"alert alert-warning mt-2" + "\"" + ">Enter Valid Email and Password</div>";
        }


    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
 <!-- Bootstrap CSS -->
 <link rel="stylesheet" href="../css/bootstrap.min.css">

 <!-- Font Awesome CSS -->
 <link rel="stylesheet" href="../css/all.min.css">

 <style>
  .custom-margin {
   margin-top: 8vh;
  }
 </style>

 <title>Login</title>
</head>
<body>
 <div class="mb-3 mt-5 text-center" style="font-size: 30px;">
  <i class="fas fa-stethoscope"></i>
  <span>Online Service Management System</span>
 </div>
 <p class="text-center" style="font-size:20px;"><i class="fas fa-user-secret text-danger"></i>Requester Area (Demo)</p>
 <div class="container-fluid">
  <div class="row justify-content-center custom-margin">
   <div class="col-sm-6 col-md-4">
    <form action="" class="shadow-lg p-4" method="POST">
     <div class="form-group">
      <i class="fas fa-user"></i><label for="email" class="font-weight-bold pl-2">Email</label><input type="email" class="form-control" placeholder="Email" name="rEmail">
      <small class="form-text">We'll never share your email with anyone else.</small>
     </div>
     <div class="form-group">
      <i class="fas fa-key"></i><label for="pass" class="font-weight-bold pl-2">Password</label><input type="password" class="form-control" placeholder="Password" name="rPassword">
     </div>
     <button type="submit" class="btn btn-outline-danger mt-3 font-weight-bold btn-block shadow-sm">Login</button>
     <%if(!(msg.equals(""))){out.println(msg);}%>

    </form>
    <div class="text-center"><a href="../index.jsp" class="btn btn-info mt-3 font-weight-bold shadow-sm">Back to Home</a></div>
   </div>
  </div>
 </div>

 <!-- JavaScript Files -->
 <script src="../js/jquery.min.js"></script>
 <script src="../js/popper.min.js"></script>
 <script src="../js/bootstrap.min.js"></script>
 <script src="../js/all.min.js"></script>
</body>
</html><%@page import="SCMS.dbConnection"%>
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

<%@ include file="includes/footer.jsp"%><%@page import="SCMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Change Password";
   String PAGE = "Requesterchangepass";
%>
<%@ include file="includes/header.jsp"%>
<%
String rEmail = "";
String passupdate = request.getParameter("passupdate");
String newpassword = request.getParameter("rPassword");
String passmsg = "";
dbConnection db;
String sql = "";
if(session.getAttribute("is_login")==null){
  response.sendRedirect("RequesterLogin.jsp");
} else {
    rEmail = (String)session.getAttribute("email");
}

if(!(passupdate==null)){
 if(newpassword.equals("")){
  passmsg = "<div class=" + "\"alert alert-warning col-sm-6 mt-2" + "\"role=" + "alert" +">Fill All Fields</div>";

 } else {
    db = new dbConnection();
    sql = "UPDATE requesterlogin_tb set r_password="+ "\"" + newpassword +"\""+ " WHERE r_email=" + "\""+rEmail+ "\"";
    int i = db.indata(sql);
    db.closeConnection();
    if(i==1){
    passmsg = "<div class=" + "\"alert alert-success col-sm-6 mt-2" + "\"role=" + "alert" +">Updated Successfully</div>";
  } else {
    passmsg = "<div class=" + "\"alert alert-danger col-sm-6 mt-2" + "\"role=" + "alert" +">Unable to Update</div>";
  }
}
}

%>
<div class="col-sm-9 col-md-10"> <!-- Start User Change Password Form 2nd Column -->
 <form class="mt-5 mx-5" action="" method="POST">
  <div class="form-group">
   <label for="inputEmail">Email</label>
   <input type="email" class="form-control" id="inputEmail" value="<%=rEmail%>" readonly>
  </div>
  <div class="form-group">
   <label for="inputnewpassword">New Password</label>
   <input type="password" class="form-control" id="inputnewpassword" placeholder="New Password" name="rPassword">
  </div>
  <button type="submit" class="btn btn-danger mr-4 mt-4" name="passupdate">Update</button>
  <button type="reset" class="btn btn-secondary mt-4">Reset</button>
  <%if(!(passmsg.equals(""))){out.println(passmsg);}%>
 </form>
</div> <!-- End User Change Password Form 2nd Column -->

<%@ include file="includes/footer.jsp"%><%@page import="SCMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "SubmitRequest";
   String PAGE = "SubmitRequest";
%>
<%@ include file="includes/header.jsp"%>
<%
dbConnection db;
 String email = "";
 String name = "";
 String passmsg = "";
 ResultSet rs = null;
 String requestinfo = request.getParameter("requestinfo");
 String requestdesc = request.getParameter("requestdesc");
 String requestername = request.getParameter("requestername");
 String requesteradd1 = request.getParameter("requesteradd1");
 String requesteradd2 = request.getParameter("requesteradd2");
 String requestercity = request.getParameter("requestercity");
 String requesterstate = request.getParameter("requesterstate");
 String requesterzip = request.getParameter("requesterzip");
 String requesteremail = request.getParameter("requesteremail");

 String requestermobile = request.getParameter("requestermobile");
 String requestdate = request.getParameter("requestdate");
 String msg = "";
 String sql = "";
 int genid;
 if(session.getAttribute("is_login")==null){
   response.sendRedirect("RequesterLogin.jsp");
 } else { 
  email = (String)session.getAttribute("email");
 }

if(!(request.getParameter("submitrequest")==null)){
 // Checking for empty fields 
 if((requestinfo.equals("")) || (requestdesc.equals("")) || (requestername.equals("")) || (requesteradd1.equals("")) || (requesteradd2.equals("")) || (requestercity.equals("")) || (requesterstate.equals("")) || (requesterzip.equals("")) || (requesteremail.equals("")) || (requestermobile.equals("")) || (requestdate.equals(""))){
  msg = "<div class=" + "\"alert alert-warning col-sm-6 mt-2" + "\"role=" + "alert" +">Fill All Fields</div>";
 
} else {
  sql = "INSERT INTO submitrequest_tb(request_info, request_desc, requester_name, requester_add1, requester_add2, requester_city, requester_state, requester_zip, requester_email, requester_mobile, request_date) VALUES('"+requestinfo+"','"+requestdesc+"','"+requestername+"','"+requesteradd1+"','"+requesteradd2+"','"+requestercity+"','"+requesterstate+"','"+requesterzip+"','"+requesteremail+"','"+requestermobile+"','"+requestdate+"')";
  db = new dbConnection();
  int i = db.indata(sql);
  db.closeConnection();
  if(i == 1){
    db = new dbConnection();
    genid = db.get_id("SELECT count(*) AS rowcount from submitrequest_tb");
    msg = "<div class=" + "\"alert alert-success col-sm-6 mt-2" + "\"role=" + "alert" +">Request Submitted Sucessfully</div>";
    session.setAttribute("myid", genid);
    db.closeConnection();
    response.sendRedirect("submitrequestsuccess.jsp");
  } else {
    msg = "<div class=" + "\"alert alert-danger col-sm-6 ml-5 mt-2" + "\"role=" + "alert" +">Unable to Submit Your Request</div>";
  }
 }
}

%>

<div class="col-sm-9 col-md-10 mt-5"> <!-- Start Service Request Form 2nd Column -->
 <form class="mx-5" action="" method="POST">
  <div class="form-group">
   <label for="inputRequestInfo">Request Info</label>
   <input type="text" class="form-control" id="inputRequestInfo" placeholder="Request Info" name="requestinfo">
  </div>
  <div class="form-group">
   <label for="inputRequestDescription">Description</label>
   <input type="text" class="form-control" id="inputRequestDescription" placeholder="Write Description" name="requestdesc">
  </div>
  <div class="form-group">
   <label for="inputName">Name</label>
   <input type="text" class="form-control" id="inputName" placeholder="Rahul" name="requestername">
  </div>
  <div class="form-row">
   <div class="form-group col-md-6">
     <label for="inputAddress">Address Line 1</label>
     <input type="text" class="form-control" id="inputAddress" placeholder="House No. 123" name="requesteradd1">
   </div>
   <div class="form-group col-md-6">
    <label for="inputAddress2">Address Line 2</label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="Railway Colony" name="requesteradd2">
   </div>
  </div>
  <div class="form-row">
   <div class="form-group col-md-6">
    <label for="inputCity">City</label>
    <input type="text" class="form-control" id="inputCity" name="requestercity">
   </div>
   <div class="form-group col-md-4">
    <label for="inputState">State</label>
    <input type="text" class="form-control" id="inputState" name="requesterstate">
   </div>
   <div class="form-group col-md-2">
    <label for="inputZip">Zip</label>
    <input type="text" class="form-control" id="inputZip" name="requesterzip" onkeypress="isInputNumber(event)">
   </div>
  </div>
  <div class="form-row">
   <div class="form-group col-md-6">
    <label for="inputEmail">Email</label>
    <input type="email" class="form-control" id="inputEmail" name="requesteremail" value="<%=email%>">
   </div>
   <div class="form-group col-md-2">
    <label for="inputMobile">Mobile</label>
    <input type="text" class="form-control" id="inputMobile" name="requestermobile" onkeypress="isInputNumber(event)">
   </div>
   <div class="form-group col-md-2">
    <label for="inputDate">Date</label>
    <input type="date" class="form-control" id="inputDate" name="requestdate">
   </div>
  </div>
  <button type="submit" class="btn btn-danger" name="submitrequest">Submit</button>
  <button type="reset" class="btn btn-secondary">Reset</button>
 </form>
 <%if(!(msg.equals(""))){out.println(msg);}%>
</div> <!-- End Service Request Form 2nd Column -->

<!-- Only Number for Input Fields -->
<script>
  function isInputNumber(evt) {
    var ch = String.fromCharCode(evt.which);
    if (!(/[0-9]/.test(ch))) {
      evt.preventDefault();
    }
  }
</script>


<%@ include file="includes/footer.jsp"%>

<%@page import="SCMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% String TITLE = "Success";String PAGE = "Success";%>
<%@ include file="includes/header.jsp"%>
<%
 dbConnection db;
 String email = "";
 String name = "";
 String passmsg = "";
 ResultSet rs = null;
 String msg = "";
 String sql = "";
 int genid = (int)session.getAttribute("myid");
 if(session.getAttribute("is_login")==null){
   response.sendRedirect("RequesterLogin.jsp");
 } else { 
  email = (String)session.getAttribute("email");
 }
sql = "SELECT * FROM submitrequest_tb WHERE request_id=" + "\"" + genid + "\"";
db = new dbConnection();
rs = db.data(sql);
if(rs.next()){
  %>
 <div class='ml-5 mt-5'>
 <table class='table'>
  <tbody>
   <tr>
     <th>Request ID</th>
     <td><%=rs.getString("request_id")%></td>
   </tr>
   <tr>
     <th>Name</th>
     <td><%=rs.getString("requester_name")%></td>
   </tr>
   <tr>
   <th>Email ID</th>
   <td><%=rs.getString("requester_email")%></td>
  </tr>
   <tr>
    <th>Request Info</th>
    <td><%=rs.getString("request_info")%></td>
   </tr>
   <tr>
    <th>Request Description</th>
    <td><%=rs.getString("request_desc")%></td>
   </tr>

   <tr>
    <td><form class='d-print-none'><input class='btn btn-danger' type='submit' value='Print' onClick='window.print()'></form></td>
  </tr>
  </tbody>
 </table> </div>
<%} else {
 out.println("Failed");
}
db.closeConnection();
%>
<%@ include file="includes/footer.jsp"%>