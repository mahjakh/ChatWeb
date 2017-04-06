
<%@page import="java.util.ArrayList"%>
<%@ page import="first.Users" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script type = "text/javascript">
 function showDiv() {
	   document.getElementById('welcomeDiv').style.display = "block";   
	  
	}
        </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
ArrayList<Users> list = new ArrayList<Users>();
HttpSession sess = request.getSession(true); //use false to use the existing session
Users user=(Users)sess.getAttribute("user");
list.add(user);



%>

<form>
  <h1>Online users</h1>

  <select name="ChatPartner" id="ChatPartner" multiple>
   <%
   String name;
    for (int i = 0; i < list.size(); i++) {
     name = list.get(i).getUsername();
   %>
   <option value="<%=name%>" id="option"><%=name%></option>

   <%
    }
   %>
  </select> <input type="button" value="Start Chat" onclick="choosePartner()" />

 



 
</body>

</html>