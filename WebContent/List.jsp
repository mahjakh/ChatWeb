


<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<%


	ArrayList<String> list = (ArrayList<String>) request.getAttribute("list");

	ArrayList<String> se = (ArrayList<String>) request.getAttribute("session");

	//	request.setAttribute("sessio", se);
	//request.getRequestDispatcher("Chat.jsp").include(request, response);

	String name = null;
	String thisuser = list.get(list.size() - 1);
	session.setAttribute("thisuser", thisuser);
%>


<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>"Online users"</title>

</head>
<body bgcolor=#f0f0f0>
	<p id="demos"></p>
<html>
<body>
	<form action="SelectedUser" method="get">
		<select id="multiple" name="multiple" multiple="multiple">
			<option value="   " id="option"></option>
			<%
	
				for (int i = 0; i < list.size(); i++) {
					name=list.get(i);
					
			%>
			<option value="<%=name%>" id="option"><%=name%></option>

			<%
					
			}
			%>

		</select> <input type="submit" value="Go to chat room">
	</form>

</body>
</html>
<body>



	<%
		session.setAttribute("thisuser", list.get(list.size() - 1));
	%>






</body>
</html>