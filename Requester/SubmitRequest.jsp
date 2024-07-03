<!-- SubmitRequest.jsp -->
<%@page import="SMS.dbConnection"%>
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
 if((requestinfo.equals("")) || (requestdesc.equals("")) || (requestername.equals("")) || (requesteradd1.equals("")) || (requesteradd2.equals("")) || (requestercity.equals(""))|| (requesterzip.equals("")) || (requesteremail.equals("")) || (requestermobile.equals("")) || (requestdate.equals(""))){
  msg = "<div class=" + "\"alert alert-warning col-sm-6 mt-2" + "\"role=" + "alert" +">Fill All Fields</div>";
 
} else {
  sql = "INSERT INTO submitrequest_tb(request_info, request_desc, requester_name, requester_add1, requester_add2, requester_city, requester_zip, requester_email, requester_mobile, request_date) VALUES('"+requestinfo+"','"+requestdesc+"','"+requestername+"','"+requesteradd1+"','"+requesteradd2+"','"+requestercity+"','"+requesterzip+"','"+requesteremail+"','"+requestermobile+"','"+requestdate+"')";
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
      <i class="fas fa-user"></i> <label for="inputRequestInfo" class="font-weight-bold pl-2">Service Type</label><select name="requestinfo" id="inputRequestInfo" style="width:160px">  
    <option value="Electrician">Electrician</option>
    <option value="Plumber">Plumber</option>  
    <option value="Carpenter">Carpenter</option>  
   
</select></div>
  <div class="form-group">
   <label for="inputRequestDescription">Description</label>
   <input type="text" class="form-control" id="inputRequestDescription" placeholder="Write Description" name="requestdesc">
  </div>
  <div class="form-group">
   <label for="inputName">Name</label>
   <input type="text" class="form-control" id="inputName" placeholder="Enter your name" name="requestername">
  </div>
  <div class="form-row">
   <div class="form-group col-md-6">
     <label for="inputAddress">Address Line 1</label>
     <input type="text" class="form-control" id="inputAddress" placeholder="Enter your house no" name="requesteradd1">
   </div>
   <div class="form-group col-md-6">
    <label for="inputAddress2">Address Line 2</label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="Nearest land mark" name="requesteradd2">
   </div>
 
	<div class="form-group col-md-6">
      <i class="fas fa-user"></i> <label for="inputCity" class="font-weight-bold pl-2">City</label></br><select name="requestercity" id="inputCity" style="width:160px">  
    <option value="Delhi">Delhi</option>
    <option value="Gurgaon">Gurgaon</option>  
    <option value="Noida">Noida</option>  
    <option value="Mumbai">Mumbai</option>  
    <option value="Banglore">Banglore</option>  
</select></div>
   <div class="form-group col-md-2">
    <label for="inputZip">Zip</label>
    <input type="text" class="form-control" id="inputZip" name="requesterzip" onkeypress="isInputNumber(event)">
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
  <div>
  <button type="submit" class="btn btn-danger" name="submitrequest">Submit</button>
  <button type="reset" class="btn btn-secondary">Reset</button>
 </form>
 <%if(!(msg.equals(""))){out.println(msg);}%>
</div> </div><!-- End Service Request Form 2nd Column -->

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
