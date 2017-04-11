package first;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Message
 */
@WebServlet("/Message")
public class Message extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String getmessage = "";

	/**
	 * 
	 * @see HttpServlet#HttpServlet()
	 */
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user = (String) request.getAttribute("user");
		String message=request.getParameter("message");
		getmessage += "<br>" + user + ": " +message ;

		response.getWriter().append(getmessage);
		request.setAttribute("getmessage", getmessage);

		String res = "";
		res += "<html><head></head><body> " +

				"<form id='mySelect1' action='Chat.jsp'>" +

				"<input type='submit' onclick='getOption()' value='Write Message'>" + "</form>" +

				"</body></html>";

		response.getWriter().append(res);

	}

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
