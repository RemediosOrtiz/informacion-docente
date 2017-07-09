package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.Usuario;
import com.empresa.pojo.UsuarioRol;

public class UsuarioRolDaoImpl implements UsuarioRolDao {

	public static final Logger LOG = LogManager.getLogger("UsuarioRolDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public UsuarioRolDaoImpl() {}
	
	public UsuarioRolDaoImpl(Connection con) {
		this.con = con;
	}
	
	@Override
	public UsuarioRol getUsuarioRolById(Integer id) {
		
		UsuarioRol usuarioRol = new UsuarioRol();
		
		try {
			String sql = "SELECT * FROM USUARIO_ROL WHERE id_usuario_rol = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				usuarioRol.setIdUsuarioRol(rs.getInt("id_usuario_rol"));
				usuarioRol.setDescRol(rs.getString("desc_rol"));
			}
			
		} catch (SQLException e) {
			LOG.error("getUsuarioRolById(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getUsuarioRolById(): " + e.getMessage());
			}
		}
		
		return usuarioRol;
	}

	@Override
	public ArrayList<UsuarioRol> getAll() {
		
		ArrayList<UsuarioRol> usuariosRol = new ArrayList<UsuarioRol>();
		String sql = "SELECT * FROM USUARIO_ROL";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				UsuarioRol usuarioRol = new UsuarioRol(
						rs.getInt("id_usuario_rol"),
						rs.getString("desc_rol")
						);
				usuariosRol.add(usuarioRol);
			}

		} catch (SQLException e) {
			usuariosRol.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return usuariosRol;
	}

}
