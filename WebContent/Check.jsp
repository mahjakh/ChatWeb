
<%@ page import="first.Users"%>

<%@page import="java.sql.*"%>
<%
	String user;
	String pass;
	HttpSession sess = request.getSession();
	Users u;

	try {
		user = request.getParameter("user");
		pass = request.getParameter("pass");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webchat", "root",
				"ws8dr8as3");
		Statement st = con.createStatement();
		ResultSet rs = st
				.executeQuery("select * from users where username='" + user + "' and password='" + pass + "'");
		int count = 0;
		while (rs.next()) {
			count++;

		}
		if (count > 0) {
			out.println("welcome " + user);

			//این جا کاربر رو میفرستم
			u = new Users(user, pass);
		
			sess.setAttribute("user", u);

			

			response.sendRedirect("List.jsp");
		} else {
			response.sendRedirect("Login.jsp");
		}
	} catch (Exception e) {

		System.out.println(e);
	}
%>










