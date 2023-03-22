package Com.Servlet;

import java.io.IOException;


//import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Com.DAO.UserDAO;
import Com.Db.DBConnect;
import Com.User.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("uname");
		String email = request.getParameter("uemail");
		String password = request.getParameter("upassword"); 
//		System.out.println(name); 
		UserDetails us = new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);

		UserDAO dao = new UserDAO(DBConnect.getConn());

		boolean f = dao.addUser(us);

		HttpSession session;

		if (f) {
			session = request.getSession();
			session.setAttribute("reg-success", "Registration successfully!");
			response.sendRedirect("register.jsp");

		} else {
				session = request.getSession();
				session.setAttribute("failed-msg", "Something went wrong on Server!!");
				response.sendRedirect("register.jsp");
		}
	}

}
