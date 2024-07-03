<!-- contactform.jsp -->
<%@ page import="java.io.*, java.util.*, javax.mail.*"%> 
<%@ page import="javax.mail.internet.*, javax.activation.*"%> 
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%
String name;
String subject;
String email;
String query;
String result="";
String msg;
String submit = request.getParameter("submit");
if(request.getMethod().equals("POST") && (!(submit==null))) {
 name = request.getParameter("name");
 subject = request.getParameter("subject");
 email = request.getParameter("email");
 query = request.getParameter("msg");

 Properties properties = System.getProperties();
 properties.setProperty("mail.smtp.host", "localhost");
 Session mailSession = Session.getDefaultInstance(properties);

 if(name.equals("") || subject.equals("") || email.equals("") || query.equals("")){
  out.println("<div class=" + "alert alert-warning col-sm-6 ml-5 mt-2" + "role="+ "alert" + "> + Fill All Fileds </div>");
 } else {
   try{
    MimeMessage message = new MimeMessage(mailSession);
    message.setFrom(new InternetAddress(email));
    message.setSubject("This is the Subject Line!");
    message.setContent(query, "text/html" );
    Transport.send(message);
    result = "Sent message successfully....";
    }catch (MessagingException mex) { mex.printStackTrace();
      result = "Error: unable to send message....";
  }   
   }
}
%>

<div class="col-md-8">
  <form method="POST">
   <input type="text" class="form-control" name="name" placeholder="Name"><br>
   <input type="text" class="form-control" name="subject" placeholder="Subject"><br>
   <input type="email" class="form-control" name="email" placeholder="Email"><br>
   <textarea class="form-control" name="message" placeholder="How can we help you?" style="height:150px;"></textarea><br>
   <input type="submit" class="btn btn-primary" value="Send" name="submit"><br><br>
  </form>
  <p><%=result%></p>
</div>