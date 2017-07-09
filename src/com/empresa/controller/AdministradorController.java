package com.empresa.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

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
import com.empresa.modelo.ContactoDao;
import com.empresa.modelo.ContactoDaoImpl;
import com.empresa.modelo.UsuarioDao;
import com.empresa.modelo.UsuarioDaoImpl;
import com.empresa.modelo.UsuarioRolDaoImpl;
import com.empresa.pojo.Contacto;
import com.empresa.pojo.Usuario;
import com.mysql.jdbc.log.Log;

/**
 * Servlet implementation class AdministradorController
 */
public class AdministradorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LogManager.getLogger("ControllerGeneral: ");
	private String rutaVistaJSP;
	private Connection con = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdministradorController() {
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
		if (myRol == null || myRol != 1) {
			// Cierra sesion
			sesion.invalidate();
			// Redirecionar a la URL login
			response.sendRedirect("/login");
			
		} else if (accion == null) {
			// Llama vista administrador
			setResponseController("admin_dashboard").forward(request, response);
			
		} else {
			
			// LLamado de vistas en base al nombre del parametro accion
			
			try {
				con = ConexionBD.getConexionBD().getCon();
				
				// Dashboard Administrador
				if (accion.equals("dashboard")) {
					setResponseController("admin_dashboard").forward(request, response);
				}
				
				// Listar Usuarios
				if (accion.equals("usuarios")) {
					request.setAttribute("usuarios", new UsuarioDaoImpl(con).getAll());
					setResponseController("admin_usuarios").forward(request, response);
				}
				
				
				// Consultar o Modificar
				if (accion.equals("modificar-usuario")) {
					Integer idUsuarioAConsultar = Integer.parseInt(request.getParameter("id-usuario"));
					request.setAttribute("usuario", new UsuarioDaoImpl(con).getUsuarioById(idUsuarioAConsultar));
					request.setAttribute("usuariosRolCatalogo", new UsuarioRolDaoImpl(con).getAll());
					request.setAttribute("isModificable", 1);
					setResponseController("admin_consultar_usuario").forward(request, response);
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
		
		// Accion a realizar (Como mandar a llamar una vista)
		request.setCharacterEncoding("UTF-8");
		
		// Accion a realizar (Como mandar a llamar una vista)
		String accion = request.getParameter("accion");
				
		// Recuperar sesion activa
		HttpSession sesion = request.getSession();
		Integer myRol = (Integer) sesion.getAttribute("id_usuario_rol");
		
		// Valida si existe una sesion activa y valida el rol del usuario
		if (myRol == null || myRol != 1) {
			// Cierra sesion
			sesion.invalidate();
			// Redirecionar a la URL login
			response.sendRedirect("/login");
			
		} else if (accion == null) {
			// Llama vista administrador
			setResponseController("admin_dashboard").forward(request, response);
			
		} else {
			
			// LLamado de vistas en base al nombre del parametro accion
			
			try {
				con = ConexionBD.getConexionBD().getCon();
				
				// Insertar nuevo usuario
				if (accion.equals("nueva-cuenta")) {
					
					sesion.setAttribute("mensaje-estatus", 0);
					
					UsuarioDao usuarioDao = new UsuarioDaoImpl(con);

					// Asignar valores del formulario al usuario a crear
					Usuario usuario = new Usuario();
					
					usuario.setIdUsuarioRol(Integer.parseInt(request.getParameter("id_usuario_rol")));
					usuario.setMatricula(request.getParameter("matricula"));
					usuario.setPassword(new Hasher().generateHash(request.getParameter("password")));
					usuario.setEstatus(Integer.parseInt(request.getParameter("estatus")));
					
					// Guardar usuario
					if (usuarioDao.save(usuario)) {
						LOG.info("Usuario creado");
						
						usuario = usuarioDao.getUsuarioByMatricula(request.getParameter("matricula"));
						
						ContactoDao contactoDao = new ContactoDaoImpl(con);
						
						Contacto contacto = new Contacto();
						contacto.setNombre(request.getParameter("nombre"));
						contacto.setApPaterno(request.getParameter("apPaterno"));
						contacto.setApMaterno(request.getParameter("apMaterno"));
						contacto.setSexo(request.getParameter("sexo"));
						contacto.setIdUsuario(usuario.getIdUsuario());
						
						if (contactoDao.save(contacto)) {
							LOG.info("Usuario creado correctamente");
							sesion.setAttribute("mensaje-estatus", 1);
							
						} else {
							if (usuarioDao.removeUsuarioById(usuario.getIdUsuario())) {
								LOG.error("Se ha borrado el usuario de la BD por que no se pudo crear la cuenta");
								sesion.setAttribute("mensaje-estatus", 0);
								
							} else {
								LOG.error("No se pudo borrar el usuario - Borrarlo manualmente de la BD");
								sesion.setAttribute("mensaje-estatus", 0);
							}
						}
						
					} else {
						LOG.error("No se pudo crear el contato");
						sesion.setAttribute("mensaje-estatus", 0);
					}
					
					// Redireccionar a la URL de admin para usuarios
					response.sendRedirect("/admin?accion=usuarios");
				}
				
				
			} catch (ClassNotFoundException | SQLException e) {
				LOG.error("DO POS: " + e.getMessage());
				
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
	 * Retorna la accion (Vista JSP)
	 * @param accion
	 * @return RequestDispatcher
	 */
	public RequestDispatcher setResponseController(String accion) {
		String url = rutaVistaJSP + accion + ".jsp";
		return getServletContext().getRequestDispatcher(url);
	}
}
