package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.Usuario;

public class UsuarioDaoImpl implements UsuarioDao {
	
	private static final Logger LOG = LogManager.getLogger("UsuarioDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UsuarioDaoImpl() {}
	
	public UsuarioDaoImpl(Connection con){
		this.con = con;
	}
	
	@Override
	public ArrayList<Usuario> getAll() {

		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
		String sql = "SELECT * FROM USUARIO";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				Usuario usuario = new Usuario(
						rs.getInt("id_usuario"),
						rs.getString("matricula"),
						rs.getString("password"),
						rs.getInt("id_usuario_rol"),
						rs.getInt("estatus"),
						new UsuarioRolDaoImpl(con).getUsuarioRolById(rs.getInt("id_usuario_rol")),
						new ContactoDaoImpl(con).getContactoByIdUsuario(rs.getInt("id_usuario"))
						);
				usuarios.add(usuario);
			}

		} catch (SQLException e) {
			usuarios.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getUusarios(): " + e.getMessage());
			}
		}
		
		return usuarios;
	}

	@Override
	public Boolean save(Usuario usuario) {
		
		String sql = "INSERT INTO USUARIO (matricula, password, id_usuario_rol, estatus) VALUES(?,?,?,?)";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setString(1, usuario.getMatricula());
			ps.setString(2, usuario.getPassword());
			ps.setInt(3, usuario.getIdUsuarioRol());
			ps.setInt(4, usuario.getEstatus());
			
			ps.executeUpdate();
			
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

	@Override
	public Usuario getUsuarioById(Integer id) {
		
		Usuario usuario = new Usuario();
		
		try {
			String sql = "SELECT * FROM USUARIO WHERE id_usuario = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				usuario.setIdUsuario(rs.getInt("id_usuario"));
				usuario.setMatricula(rs.getString("matricula"));
				usuario.setPassword(null);
				usuario.setIdUsuarioRol(rs.getInt("id_usuario_rol"));
				usuario.setEstatus(rs.getInt("estatus"));
				usuario.setUsuarioRol(new UsuarioRolDaoImpl(con).getUsuarioRolById(rs.getInt("id_usuario_rol")));
				usuario.setContacto(new ContactoDaoImpl(con).getContactoByIdUsuario(rs.getInt("id_usuario")));
			}
		} catch (SQLException e) {
			LOG.error("getUsuarioById() " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getUsuarioByID(): " + e.getMessage());
			}
		}
		
		return usuario;
	}

	@Override
	public Usuario getUsuarioByMatricula(String matricula) {
		
		Usuario usuario = new Usuario();
		
		try {
			String sql = "SELECT * FROM USUARIO WHERE matricula = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, matricula);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				usuario.setIdUsuario(rs.getInt("id_usuario"));
				usuario.setMatricula(rs.getString("matricula"));
				usuario.setPassword(null);
				usuario.setIdUsuarioRol(rs.getInt("id_usuario_rol"));
				usuario.setEstatus(rs.getInt("estatus"));
				usuario.setUsuarioRol(new UsuarioRolDaoImpl(con).getUsuarioRolById(rs.getInt("id_usuario_rol")));
				usuario.setContacto(new ContactoDaoImpl(con).getContactoByIdUsuario(rs.getInt("id_usuario")));
			}
			
		} catch (SQLException e) {
			LOG.error("getUsuarioByMatricula(" + matricula + ") " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getUsuarioByMatricula(): " + e.getMessage());
			}
		}
		
		return usuario;
	}

	@Override
	public Boolean removeUsuarioById(Integer id) {
		
		String sql = "DELETE FROM USUARIO WHERE id_usuario = ?";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			return true;
			
		} catch (SQLException e) {
			LOG.error("removeUsuarioById(): " + e.getMessage());
			return false;
			
		} finally {
			
			try {
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - removeUsuarioById(): " + e.getMessage());
			}
		}
	}

	@Override
	public Boolean login(String matricula, String password) {
		
		String sql = "SELECT COUNT(*) AS COUNT FROM USUARIO WHERE matricula = ? AND password = ?";
		Integer contador = 0;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, matricula);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				contador = rs.getInt("COUNT");
			}
			
			return (contador == 0) ? false : true;
			
		} catch (Exception e) {
			LOG.error("login() " + e.getMessage());
			return false;
			
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - login(): " + e.getMessage());
			}
		}
	}

	@Override
	public Boolean update(Usuario usuario) {
		String sql = "UPDATE USUARIO SET matricula=?, password=?, id_usuario_rol=?, estatus=? WHERE id_usuario=?";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setString(1, usuario.getMatricula());
			ps.setString(2, usuario.getPassword());
			ps.setInt(3, usuario.getIdUsuarioRol());
			ps.setInt(4, usuario.getEstatus());
			ps.setInt(5, usuario.getIdUsuario());
			
			ps.executeUpdate();
			
			return true;
			
		} catch (SQLException e) {
			LOG.error("update(): " + e.getMessage());
			return false;
			
		} finally {
			
			try {
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - update(): " + e.getMessage());
			}
		}
	}

}
