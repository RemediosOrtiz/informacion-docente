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
import com.empresa.hash.Hasher;
import com.empresa.modelo.UsuarioDao;
import com.empresa.modelo.UsuarioDaoImpl;
import com.empresa.pojo.Usuario;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LogManager.getLogger("ControllerGeneral: ");
	private String rutaVistaJSP;
	private Connection con = null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		// Accion a realizar (Como mandar a llamar una vista)
		String accion = request.getParameter("accion");
		
		// Recuperar sesion activa
		HttpSession sesion = request.getSession();
		Integer myRol = (Integer) sesion.getAttribute("id_usuario_rol");
		
		// Valida si existe una sesion activa y valida el rol del usuario
		if (myRol == null) {
			// Cierra sesion
			sesion.invalidate();
			// Llama vista login
			setResponseController("login").forward(request, response);
			
		} else if (accion == null) {
			// Llama vista login
			setResponseController("login").forward(request, response);
			
		} else {
			
			// LLamado de vistas en base al nombre del parametro accion
			if (accion.equals("logout")) {
				sesion.invalidate();
				setResponseController("login").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String accion = request.getParameter("accion");
		HttpSession sesion = request.getSession();

		try {
			
			con = ConexionBD.getConexionBD().getCon();
			
			if(accion != null) {
				
				// LOGIN
				if (accion.equals("loginUser")) {
					String matricula = request.getParameter("matricula");
					String password = request.getParameter("password");
					
					// Validar Matricula y password
					UsuarioDao usuarioDao = new UsuarioDaoImpl(con);
					
					if (usuarioDao.login(matricula, new Hasher().generateHash(password))) {
						
						// Obtener datos usuario logueado
						Usuario usuario = usuarioDao.getUsuarioByMatricula(matricula);
						
						if (usuario.getEstatus() == 0) {
							
							// Redirigir al login y mostrar errores
							LOG.error("Usuario con estatus inactivo");
							request.setAttribute("mensaje", " * Usuario desactivado. Vuelva a intentarlo más tarde.");
							setResponseController("login").forward(request, response);
							
						} else {
							// Generar sesion en el sistema con los datos del usuario logueado
							sesion.setAttribute("id_usuario", usuario.getIdUsuario());
							sesion.setAttribute("matricula", usuario.getMatricula());
							sesion.setAttribute("id_usuario_rol", usuario.getIdUsuarioRol());
							sesion.setAttribute("desc_rol", usuario.getUsuarioRol().getDescRol());
							sesion.setAttribute("id_contacto", usuario.getContacto().getIdContacto());
							sesion.setAttribute("nombre", usuario.getContacto().getNombre());
							sesion.setAttribute("ap_paterno", usuario.getContacto().getApPaterno());
							
							// Enviar datos de usuario a la vista
							request.setAttribute("usuario", usuario);
							
							// Mostrar vista Administrador
							if (usuario.getIdUsuarioRol() == 1 || usuario.getIdUsuarioRol() == 6) {
								
								// Redirecionar a la URL Admin
								response.sendRedirect("admin");
								
							} else if (usuario.getIdUsuarioRol() == 2) {
								// Redirecionar a la URL Directivo
								response.sendRedirect("directivo");
								
							} else if (usuario.getIdUsuarioRol() == 3) {
								// Redirecionar a la URL Directivo
								response.sendRedirect("secretaria");
								
							} else if (usuario.getIdUsuarioRol() == 4) {
								// Redirecionar a la URL Directivo
								response.sendRedirect("docente");
								
							} else if (usuario.getIdUsuarioRol() == 5) {
								// Redirecionar a la URL Directivo
								response.sendRedirect("laboratorista");
								
							} else {
								setResponseController("inicio").forward(request, response);
							}
						}
						
					} else {
						
						// Redirigir al login y mostrar errores
						LOG.error("Usuario o Password incorrectos");
						request.setAttribute("mensaje", " * Usuario o contrasenia incorrectos");
						setResponseController("login").forward(request, response);
					}
				}
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			LOG.error("DOPOS: " + e.getMessage());
			
		} finally {
			try {
				if (con != null) con.close();
			} catch (SQLException e) {
				LOG.error("AL CERRAR CONEXION: " + e.getMessage());
			}
		}
				
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
