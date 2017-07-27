package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.Grupo;

public class GrupoDaoImpl implements GrupoDao{

	private static final Logger LOG = LogManager.getLogger("GrupoDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public GrupoDaoImpl(){};
	
	public GrupoDaoImpl(Connection con){
		this.con = con;
	};
	
	@Override
	public Boolean save(Grupo grupo) {
		String sql = "INSERT INTO GRUPO (id_cuatri_c, id_carrera_c, id_usuario, nombre_grupo, id_grupo_c) VALUES (?, ?, ?, ?, ?)";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, grupo.getIdCuatriC());
			ps.setInt(2, grupo.getIdCarreraC());
			ps.setInt(3, grupo.getIdUsuario());
			ps.setString(4, grupo.getNombreGrupo());
			ps.setInt(5, grupo.getIdGrupoC());
			
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
	public ArrayList<Grupo> getAll() {
		
		ArrayList<Grupo> grupos = new ArrayList<Grupo>();
		
		String sql = "SELECT * FROM GRUPO";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				Grupo grupo = new Grupo(
						rs.getInt("id_grupo"),
						rs.getInt("id_cuatri_c"),
						rs.getInt("id_carrera_c"),
						rs.getInt("id_usuario"),
						rs.getString("nombre_grupo"),
						rs.getInt("id_grupo_c")
						);
				
				grupos.add(grupo);
			}

		} catch (SQLException e) {
			grupos.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return grupos;
	}

	@Override
	public Grupo getGrupoById(Integer idGrupo) {
		
		Grupo grupo = new Grupo();
		
		try {
			String sql = "SELECT * FROM GRUPO WHERE id_grupo = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idGrupo);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				grupo.setIdGrupo(rs.getInt("id_grupo"));
				grupo.setIdCuatriC(rs.getInt("id_cuatri_c"));
				grupo.setIdCarreraC(rs.getInt("id_carrera_c"));
				grupo.setIdUsuario(rs.getInt("id_usuario"));
				grupo.setNombreGrupo(rs.getString("nombre_grupo"));
				grupo.setIdGrupoC(rs.getInt("id_grupo_c"));
			}
			
		} catch (SQLException e) {
			LOG.error("getGrupoById() " + e.getMessage());
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getGrupoById(): " + e.getMessage());
			}
		}
		
		return grupo;
	}

}
