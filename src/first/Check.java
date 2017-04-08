package first;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChooseChat
 */
@WebServlet("/Choosechat")
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Check() {
		super();
		// TODO Auto-generated constructor stub
	}

	ArrayList<HttpSession>session = new ArrayList< HttpSession>();
	public static int num = 0;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// Map<HttpSession, String> sessions = new ConcurrentHashMap<HttpSession, String>();
	 ArrayList<String> onlines = new ArrayList<String>();
	// Set<String> users = new HashSet<String>();
//	 Map<String, String> use = new ConcurrentHashMap<String, String>();
	String user;
	String pass;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		session.add(num, request.getSession());
		
		user = request.getParameter("user");
		pass = request.getParameter("pass");
		
	/*	for (int i = 0; i < 5; i++) {
			users.add(i + "");
			use.put(i + "", i + "");
		}
		*/
		// ******
		
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webchat", "root",
					"ws8dr8as3");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Statement st = null;
		try {
			st = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSet rs = null;
		try {
			rs = st
					.executeQuery("select * from users where username='" + user + "' and password='" + pass + "'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int count = 0;
		try {
			while (rs.next()) {
				count++;

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (count > 0) {
		
		
		
	
					onlines.add(user);
				session.get(num).setAttribute("username", user);
				session.get(num).setAttribute("password", pass);
				request.setAttribute("list", onlines);
				request.setAttribute("session", session);
			
				request.getRequestDispatcher("List.jsp").forward(request, response);

 		
				num++;
		}
		}
				/*
			 else {
				String log = "";
				log += "<html><body><form action='Choosechat'>" + " <center><fieldset>"
						+ " <p id='demo'> Wrong Password </p></fieldset></center></form></body></html>";
				response.getWriter().append(log);
				System.out.println("Incorrect password");
			}

		} 
			
			else {
			String log = "";
			log += "<html><body><form action='Choosechat'>" + " <center><fieldset>"
					+ " <p id='demo'> This username has not been registered yet! </p></fieldset></center></form></body></html>";
			response.getWriter().append(log);
			System.out.println("not EXIST");
		}
*/
		// ***********8

	//	PrintWriter out = response.getWriter();
		//
		// String docType =
		// "<!doctype html public \"-//w3c//dtd html 4.0 " +
		// "transitional//en\">\n";
		// out.println(docType +
		// "<html>\n" +
		// "<head><title>" + "Online users" + "</title></head>\n" +
		// "<body bgcolor=\"#f0f0f0\">\n" +
		// "<h1 align=\"center\">" + "Online users" + "</h1>\n" +
		//
		// "<table border=\"1\" align=\"center\">\n" +
		// "<tr bgcolor=\"#949494\">\n" +
		// " <th>UserName</th>\n" +
		// "<tr>\n" +
		// // for(String online : onlines){
		// " <td>" +onlines.get(0) + "</td></tr>\n" +
		// "<tr>\n" +
		// // }
		// "</body></html>");

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
