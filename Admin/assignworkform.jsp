<!-- assignworkform.jsp -->
<%
String view = request.getParameter("view");
String close = request.getParameter("close");
String id = request.getParameter("id");
String assign = request.getParameter("assign");
String msg = "";
String rid = "";
String rinfo = "";
String rdesc = "";
String rname = "";
String radd1 = "";
String radd2 = "";
String rcity = "";
String rzip = "";
String remail = "";
String rmobile = "";
String rassigntech = "";
String rdate = "";
if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}
 if(!(view == null)){
  sql = "SELECT * FROM submitrequest_tb WHERE request_id = " + "\"" + id + "\"";
  db = new dbConnection();
  rs = db.data(sql);
  if(rs.next()){
    rid = rs.getString("request_id");
    rinfo = rs.getString("request_info");
    rdesc = rs.getString("request_desc");
    rname = rs.getString("requester_name");
    radd1 = rs.getString("requester_add1");
    radd2 = rs.getString("requester_add1");
    rcity = rs.getString("requester_city");
    rzip = rs.getString("requester_zip");
    remail = rs.getString("requester_email");
    rmobile = rs.getString("requester_mobile");
    rdate = rs.getString("request_date");
  }
  db.closeConnection();
 }
 if(!(close == null)){
  sql = "DELETE FROM submitrequest_tb WHERE request_id  = " + "\"" + id + "\"";
  db = new dbConnection();
  int i = db.indata(sql);
  if(i==1000){
   del = "<div class='alert alert-danger col-sm-6 mt-2'>Unable to Delete</div>";
  } else {
    response.sendRedirect("request.jsp");

  }
  db.closeConnection();
 }
 if(!(assign == null)){
  rid = request.getParameter("request_id");
  rinfo = request.getParameter("request_info");
  rdesc = request.getParameter("requestdesc");
  rname = request.getParameter("requestername");
  radd1 = request.getParameter("address1");
  radd2 = request.getParameter("address2");
  rcity = request.getParameter("requestercity");
  rzip = request.getParameter("requesterzip");
  remail = request.getParameter("requesteremail");
  rmobile = request.getParameter("requestermobile");
  rassigntech = request.getParameter("assigntech");
  rdate = request.getParameter("inputdate");

  if((rid.equals("")) || (rinfo.equals("")) || (rinfo.equals("")) || (rdesc.equals("")) || (radd1.equals("")) || (radd2.equals("")) || (rcity.equals("")) || (rzip.equals("")) || (rzip.equals("")) || (rmobile.equals("")) || (rassigntech.equals("")) || (rdate.equals(""))){
   msg = "<div class='alert alert-warning col-sm-6 ml-5 mt-2'>Fill All Fileds</div>";
  } else {
   sql = "INSERT INTO assignwork_tb (request_id, request_info, request_desc, requester_name, requester_add1, requester_add2, requester_city, requester_zip, requester_email, requester_mobile, assign_tech, assign_date) VALUES ('"+rid+"','"+rinfo+"','"+rdesc+"','"+rname+"','"+radd1+"','"+radd2+"','"+rcity+"','"+rzip+"','"+remail+"','"+rmobile+"','"+rassigntech+"','"+rdate+"')";
    db = new dbConnection();
    int i = db.indata(sql);
   if(i==1){
    msg = "<div class='alert alert-success col-sm-6 mt-2'>Work Assigned Successfully</div>";
   } else {
    msg = "<div class='alert alert-danger col-sm-6 mt-2'>Unable to Assign Work</div>";
   }
   db.closeConnection();
  }
 }
 %>

<div class="col-sm-5 mt-5 jumbotron"> <!-- Start Assigned Work 3rd Column-->
 <form action="" method="POST">
   <h5 class="text-center">Assign Work Order Request</h5>
   <div class="form-group">
     <label for="request_id">Request ID</label>
     <input type="text" class="form-control" id="request_id" name="request_id" value="<%if(!(rid.equals(""))){out.println(rid);} %>" readonly>
   </div>
   <div class="form-group">
     <label for="request_info">Request Info</label>
     <input type="text" class="form-control" id="request_info" name="request_info" value="<%if(!(rinfo.equals(""))){out.println(rinfo);} %>">
   </div>
   <div class="form-group">
     <label for="requestdesc">Description</label>
     <input type="text" class="form-control" id="requestdesc" name="requestdesc" value="<%if(!(rdesc.equals(""))){out.println(rdesc);} %>">
   </div>
   <div class="form-group">
     <label for="requestername">Name</label>
     <input type="text" class="form-control" id="requestername" name="requestername" value="<%if(!(rname.equals(""))){out.println(rname);} %>">
   </div>
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="address1">Address Line 1</label>
      <input type="text" class="form-control" id="address1" name="address1" value="<%if(!(radd1.equals(""))){out.println(radd1);} %>">
    </div>
    <div class="form-group col-md-6">
      <label for="address2">Address Line 2</label>
      <input type="text" class="form-control" id="address2" name="address2" value="<%if(!(radd2.equals(""))){out.println(radd2);} %>">
    </div>
   </div>
   <div class="form-row">
    <div class="form-group col-md-4">
      <label for="requestercity">City</label>
      <input type="text" class="form-control" id="requestercity" name="requestercity" value="<%if(!(rcity.equals(""))){out.println(rcity);} %>">
    </div>
   
    <div class="form-group col-md-4">
      <label for="requesterzip">Zip</label>
      <input type="text" class="form-control" id="requesterzip" name="requesterzip" value="<%if(!(rzip.equals(""))){out.println(rzip);} %>" onkeypress="isInputNumber(event)">
    </div>
   </div>
   <div class="form-row">
    <div class="form-group col-md-8">
      <label for="requesteremail">Email</label>
      <input type="email" class="form-control" id="requesteremail" name="requesteremail" value="<%if(!(remail.equals(""))){out.println(remail);} %>">
    </div>
    <div class="form-group col-md-4">
      <label for="requestermobile">Mobile</label>
      <input type="text" class="form-control" id="requestermobile" name="requestermobile" value="<%if(!(rmobile.equals(""))){out.println(rmobile);} %>" onkeypress="isInputNumber(event)">
    </div>
   </div>
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="assigntech">Assign to Technician</label>
      <input type="text" class="form-control" id="assigntech" name="assigntech">
    </div>
    <div class="form-group col-md-6">
      <label for="inputDate">Date</label>
      <input type="date" class="form-control" id="inputDate" name="inputdate">
    </div>
   </div>
   <div class="float-right">
    <button type="submit" class="btn btn-success" name="assign">Assign</button>
    <button type="reset" class="btn btn-secondary">Reset</button>
   </div>
 </form>
 <%if(!(msg.equals(""))){out.println(msg);}%>
</div> <!-- End Assigned Work 3rd Column-->
<script>
  function isInputNumber(evt) {
    var ch = String.fromCharCode(evt.which);
    if (!(/[0-9]/.test(ch))) {
      evt.preventDefault();
    }
  }
</script>