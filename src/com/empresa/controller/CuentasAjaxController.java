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
import com.empresa.modelo.UsuarioDao;
import com.empresa.modelo.UsuarioDaoImpl;
import com.empresa.pojo.Contacto;
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
					
					System.out.println(contacto);
					
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
