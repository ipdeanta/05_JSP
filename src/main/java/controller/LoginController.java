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

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	
	private static final long serialVersionUID = 5766218804388344693L;
	
	private static final Logger logger = LogManager.getLogger(LoginController.class.getName());
	
	private final static String NAME = "admin";
	private final static String PASSWORD = "pass";
	
	public LoginController() {
		// Controlador mapeado con anotaciones
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
		//response.setContentType("text/html");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		if (NAME.equals(name) && PASSWORD.equals(password) ) {
			// recuperamos nombre completo del cliente, y lo guardamos en sesión
			String fullName = "Fulanito Pérez Gutierrez";
			HttpSession session = request.getSession(true);
			session.setAttribute("clientName", fullName);
			request.getRequestDispatcher("Shop.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/LoginError.html").forward(request, response);
		}
	}

}
