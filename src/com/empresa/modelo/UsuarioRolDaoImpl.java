package com.empresa.modelo;

import java.sql.Connection;
import java.sql.ResultSet;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.UsuarioRol;
import com.mysql.jdbc.PreparedStatement;

public class UsuarioRolDaoImpl implements UsuarioRolDao {

	public static final Logger LOG = LogManager.getLogger("UsuarioRolDaoImpl: ");
	// Singleton conexion
	private Connection con;
	
	
	public UsuarioRolDaoImpl() {}
	
	public UsuarioRolDaoImpl(Connection con) {
		this.con = con;
	}
	
	@Override
	public UsuarioRol getUsuarioRolById(Integer id) {
		
		UsuarioRol usuarioRol = new UsuarioRol();
		
		try {
			String sql = "SELECT * FROM USUARIO_ROL WHERE id_usuario_rol = ?";
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				usuarioRol.setIdUsuarioRol(rs.getInt("id_usuario_rol"));
				usuarioRol.setDescRol(rs.getString("desc_rol"));
			}
			
			ps.close();
			rs.close();
			
		} catch (Exception e) {
			LOG.error("getUsuarioRolById("+ id +") : " + e.getMessage());
		}
		
		return usuarioRol;
	}

}
