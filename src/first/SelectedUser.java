package first;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SelectedUser
 */
@WebServlet("/SelectedUser")
public class SelectedUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	 ArrayList<String> selected = new ArrayList<String>();
	 int count=0;

    public SelectedUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String thisuser=(String)session.getAttribute("thisuser");
		
		
		String []a=request.getParameterValues( "multiple" );
		for (int i = 0; i < a.length; i++) {
			selected.add(a[i]);
		
		}
		
		
		


	//	request.setAttribute("selected", selected);
		for (int i = 0; i < selected.size(); i++) {


			if(selected.get(i).equals(thisuser)){
		count++;
					request.setAttribute("count", count);

		request.getRequestDispatcher("Chat.jsp").forward(request, response);
		}
			else
				System.out.println(thisuser+" You Are Not added to any Chat Group Yet!!");}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
