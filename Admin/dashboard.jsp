<!-- dashboard.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Dashboard";
   String PAGE = "dashboard";
%>
<%@ include file="includes/header.jsp"%>


<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
int submitrequest = 0;
int assignwork = 0;
int totaltech = 0;
if(is_adminlogin == null){
   response.sendRedirect("login.jsp");
} else {
   aEmail = (String)session.getAttribute("aEmail");
}
sql = "SELECT max(request_id) as rd FROM submitrequest_tb";
db = new dbConnection();
rs = db.data(sql);
if(rs.next()){
   submitrequest = rs.getInt("rd");
}

sql = "SELECT max(rno) as aw FROM assignwork_tb";
rs = db.data(sql);
if(rs.next()){
   assignwork = rs.getInt("aw");
}

sql = "SELECT count(*) as rowcount FROM technician_tb";
totaltech = db.get_id(sql);
%>
   <div class="col-sm-9 col-md-10"> <!-- Start Dashboard 2nd Column -->
    <div class="row text-center mx-5">
     <div class="col-sm-4 mt-5">
      <div class="card text-white bg-danger mb-3" style="max-width:18rem;">
       <div class="card-header">Requests Received</div>
       <div class="card-body">
        <h4 class="card-title"><%=submitrequest%></h4>
        <a class="btn text-white" href="request.jsp">View</a>
       </div>
      </div>
     </div>
     <div class="col-sm-4 mt-5">
      <div class="card text-white bg-success mb-3" style="max-width:18rem;">
       <div class="card-header">Assigned Work</div>
       <div class="card-body">
        <h4 class="card-title"><%=assignwork%></h4>
        <a class="btn text-white" href="work.jsp">View</a>
       </div>
      </div>
     </div>
     <div class="col-sm-4 mt-5">
      <div class="card text-white bg-info mb-3" style="max-width:18rem;">
       <div class="card-header">No. of Technician</div>
       <div class="card-body">
        <h4 class="card-title"><%=totaltech%></h4>
        <a class="btn text-white" href="technician.jsp">View</a>
       </div>
      </div>
     </div>
    </div>
    <div class="mx-5 mt-5 text-center">
     <p class="bg-dark text-white p-2">List of Requesters</p>
     <% 
         sql = "SELECT * FROM requesterlogin_tb";
         rs = db.data(sql);
         while(rs.next()){
            int r_login_id = rs.getInt("r_login_id");
            String r_name = rs.getString("r_name");
            String r_email = rs.getString("r_email");
      %>
            <table class="table">
               <thead>
                  <tr>
                  <th scope="col">Requester ID</th>
                  <th scope="col">Name</th>
                  <th scope="col">Email</th>
                  </tr>
               </thead>
               <tbody>
                     <tr>
                     <td><%=r_login_id%></td>
                     <td><%=r_name%></td>
                     <td><%=r_email%></td>
                     </tr>
               </tbody>
            </table>
         <%
         if(r_name == null){
            out.println("0 results");
            }
         }
         db.closeConnection();
     %>
    </div>
   </div> <!-- End Dashboard 2nd Column -->
<%@ include file = "includes/footer.jsp" %>