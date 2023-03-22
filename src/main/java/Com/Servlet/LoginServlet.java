package Com.Servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Com.DAO.UserDAO;
import Com.Db.DBConnect;
import Com.User.UserDetails;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet { 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");

		 UserDetails us=new UserDetails();
		 us.setEmail(email);
		 us.setPassword(password);

		  UserDAO dao=new UserDAO(DBConnect.getConn());
		  UserDetails user=dao.loginUser(us);
		  HttpSession session;
		  if(user!=null) {
			  session=request.getSession();
			  session.setAttribute("userD",user);
			  response.sendRedirect("home.jsp");
		  }
		  else {
			 session= request.getSession();
				session.setAttribute("login-failed", "Invalid Username and Password!!");
				response.sendRedirect("login.jsp");

			  
		  }
	}

	
}
