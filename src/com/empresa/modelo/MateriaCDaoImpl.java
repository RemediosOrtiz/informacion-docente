package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.MateriaC;

public class MateriaCDaoImpl implements MateriaCDao {

	private static final Logger LOG = LogManager.getLogger("MateriaCDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public MateriaCDaoImpl(){}
	
	public MateriaCDaoImpl(Connection con){
		this.con = con;
	}
	
	@Override
	public ArrayList<MateriaC> getAll() {

		ArrayList<MateriaC> materiasC = new ArrayList<MateriaC>();
		
		String sql = "SELECT * FROM MATERIA_C";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				MateriaC materiaC = new MateriaC(
						rs.getInt("id_materia_c"),
						rs.getInt("id_cuatri_c"),
						rs.getInt("id_carrera_c"),
						rs.getString("nombre_materia"));
				
				materiasC.add(materiaC);
			}

		} catch (SQLException e) {
			materiasC.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return materiasC;
	}

	
	
	
	@Override
	public ArrayList<MateriaC> getAllByIdCuatriAndByIdCarrera(Integer idCuatriC, Integer idCarreraC) {
		ArrayList<MateriaC> materiasC = new ArrayList<MateriaC>();
		
		try {
			
			String sql = "SELECT * FROM MATERIA_C WHERE id_cuatri_C = ? AND id_carrera_c = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idCuatriC);
			ps.setInt(2, idCarreraC);
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				MateriaC materiaC = new MateriaC(
						rs.getInt("id_materia_c"),
						rs.getInt("id_cuatri_c"),
						rs.getInt("id_carrera_c"),
						rs.getString("nombre_materia"));
				
				materiasC.add(materiaC);
			}

		} catch (SQLException e) {
			materiasC.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return materiasC;
	}

}
