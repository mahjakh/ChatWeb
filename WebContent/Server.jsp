<%@page import="java.net.Socket"%>
<%@page import="java.net.ServerSocket"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.DataInputStream"%>
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
String line;
DataInputStream is;
DataOutputStream os;
ServerSocket server=new ServerSocket(12328);
Socket client = server.accept();
is = new DataInputStream(client.getInputStream());
os = new DataOutputStream(client.getOutputStream());
line = is.readLine();
System.out.println(line);
os.writeBytes("server :" +"\n");
%>

</body>
</html>