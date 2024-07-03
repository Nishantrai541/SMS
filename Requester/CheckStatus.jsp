<!-- CheckStatus.jsp -->
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
<%@ include file="includes/footer.jsp"%>