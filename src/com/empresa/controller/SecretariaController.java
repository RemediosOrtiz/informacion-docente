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
import com.empresa.modelo.CarreraCDaoImpl;
import com.empresa.modelo.DireccionDaoImpl;
import com.empresa.modelo.DocenteLaboralDaoImpl;
import com.empresa.modelo.NivelEstudioCDaoImpl;
import com.empresa.modelo.NombramientoCDaoImpl;
import com.empresa.modelo.ReporteDao;
import com.empresa.modelo.ReporteDaoImpl;
import com.empresa.modelo.ReporteGeneralDao;
import com.empresa.modelo.ReporteGeneralDaoImpl;
import com.empresa.modelo.TipoLugarDaoImpl;
import com.empresa.modelo.UsuarioDaoImpl;
import com.empresa.modelo.UsuarioRolDaoImpl;
import com.empresa.pojo.ReporteHorasContratacion;
import com.empresa.pojo.Usuario;

/**
 * Servlet implementation class DirectivoController
 */
public class SecretariaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LogManager.getLogger("ControllerGeneral: ");
	private String rutaVistaJSP;
	private Connection con = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecretariaController() {
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
				if (myRol == null || myRol != 3) {
					// Cierra sesion
					sesion.invalidate();
					// Redirecionar a la URL login
					response.sendRedirect("login");
					
				} else if (accion == null) {
					// Llama vista administrador
					setResponseController("secretaria_dashboard").forward(request, response);
					
				} else {
					
					// LLamado de vistas en base al nombre del parametro accion
					
					try {
						con = ConexionBD.getConexionBD().getCon();
						
						// Dashboard Administrador
						if (accion.equals("dashboard")) {
							setResponseController("secretaria_dashboard").forward(request, response);
						}
						
						// Consultar o Modificar
						if (accion.equals("modificar-usuario")) {
							
							// Campturar varible desde la URL
							Integer idUsuarioAConsultar = (Integer) sesion.getAttribute("id_usuario");
							
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
							
							
							setResponseController("secretaria_consultar_perfil").forward(request, response);
						}
						
						
						// Listar Usuarios
						if (accion.equals("reporte-info-profesores")) {
							request.setAttribute("usuarios", new UsuarioDaoImpl(con).getAll());
							request.setAttribute("usuariosRolCatalogo", new UsuarioRolDaoImpl(con).getAll());
							
							setResponseController("secretaria_reporte_info_profesores").forward(request, response);
						}
						
						// Consultar o Modificar
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
							
							
							setResponseController("secretaria_reporte_info_profesor").forward(request, response);
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
							
							setResponseController("secretaria_r_nombramiento").forward(request, response);
						}
						
						
						// Reportes
						if (accion.equals("reportes")) {
							
							// SECCION REPORTE TOTAL HORAS
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


							// SECCION REPORTE GENERAL
							ReporteGeneralDao reporteGeneralDao = new ReporteGeneralDaoImpl(con);
							
							request.setAttribute("reporteTSUHombres", reporteGeneralDao.getTSUHombres());
							request.setAttribute("reporteTSUMujeres", reporteGeneralDao.getTSUMujeres());
							request.setAttribute("reporteTSUHombresMujeresTotal", reporteGeneralDao.getTSUTotal());
							request.setAttribute("reporteTSUTotalHoras", reporteGeneralDao.getTSUTotalHoras());
							
							request.setAttribute("reporteGradoEstudioTSU", reporteGeneralDao.getGradoEstudioTSU());
							request.setAttribute("reporteGradoEstudioSinLicenciatura", reporteGeneralDao.getGradoEstudioSinLicenciatura());
							request.setAttribute("reporteGradoEstudioConLicenciatura", reporteGeneralDao.getGradoEstudioConLicenciatura());
							request.setAttribute("reporteGradoEstudioEspecialidad", reporteGeneralDao.getGradoEstudioEspecialidad());
							request.setAttribute("reporteGradoEstudioTeacher", reporteGeneralDao.getGradoEstudioTeacher());
							request.setAttribute("reporteGradoEstudioSinMastria", reporteGeneralDao.getGradoEstudioSinMastria());
							request.setAttribute("reporteGradoEstudioConMastria", reporteGeneralDao.getGradoEstudioConMastria());
							request.setAttribute("reporteGradoEstudioSinDoctorado", reporteGeneralDao.getGradoEstudioSinDoctorado());
							request.setAttribute("reporteGradoEstudioConDoctorado", reporteGeneralDao.getGradoEstudioConDoctorado());
							
							request.setAttribute("reporteExperienciaDocente0", reporteGeneralDao.getExperienciaDocente0());
							request.setAttribute("reporteExperienciaDocente1A4", reporteGeneralDao.getExperienciaDocente1A4());
							request.setAttribute("reporteExperienciaDocente5A10", reporteGeneralDao.getExperienciaDocente5A10());
							request.setAttribute("reporteExperienciaDocenteMayorA10", reporteGeneralDao.getExperienciaDocenteMayorA10());
							
							request.setAttribute("reporteExperienciaLaboralMayorA10", reporteGeneralDao.getExperienciaLaboralMayorA10());
							request.setAttribute("reporteExperienciaLaboral0", reporteGeneralDao.getExperienciaLaboral0());
							request.setAttribute("reporteExperienciaLaboral1A4", reporteGeneralDao.getExperienciaLaboral1A4());
							request.setAttribute("reporteExperienciaLaboral5A10", reporteGeneralDao.getExperienciaLaboral5A10());
							
							request.setAttribute("reporteDocenteParticipaEnCA", reporteGeneralDao.getDocenteParticipaEnCA()); 
							request.setAttribute("reporteDocentePerteneceEnLineasInnovadoras", reporteGeneralDao.getDocenteParticipaEnLineasInnovadoras());
							request.setAttribute("reporteDocenteCuentaConPTC", reporteGeneralDao.getDocenteCuentaConPTC());
							request.setAttribute("reporteDocenteCuentaConPROMEP", reporteGeneralDao.getDonceteCuentaConPROMEP());
							
							setResponseController("secretaria_reportes").forward(request, response);
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
