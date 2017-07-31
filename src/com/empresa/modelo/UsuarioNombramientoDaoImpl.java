package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.UsuarioNombramiento;

public class UsuarioNombramientoDaoImpl implements UsuarioNombramientoDao {

	private static final Logger LOG = LogManager.getLogger("UsuarioNombramientoDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UsuarioNombramientoDaoImpl() {}
	
	public UsuarioNombramientoDaoImpl(Connection con){
		this.con = con;
	}
	
	@Override
	public ArrayList<UsuarioNombramiento> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UsuarioNombramiento getUsuarioNombramientoById(Integer idUsuario) {

		UsuarioNombramiento usuarioNombramiento = new UsuarioNombramiento();
		
		try {
			String sql = "SELECT * FROM USUARIO_NOMBRAMIENTO WHERE id_usuario = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idUsuario);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				usuarioNombramiento.setIdNombramientoC(rs.getInt("id_nombramiento_c"));
				usuarioNombramiento.setIdUsuario(rs.getInt("id_usuario"));
			}
			
		} catch (SQLException e) {
			LOG.error("getUsuarioNombramientoById() " + e.getMessage());
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getUsuarioNombramientoById(): " + e.getMessage());
			}
		}
		
		return usuarioNombramiento;
	}

	@Override
	public Boolean save(UsuarioNombramiento usuarioNombramiento) {
		String sql = "INSERT INTO USUARIO_NOMBRAMIENTO (id_usuario, id_nombramiento_c) VALUES(?,?)";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, usuarioNombramiento.getIdUsuario());
			ps.setInt(2, usuarioNombramiento.getIdNombramientoC());
			
			ps.executeUpdate();
			ps.close();
			
			return true;
			
		} catch (SQLException e) {
			LOG.error("save(): " + e.getMessage());
			return false;
			
		} finally {
			
			try {
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - save(): " + e.getMessage());
			}
		}
	}

}
