package com.empresa.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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

import com.empresa.conexion.ConexionBD;
import com.empresa.modelo.UsuarioDaoImpl;
import com.empresa.modelo.UsuarioRolDaoImpl;

/**
 * Servlet implementation class DirectivoController
 */
public class DirectivoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LogManager.getLogger("ControllerGeneral: ");
	private String rutaVistaJSP;
	private Connection con = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DirectivoController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
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
		
		// Accion a realizar (Como mandar a llamar una vista)
				request.setCharacterEncoding("UTF-8");
				
				// Accion a realizar (Como mandar a llamar una vista)
				String accion = request.getParameter("accion");
						
				// Recuperar sesion activa
				HttpSession sesion = request.getSession();
				Integer myRol = (Integer) sesion.getAttribute("id_usuario_rol");
				
				// Valida si existe una sesion activa y valida el rol del usuario
				if (myRol == null || myRol != 2) {
					// Cierra sesion
					sesion.invalidate();
					// Redirecionar a la URL login
					response.sendRedirect("login");
					
				} else if (accion == null) {
					// Llama vista administrador
					setResponseController("directivo_dashboard").forward(request, response);
					
				} else {
					
					// LLamado de vistas en base al nombre del parametro accion
					
					try {
						con = ConexionBD.getConexionBD().getCon();
						
						// Dashboard Administrador
						if (accion.equals("dashboard")) {
							setResponseController("directivo_dashboard").forward(request, response);
						}
						
						
					} catch (ClassNotFoundException | SQLException e) {
						LOG.error("DO GET: " + e.getMessage());
						
					} finally {
						try {
							if (con != null) con.close();
						} catch (SQLException e) {
							LOG.error("AL CERRAR CONEXION: " + e.getMessage());
						}
					}
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
	 * Retorna la accion (Vista JSP)
	 * @param accion
	 * @return RequestDispatcher
	 */
	public RequestDispatcher setResponseController(String accion) {
		String url = rutaVistaJSP + accion + ".jsp";
		return getServletContext().getRequestDispatcher(url);
	}
}
