package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.Contacto;

public class ContactoDaoImpl implements ContactoDao {
	
	public static final Logger LOG = LogManager.getLogger("ContactoDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ContactoDaoImpl() {}
	
	public ContactoDaoImpl(Connection con){
		this.con = con;
	}
	
	@Override
	public ArrayList<Contacto> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Contacto getContactoById(Integer id) {
		Contacto contacto = new Contacto();
		
		try {
			String sql = "SELECT * FROM CONTACTO WHERE id_contacto = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				contacto.setIdContacto(rs.getInt("id_contacto"));
				contacto.setNombre(rs.getString("nombre"));
				contacto.setApPaterno(rs.getString("ap_paterno"));
				contacto.setApMaterno(rs.getString("ap_materno"));
				contacto.setSexo(rs.getString("sexo"));
				contacto.setfNacimiento(rs.getString("f_nacimiento"));
				contacto.setIdUsuario(rs.getInt("id_usuario"));
				contacto.setDiscapacidad(rs.getString("discapacidad"));
			}
			
		} catch (SQLException e) {
			LOG.error("getContactobyId() " + e.getMessage());
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getContactoByID(): " + e.getMessage());
			}
		}
		
		return contacto;
	}

	@Override
	public Boolean save(Contacto contacto) {
		
		String sql = "INSERT INTO CONTACTO (nombre, ap_paterno, ap_materno, sexo, f_nacimiento, id_usuario, discapacidad) VALUES(?,?,?,?,?,?,?)";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setString(1, contacto.getNombre());
			ps.setString(2, contacto.getApPaterno());
			ps.setString(3, contacto.getApMaterno());
			ps.setString(4, contacto.getSexo());
			ps.setString(5, contacto.getfNacimiento());
			ps.setInt(6, contacto.getIdUsuario());
			ps.setString(7, contacto.getDiscapacidad());
			
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

	@Override
	public Contacto getContactoByIdUsuario(Integer idUsuario) {
		
		Contacto contacto = new Contacto();
		try {
			String sql = "SELECT * FROM CONTACTO WHERE id_usuario = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idUsuario);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				contacto.setIdContacto(rs.getInt("id_contacto"));
				contacto.setNombre(rs.getString("nombre"));
				contacto.setApPaterno(rs.getString("ap_paterno"));
				contacto.setApMaterno(rs.getString("ap_materno"));
				contacto.setSexo(rs.getString("sexo"));
				contacto.setfNacimiento(rs.getString("f_nacimiento"));
				contacto.setIdUsuario(rs.getInt("id_usuario"));
				contacto.setDiscapacidad(rs.getString("discapacidad"));
			}
			
			
		} catch (SQLException e) {
			LOG.error("getContactobyId() " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getContactobyId(): " + e.getMessage());
			}
		}
		
		return contacto;
	}

	@Override
	public Boolean update(Contacto contacto) {
		String sql = "UPDATE CONTACTO SET nombre=?, ap_paterno=?, ap_materno=?, sexo=?, f_nacimiento=?, discapacidad=? WHERE id_contacto=?";
		
		try {
			
			ps = con.prepareStatement(sql);
			ps.setString(1, contacto.getNombre());
			ps.setString(2, contacto.getApPaterno());
			ps.setString(3, contacto.getApMaterno());
			ps.setString(4, contacto.getSexo());
			ps.setString(5, contacto.getfNacimiento());
			ps.setString(6, contacto.getDiscapacidad());
			ps.setInt(7, contacto.getIdContacto());
			
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
