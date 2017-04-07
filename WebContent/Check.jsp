
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.concurrent.ConcurrentHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="first.Users"%>

<%@page import="java.sql.*"%>

<%!public static int numc = 0; %>
<%

ArrayList<HttpSession>sessio = new ArrayList< HttpSession>();
 Map<HttpSession, String> sessions = new ConcurrentHashMap<HttpSession, String>();
 ArrayList<String> onlines = new ArrayList<String>();
 Set<String> users = new HashSet<String>();
 Map<String, String> use = new ConcurrentHashMap<String, String>();
 int num = 0;
	String user;
	String pass;
//	ArrayList<Users> users = new ArrayList<Users>();
	//Users u;
	

	try {
		
		
		sessio.add(num, request.getSession());

		user = request.getParameter("user");
		pass = request.getParameter("pass");
		
		for (int i = 0; i < 5; i++) {
			users.add(i + "");
			use.put(i + "", i + "");
		}
		
		
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
		
			onlines.add(user);
		
			sessio.get(num).setAttribute("username", user);
			sessio.get(num).setAttribute("password", pass);
			request.setAttribute("list", onlines);
			request.setAttribute("session", sessio);
			num++;
			request.getRequestDispatcher("List.jsp").forward(request, response);

			
			
/*
			
			u = new Users(user, pass);
			users.add(u);
			
			HttpSession sesssion = request.getSession();
			request.setAttribute("session", session);
			
			session.setAttribute("users", users);
			response.sendRedirect("List.jsp");
	*/		
	
			
		} else {
			response.sendRedirect("Login.jsp");
		}
	} catch (Exception e) {

		System.out.println(e);
	}
%>










