<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 

String thisuser=(String)session.getAttribute("username");







%>

	<form name="form" method="post" action="Message"
		onsubmit="javascript:return validate();">

		<table>
			<tr>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" value="Read Messages"></td>
				<td></td>
			</tr>


			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>

	</form>
	
	
	<%
	
	
	
	
	

	
ArrayList<String> selected = (ArrayList<String>) request.getAttribute("selected");

for (int i = 0; i < selected.size(); i++) {


if(selected.get(i).equals(thisuser)){
	%>
<textarea name="message" rows="4" cols="50">
</textarea>
<% 
}
}
selected=null;
%>

	
	
	
</body>
</html>