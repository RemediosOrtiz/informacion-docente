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
import com.empresa.modelo.CarreraCDaoImpl;
import com.empresa.modelo.CarreraUsuarioCDaoImpl;
import com.empresa.modelo.ContactoDao;
import com.empresa.modelo.ContactoDaoImpl;
import com.empresa.modelo.CuatriCDaoImpl;
import com.empresa.modelo.DireccionDaoImpl;
import com.empresa.modelo.DocenteLaboralDaoImpl;
import com.empresa.modelo.EstudioDaoImpl;
import com.empresa.modelo.GrupoCDaoImpl;
import com.empresa.modelo.GrupoDao;
import com.empresa.modelo.GrupoDaoImpl;
import com.empresa.modelo.MateriaCDaoImpl;
import com.empresa.modelo.MateriaDao;
import com.empresa.modelo.MateriaDaoImpl;
import com.empresa.modelo.NivelEstudioCDaoImpl;
import com.empresa.modelo.NombramientoCDaoImpl;
import com.empresa.modelo.ReporteDao;
import com.empresa.modelo.ReporteDaoImpl;
import com.empresa.modelo.TipoLugarDaoImpl;
import com.empresa.modelo.UsuarioDao;
import com.empresa.modelo.UsuarioDaoImpl;
import com.empresa.modelo.UsuarioNombramientoDaoImpl;
import com.empresa.modelo.UsuarioRolDaoImpl;
import com.empresa.pojo.CarreraC;
import com.empresa.pojo.Contacto;
import com.empresa.pojo.Grupo;
import com.empresa.pojo.Materia;
import com.empresa.pojo.ReporteHorasContratacion;
import com.empresa.pojo.Usuario;

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
		if ((myRol == null) || (myRol != 1 && myRol != 6)) {
			// Cierra sesion
			sesion.invalidate();
			// Redirecionar a la URL login
			response.sendRedirect("login");
			
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
					request.setAttribute("usuariosRolCatalogo", new UsuarioRolDaoImpl(con).getAll());
					
					setResponseController("admin_usuarios").forward(request, response);
				}
				
				
				// Consultar o Modificar usuario
				if (accion.equals("modificar-usuario")) {
					
					// Campturar varible desde la URL
					Integer idUsuarioAConsultar = Integer.parseInt(request.getParameter("id-usuario"));
					
					Usuario usurio = new UsuarioDaoImpl(con).getUsuarioById(idUsuarioAConsultar);
					request.setAttribute("usuario", usurio);

					request.setAttribute("usuariosRolCatalogo", new UsuarioRolDaoImpl(con).getAll());
					
					// Consultar catalogo tipo lugar
					request.setAttribute("tipoLugarCatalogo", new TipoLugarDaoImpl(con).getAll());
					
					// Consultar direcciones de un usuario
					request.setAttribute("direcciones", new DireccionDaoImpl(con).getAllByContactoId(usurio.getContacto().getIdContacto()));
					
					
					// Consultar Docente Labora por id usuario
					request.setAttribute("docenteLaboral", new DocenteLaboralDaoImpl(con).getDocenteLaboralByIdUsuario(idUsuarioAConsultar));
					
					
					// Consultar catalogo carrera
					request.setAttribute("carreraCatalogo", new CarreraCDaoImpl(con).getAll());
					
					// Consultar catalogo carrera usuario
					request.setAttribute("carreraUsuarioCatalogo", new CarreraUsuarioCDaoImpl(con).getAll());
					
					// Consultar catalogo nivel de estudio
					request.setAttribute("nivelEstudioCatalogo", new NivelEstudioCDaoImpl(con).getAll());
					request.setAttribute("estudio", new EstudioDaoImpl(con).getEstudioByIdUsuario(idUsuarioAConsultar));
					
					
					
					// Consultar catalogo nombramiento
					request.setAttribute("nombramientoCatalogo", new NombramientoCDaoImpl(con).getAll());
					request.setAttribute("usuarioNombramiento", new UsuarioNombramientoDaoImpl(con).getUsuarioNombramientoById(idUsuarioAConsultar));
					
					
					request.setAttribute("isModificable", 1);
					
					
					setResponseController("admin_consultar_usuario").forward(request, response);
				}
				
				
				// Listar Grupos
				if (accion.equals("grupos")) {
					request.setAttribute("usuarios", new UsuarioDaoImpl(con).getAll());
					request.setAttribute("cuatriCatalogo", new CuatriCDaoImpl(con).getAll());
					request.setAttribute("carreraCatalogo", new CarreraCDaoImpl(con).getAll());
					request.setAttribute("grupoCatalogo", new GrupoCDaoImpl(con).getAll());
					request.setAttribute("grupos", new GrupoDaoImpl(con).getAll());
					
					setResponseController("admin_grupos").forward(request, response);
				}
				
				
				// Consultar grupo y materias
				if (accion.equals("consultar-grupo")) {
					
					Grupo grupo = new GrupoDaoImpl(con).getGrupoById(Integer.parseInt(request.getParameter("id-grupo")));
					
					request.setAttribute("usuarios", new UsuarioDaoImpl(con).getAll());
					request.setAttribute("cuatriCatalogo", new CuatriCDaoImpl(con).getAll());
					request.setAttribute("carreraCatalogo", new CarreraCDaoImpl(con).getAll());
					request.setAttribute("grupoCatalogo", new GrupoCDaoImpl(con).getAll());
					
					request.setAttribute("materiaCatalogo",
							new MateriaCDaoImpl(con).getAllByIdCuatriAndByIdCarrera(grupo.getIdCuatriC(), grupo.getIdCarreraC()));
					
					request.setAttribute("grupo", grupo);
					request.setAttribute("materias", new MateriaDaoImpl(con).getAllByIdGrupo(grupo.getIdGrupo()));
					
					setResponseController("admin_consultar_grupo").forward(request, response);
				}
				
				
				
				// REPORTES ADMINISTRATIVO
				if (accion.equals("reporte-info-profesores")) {
					request.setAttribute("usuarios", new UsuarioDaoImpl(con).getAll());
					request.setAttribute("usuariosRolCatalogo", new UsuarioRolDaoImpl(con).getAll());
					
					setResponseController("administrativo_reporte_info_profesores").forward(request, response);
				}
				
				
				// REPORTE CONSULTAR PROFESOR
				if (accion.equals("consultar-usuario")) {
					
					// Campturar varible desde la URL
					Integer idUsuarioAConsultar = Integer.parseInt(request.getParameter("id-usuario"));
					
					Usuario usurio = new UsuarioDaoImpl(con).getUsuarioById(idUsuarioAConsultar);
					request.setAttribute("usuario", usurio);

					request.setAttribute("usuariosRolCatalogo", new UsuarioRolDaoImpl(con).getAll());
					
					// Consultar catalogo tipo lugar
					request.setAttribute("tipoLugarCatalogo", new TipoLugarDaoImpl(con).getAll());
					
					// Consultar direcciones de un usuario
					request.setAttribute("direcciones", new DireccionDaoImpl(con).getAllByContactoId(usurio.getContacto().getIdContacto()));
					
					
					// Consultar Docente Labora por id usuario
					request.setAttribute("docenteLaboral", new DocenteLaboralDaoImpl(con).getDocenteLaboralByIdUsuario(idUsuarioAConsultar));
					
					
					// Consultar catalogo carrera
					request.setAttribute("carreraCatalogo", new CarreraCDaoImpl(con).getAll());
					
					// Consultar catalogo nivel de estudio
					request.setAttribute("nivelEstudioCatalogo", new NivelEstudioCDaoImpl(con).getAll());
					
					
					request.setAttribute("isModificable", 1);
					
					
					setResponseController("administrativo_reporte_info_profesor").forward(request, response);
				}
				
				
				
				// Reporte Nombramiento
				if (accion.equals("r-nombramiento")) {
					request.setAttribute("usuarios", new UsuarioDaoImpl(con).getAll());
					request.setAttribute("usuariosRolCatalogo", new UsuarioRolDaoImpl(con).getAll());
					
					request.setAttribute("nombramientoCatalogo", new NombramientoCDaoImpl(con).getAll());
					
					ReporteDao reporteDao = new ReporteDaoImpl(con);
					request.setAttribute("reportes1", reporteDao.getAllReporte1());
					request.setAttribute("reportes2", reporteDao.getAllReporte2());
					request.setAttribute("reportes4", reporteDao.getAllReporte4());
					request.setAttribute("reportes6", reporteDao.getAllReporte6());
					request.setAttribute("reportes7", reporteDao.getAllReporte7());
					request.setAttribute("reportes8", reporteDao.getAllReporte8());
					request.setAttribute("reportes9", reporteDao.getAllReporte9());
					
					setResponseController("admin_r_nombramiento").forward(request, response);
				}
				
				
				
				
				// Reportes
				if (accion.equals("reportes")) {
					
					ReporteDao reporteDao = new ReporteDaoImpl(con);
					
					ArrayList<ReporteHorasContratacion> reporteHorasContratacion = reporteDao.getAllReporteHorasContratacion();
					
					Integer totalHrsGrupo = 0;
					Integer totalHrsApoyo = 0;
					Integer totalHrsGeneral = 0;
					
					for (ReporteHorasContratacion x : reporteHorasContratacion) {
						totalHrsGrupo = totalHrsGrupo + x.getHrsGrupo();
						totalHrsApoyo = totalHrsApoyo + x.getHrsApoyo();
						totalHrsGeneral = totalHrsGeneral + x.getHrsTotal();
					}
					
					request.setAttribute("ReporteHorasContratacion", reporteHorasContratacion);
					request.setAttribute("totalHrsGrupo", totalHrsGrupo);
					request.setAttribute("totalHrsApoyo", totalHrsApoyo);
					request.setAttribute("totalHrsGeneral", totalHrsGeneral);
					
					setResponseController("admin_reportes").forward(request, response);
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
		if (myRol == null || (myRol != 1 && myRol != 6)) {
			
			// Cierra sesion
			sesion.invalidate();
			// Redirecionar a la URL login
			response.sendRedirect("login");
			
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
					response.sendRedirect("admin?accion=usuarios");
				}
				
				
				
				// nuevo-grupo
				if (accion.equals("nuevo-grupo")) {
					
					Grupo grupo = new Grupo();
					grupo.setIdCuatriC(Integer.parseInt(request.getParameter("idCuatriC")));
					grupo.setIdCarreraC(Integer.parseInt(request.getParameter("idCarreraC")));
					grupo.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
					grupo.setIdGrupoC(Integer.parseInt(request.getParameter("idGrupoC")));
					
					
					GrupoDao grupoDao = new GrupoDaoImpl(con);
					ArrayList<CarreraC> carrerasC = new CarreraCDaoImpl(con).getAll();
					
					for (CarreraC carreraC : carrerasC) {
						
						if (carreraC.getIdCarreraC() == grupo.getIdCarreraC()) {
							grupo.setNombreGrupo(grupo.getIdCuatriC() + carreraC.getAcronimoCarrera() + grupo.getIdGrupoC() );
						}
					}
					
					if (grupoDao.save(grupo)) {
						System.out.println("Grupo guardado correctamente");
					} else {
						System.out.println("Error al crear el usuario");
					}
					
					// Redireccionar a la URL de admin para grupo
					response.sendRedirect("admin?accion=grupos");
				}
				
				
				// nueva-materia
				if (accion.equals("nueva-materia")) {
					
					Materia materia = new Materia();
					materia.setIdMateriaC(Integer.parseInt(request.getParameter("idMateriaC")));
					materia.setIdGrupo(Integer.parseInt(request.getParameter("idGrupo")));
					materia.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
					materia.setHorasGeneral(Integer.parseInt(request.getParameter("horasGeneral")));
					materia.setHorasApoyo(Integer.parseInt(request.getParameter("horasApoyo")));
					
					MateriaDao materiaDao = new MateriaDaoImpl(con);
					
					if (materiaDao.save(materia)) {
						System.out.println("Materia creada");
					} else {
						System.out.println("Error al crear la materia");
					}
					
					// Redireccionar a la URL de admin para grupo
					response.sendRedirect("admin?accion=consultar-grupo&id-grupo=" + materia.getIdGrupo());
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
