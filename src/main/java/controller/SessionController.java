package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/Logout")
public class SessionController extends HttpServlet {
	
	private static final long serialVersionUID = 5766218804388344693L;
	
	private static final Logger logger = LogManager.getLogger(SessionController.class.getName());
	
	public SessionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init() throws ServletException {
		logger.info("inicio del Servlet " + this.getClass().getSimpleName());
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			logger.info("Cierre de sesion");
			session.invalidate();
			response.sendRedirect("Login.jsp");
		} else {
			request.getRequestDispatcher("/Error.jsp").forward(request, response);
		}
	}

}
