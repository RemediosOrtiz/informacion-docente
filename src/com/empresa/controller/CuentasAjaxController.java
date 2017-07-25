package com.empresa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import com.empresa.conexion.ConexionBD;
import com.empresa.hash.Hasher;
import com.empresa.modelo.ContactoDao;
import com.empresa.modelo.ContactoDaoImpl;
import com.empresa.modelo.DireccionDao;
import com.empresa.modelo.DireccionDaoImpl;
import com.empresa.modelo.DocenteLaboralDao;
import com.empresa.modelo.DocenteLaboralDaoImpl;
import com.empresa.modelo.NivelEstudioCDao;
import com.empresa.modelo.UsuarioDao;
import com.empresa.modelo.UsuarioDaoImpl;
import com.empresa.pojo.Contacto;
import com.empresa.pojo.Direccion;
import com.empresa.pojo.DocenteLaboral;
import com.empresa.pojo.NivelEstudioC;
import com.empresa.pojo.Usuario;

/**
 * Servlet implementation class CuentasAjaxController
 */
public class CuentasAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LogManager.getLogger("CuentasAjaxController: ");
	private Connection con = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuentasAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// actualizar-usuario
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		String accion = request.getParameter("accion");
		
		// JSONArray json = new JSONArray();
		JSONObject jsonObj = new JSONObject();
		
		if (accion != null) {
			
			try {
				con = ConexionBD.getConexionBD().getCon();
				
				// Consultar usuario por id
				if (accion.equals("actualizar-usuario")) {
					
					Integer idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
					
					jsonObj = new JSONObject(new UsuarioDaoImpl(con).getUsuarioById(idUsuario));
					jsonObj.put("mensajeAccion", "Todo salio bien al consultar Usuario");
					
					out.println(jsonObj);
				}
				
				// Consultar contacto por id
				if (accion.equals("actualizar-contacto")) {
					Integer idContacto = Integer.parseInt(request.getParameter("id_contacto"));
					
					jsonObj = new JSONObject(new ContactoDaoImpl(con).getContactoById(idContacto));
					jsonObj.put("mensajeAccion", "Todo salio bien al consultar Contacto");
					jsonObj.put("fNacimientoX", new ContactoDaoImpl(con).getContactoById(idContacto).getfNacimiento());
					
					System.out.println(new ContactoDaoImpl(con).getContactoById(idContacto));
					
					out.println(jsonObj);
				}
				
				
				// Consultar direccion por id
				if (accion.equals("consultar-direccion")) {
					Integer idDireccion = Integer.parseInt(request.getParameter("idDireccion"));
					
					jsonObj = new JSONObject(new DireccionDaoImpl(con).getDireccionById(idDireccion));
					jsonObj.put("mensajeAccion", 1);
					
					out.println(jsonObj);
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
		// actualizar-usuario
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		String accion = request.getParameter("accion");
		JSONObject jsonObj = new JSONObject(); 
		
		if (accion != null) {
			
			try {
			
				con = ConexionBD.getConexionBD().getCon();
				
				// Actualizar cuenta por id
				if (accion.equals("actualizar-usuario")) {
					
					Usuario usuario = new Usuario();
					usuario.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
					usuario.setIdUsuarioRol(Integer.parseInt(request.getParameter("id-usuario-rol")));
					usuario.setMatricula(request.getParameter("matricula"));
					usuario.setPassword(new Hasher().generateHash(request.getParameter("password")));
					usuario.setEstatus(Integer.parseInt(request.getParameter("estatus")));
					
					
					UsuarioDao usuarioDao = new UsuarioDaoImpl(con);
					
					if (usuarioDao.update(usuario)) {
						// El usuario se actuliza
						jsonObj = new JSONObject(usuarioDao.getUsuarioById(usuario.getIdUsuario()));
						jsonObj.put("mensajeAccion", 1);
					} else {
						
						// El usuario no se pudo actuzar
						jsonObj.put("mensajeAccion", 0);
					}
					
					out.println(jsonObj);
				}
				
				
				
				// Actualizar contacto por id
				if (accion.equals("actualizar-contacto")) {
					
					Contacto contacto = new Contacto();
					contacto.setIdContacto(Integer.parseInt(request.getParameter("id_contacto")));
					contacto.setNombre(request.getParameter("nombre"));
					contacto.setApPaterno(request.getParameter("apPaterno"));
					contacto.setApMaterno(request.getParameter("apMaterno"));
					contacto.setfNacimiento(request.getParameter("fNacimiento"));
					contacto.setSexo(request.getParameter("sexo"));
					contacto.setDiscapacidad(request.getParameter("discapacidad"));
					
					ContactoDao contactoDao = new ContactoDaoImpl(con);
					
					if (contactoDao.update(contacto)) {
						// El contacto se actuliza
						jsonObj = new JSONObject(contactoDao.getContactoById(contacto.getIdContacto()));
						jsonObj.put("mensajeAccion", 1);
					} else {
						
						// El contacto no se pudo actualizar
						jsonObj.put("mensajeAccion", 0);
					}
					
					out.println(jsonObj);
				}
				

				// Crear direccion por idContacto
				if (accion.equals("nueva-direccion")) {
					
					Direccion direccion = new Direccion();
					
					direccion.setNumero(request.getParameter("numero"));
					direccion.setCalle(request.getParameter("calle"));
					direccion.setCp(Integer.parseInt(request.getParameter("cp")));
					direccion.setIdContacto(Integer.parseInt(request.getParameter("idContacto")));
					direccion.setIdTipoLugar(Integer.parseInt(request.getParameter("idTipoLugar")));
					
					DireccionDao direccionDao = new DireccionDaoImpl(con);
					
					if (direccionDao.save(direccion)) {
						jsonObj.put("mensajeAccion", 1);
					} else {
						jsonObj.put("mensajeAccion", 0);
					}
					
					out.println(jsonObj);
				}
				
				
				// Actualiza direccion por id direccion
				if (accion.equals("actualizar-direccion")) {
					
					Direccion direccion = new Direccion();
					
					direccion.setIdDireccion(Integer.parseInt(request.getParameter("idDireccion")));
					direccion.setNumero(request.getParameter("numero"));
					direccion.setCalle(request.getParameter("calle"));
					direccion.setCp(Integer.parseInt(request.getParameter("cp")));
					direccion.setIdContacto(Integer.parseInt(request.getParameter("idContacto")));
					direccion.setIdTipoLugar(Integer.parseInt(request.getParameter("idTipoLugar")));
					
					
					
					DireccionDao direccionDao = new DireccionDaoImpl(con);
					
					if (direccionDao.update(direccion)) {
						jsonObj.put("mensajeAccion", 1);
					} else {
						jsonObj.put("mensajeAccion", 0);
					}
					
					out.println(jsonObj);
				}
				
				
				// eliminar-direccion
				if (accion.equals("eliminar-direccion")) {
					
					Integer idDireccion = Integer.parseInt(request.getParameter("idDireccion"));
					
					DireccionDao direccionDao = new DireccionDaoImpl(con);
					
					if (direccionDao.deleteDireccionById(idDireccion)) {
						jsonObj.put("mensajeAccion", 1);
					} else {
						jsonObj.put("mensajeAccion", 0);
					}
					
					out.println(jsonObj);
				}
				
				
				// Crear info laboral por id user
				if (accion.equals("nueva-info-laboral")) {
					
					DocenteLaboral docenteLaboral = new DocenteLaboral();
					docenteLaboral.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
					docenteLaboral.setIdCarreraC(Integer.parseInt(request.getParameter("idCarreraC")));
					docenteLaboral.setAlertOpcionActializar(Integer.parseInt(request.getParameter("alertOpcionActializar")));
					docenteLaboral.setReconocimientoPerfilPromepSep(Integer.parseInt(request.getParameter("reconocimientoPerfilPromepSep")));
					docenteLaboral.setReconocimientoPerfilPromepSepDesc(request.getParameter("reconocimientoPerfilPromepSepDesc"));
					docenteLaboral.setPerteneceCA(Integer.parseInt(request.getParameter("perteneceCA")));
					docenteLaboral.setPerteneceCADesc(request.getParameter("perteneceCADesc"));
					docenteLaboral.setInnovadoraConocimiento(Integer.parseInt(request.getParameter("innovadoraConocimiento")));
					docenteLaboral.setInnovadoraConocimientoDesc(request.getParameter("innovadoraConocimientoDesc"));
					docenteLaboral.setPtcRegistradoSNI(Integer.parseInt(request.getParameter("ptcRegistradoSNI")));
					docenteLaboral.setPtcRegistradoSNIDesc(request.getParameter("ptcRegistradoSNIDesc"));
					docenteLaboral.setImparteLicOtroPe(Integer.parseInt(request.getParameter("imparteLicOtroPe")));
					docenteLaboral.setImparteLicOtroPeDesc(request.getParameter("imparteLicOtroPeDesc"));
					docenteLaboral.setExperienciaDocente(Integer.parseInt(request.getParameter("experienciaDocente")));
					
					DocenteLaboralDao docenteLaboralDao = new DocenteLaboralDaoImpl(con);
					
					if (docenteLaboralDao.saveDocenteLaboral(docenteLaboral)) {
						jsonObj.put("mensajeAccion", 1);
					} else {
						jsonObj.put("mensajeAccion", 0);
					}
					
					out.println(jsonObj);
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
	
	
	
	public static JSONObject objectToJSONObject(Object object){
	    Object json = null;
	    JSONObject jsonObject = null;
	    try {
	        json = new JSONTokener(object.toString()).nextValue();
	    } catch (JSONException e) {
	        e.printStackTrace();
	    }
	    if (json instanceof JSONObject) {
	        jsonObject = (JSONObject) json;
	    }
	    return jsonObject;
	}

}
