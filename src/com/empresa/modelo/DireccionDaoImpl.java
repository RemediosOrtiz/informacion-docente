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
	public Boolean save(Direccion direcion) {
		return null;
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

}
