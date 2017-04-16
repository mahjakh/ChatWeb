<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>
<% 



String thisuser=(String)session.getAttribute("username");



session.setAttribute("thisuser", thisuser);
String getmessage=(String)request.getAttribute("getmessage")+" ";



	%>
	<p>
	Type Here:
	</p>
	 	<form id="message"  action="Message" method="get">
<textarea id="message" name="message" rows="4" cols="50">
</textarea>
 	 <input type="submit" value="Send">
	</form>	
	
	<p>
	Read Here:
	</p>
<textarea  rows="4" cols="50">
	<%=getmessage%>
</textarea>

<div onclick="$('#msg').val($('#msg').val() + '&#128516;');"
              id="emoji" class="btn btn-default">&#128516;</div>
            <div onclick="$('#msg').val($('#msg').val() + '&#128521;');"
              id="emoji" class="btn btn-default">&#128521;</div>
            <div onclick="$('#msg').val($('#msg').val() + '&#128525;');"
              id="emoji" class="btn btn-default">&#128525;</div>
            <div onclick="$('#msg').val($('#msg').val() + '&#128530;');"
              id="emoji" class="btn btn-default">&#128530;</div>


   
    	
</body>
</html>