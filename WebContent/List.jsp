


<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<%
	Boolean bool = (Boolean)request.getAttribute("bool");
	ArrayList<String> list = (ArrayList<String>) request.getAttribute("list");

	ArrayList<String> se = (ArrayList<String>) request.getAttribute("session");

	//	request.setAttribute("sessio", se);
	//request.getRequestDispatcher("Chat.jsp").include(request, response);

	String name = null;
	String thisuser = list.get(list.size() - 1);
	session.setAttribute("thisuser", thisuser);
	session.setAttribute("list", list);

	if (bool == false)
		response.sendRedirect("Login.jsp");
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

	<%
	ArrayList<String> arr=new ArrayList<String>();

boolean b=true;
for(int i = 0; i < list.size(); i++)
{b=true;
	for(int ii = i+1; ii < list.size(); ii++)
	{

	if(list.get(i).equals(list.get(ii))){
		b=false;}
		
		}
if(b==true){
	arr.add(list.get(i));}
}

%>
	<form action="SelectedUser" method="get">
		<select id="multiple" name="multiple" multiple="multiple">
			<option value="   " id="option"></option>
			<%
				for (int i = 0; i < arr.size(); i++) {
					name = arr.get(i);
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




	<form id="message" action="Logout" method="get">
		<div style="position: absolute; top: 0; right: 0;">
			<input type="submit" value="LogOut">
		</div>
	</form>


</body>
</html>