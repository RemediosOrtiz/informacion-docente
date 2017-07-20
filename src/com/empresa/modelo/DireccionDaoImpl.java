package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.Direccion;

public class DireccionDaoImpl implements DireccionDao {
	
	private static final Logger LOG = LogManager.getLogger("DireccionDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public DireccionDaoImpl() {}
	
	public DireccionDaoImpl(Connection con){
		this.con = con;
	}

	@Override
	public ArrayList<Direccion> getAll() {
		
		ArrayList<Direccion> direcciones = new ArrayList<Direccion>();
		String sql = "SELECT * FROM DIRECCION";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				Direccion direccion = new Direccion(
						rs.getInt("id_direccion"),
						rs.getString("numero"),
						rs.getString("calle"),
						rs.getInt("cp"),
						rs.getInt("id_contacto"),
						rs.getInt("id_tipo_lugar"));
				
				direcciones.add(direccion);
			}

		} catch (SQLException e) {
			direcciones.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return direcciones;
	}
	

	@Override
	public Boolean save(Direccion direccion) {
		String sql = "INSERT INTO DIRECCION (numero, calle, cp, id_contacto, id_tipo_lugar) VALUES(?,?,?,?,?)";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setString(1, direccion.getNumero());
			ps.setString(2, direccion.getCalle());
			ps.setInt(3, direccion.getCp());
			ps.setInt(4, direccion.getIdContacto());
			ps.setInt(5, direccion.getIdTipoLugar());
			
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
	public ArrayList<Direccion> getAllByContactoId(Integer id_contacto) {
		
		ArrayList<Direccion> direcciones = new ArrayList<Direccion>();
		
		String sql = "SELECT * FROM DIRECCION WHERE id_contacto = ?";
		
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, id_contacto);
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				Direccion direccion = new Direccion(
						rs.getInt("id_direccion"),
						rs.getString("numero"),
						rs.getString("calle"),
						rs.getInt("cp"),
						rs.getInt("id_contacto"),
						rs.getInt("id_tipo_lugar"));
				
				direcciones.add(direccion);
			}

		} catch (SQLException e) {
			direcciones.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return direcciones;
	}
	
	

	@Override
	public Direccion getDireccionById(Integer idDireccion) {
		Direccion direccion = new Direccion();
		
		try {
			String sql = "SELECT * FROM DIRECCION WHERE id_direccion = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idDireccion);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				direccion.setIdDireccion(rs.getInt("id_direccion"));
				direccion.setNumero(rs.getString("numero"));
				direccion.setCalle(rs.getString("calle"));
				direccion.setCp(rs.getInt("cp"));
				direccion.setIdContacto(rs.getInt("id_contacto"));
				direccion.setIdTipoLugar(rs.getInt("id_tipo_lugar"));
			}
			
		} catch (SQLException e) {
			LOG.error("getDireccionById() " + e.getMessage());
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getDireccionById(): " + e.getMessage());
			}
		}
		
		return direccion;
	}

	@Override
	public Boolean update(Direccion direccion) {
		String sql = "UPDATE DIRECCION SET numero=?, calle=?, cp=?, id_contacto=?, id_tipo_lugar=? WHERE id_direccion = ?";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setString(1, direccion.getNumero());
			ps.setString(2, direccion.getCalle());
			ps.setInt(3, direccion.getCp());
			ps.setInt(4, direccion.getIdContacto());
			ps.setInt(5, direccion.getIdTipoLugar());
			ps.setInt(6, direccion.getIdDireccion());
			
			ps.executeUpdate();
			ps.close();
			
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

	
	
	@Override
	public Boolean deleteDireccionById(Integer idDireccion) {
		String sql = "DELETE FROM DIRECCION WHERE id_direccion = ?";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, idDireccion);
			
			ps.executeUpdate();
			ps.close();
			
			return true;
			
		} catch (SQLException e) {
			LOG.error("delete(): " + e.getMessage());
			return false;
			
		} finally {
			
			try {
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - delete(): " + e.getMessage());
			}
		}
	}

}
