

<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	ArrayList<String> list =(ArrayList<String>) request.getAttribute("list");
	ArrayList<String> se = (ArrayList<String>) request.getAttribute("session");
	request.setAttribute("sessio", se);
	//request.getRequestDispatcher("Chat.jsp").include(request, response);

	String name = null;
%>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>"Online users"</title>

</head>
<body bgcolor=#f0f0f0>
	<p id="demos"></p>

	<form>
		<h1>Online users</h1>

		<select name="ChatPartner" id="ChatPartner" multiple>
			<%
				for (int i = 0; i < list.size(); i++) {
					name = list.get(i);
			%>
			<option value="<%=name%>" id="option"><%=name%></option>

			<%
				}
			%>
		</select> <input type="button" value="Start Chat" onclick="choosePartner()" />

<% %>
		<script>
			function choosePartner() {
				var x = document.getElementById("ChatPartner");
				for (var i = 0; i < x.options.length; i++) {
					if (x.options[i].selected == true) {

						document.getElementById("demos").innerHTML = x.options[i].value ;
						request.setParameter("message", x.options[i].value );
						session.get(0).setAttribute("message", x.options[i].value );
						response.getWriter().append("Served at: "+ session.get(0).setAttribute("message"));


					}
				}

			}
		</script>
</body>
</html>