package com.empresa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * Servlet implementation class Servlet
 */
public class ControllerGeneral extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final Logger log = LogManager.getLogger("ControllerGeneral: ");
	private String rutaVistaJSP;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerGeneral() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
     * Metodo init que se ejecuta automaticamente al entrar al sistema
     */
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		
		rutaVistaJSP = config.getInitParameter("rutaVistaJSP");
		BasicConfigurator.configure();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		
		// Accion representa el nombre de la vista a mostrar
		String vista = request.getParameter("vista");
		
		HttpSession sesion = request.getSession();
		
		String myToken = (String) sesion.getAttribute("token");
		
		if (vista != null || myToken != null) {
			
			switch (vista) {
			
			case "logout":
					sesion.invalidate();
					setResponseController("login").forward(request, response);
				break;
				
			case "inicio":
				request.setAttribute("mensaje", "Bienvenido al Sistems");
				setResponseController("inicio").forward(request, response);
				break;
				
			case "usuarios":
				request.setAttribute("mensaje", "Bienvenido al Sistems");
				setResponseController("inicio").forward(request, response);
				break;

			default:
				sesion.invalidate();
				setResponseController("login").forward(request, response);
				break;
			}
			
		} else {
			log.info("Vista Login");
			sesion.invalidate();
			setResponseController("login").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	/**
	 * Retorna la vista JSP
	 * @param vista
	 * @return RequestDispatcher
	 */
	public RequestDispatcher setResponseController(String vista) {
		String url = rutaVistaJSP + vista + ".jsp";
		return getServletContext().getRequestDispatcher(url);
	}

}
