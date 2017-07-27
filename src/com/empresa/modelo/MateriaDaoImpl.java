package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.Materia;

public class MateriaDaoImpl implements MateriaDao {

	private static final Logger LOG = LogManager.getLogger("MateriaDaoImpl");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public MateriaDaoImpl(){};
	
	public MateriaDaoImpl(Connection con){
		this.con = con;
	};
	
	@Override
	public Boolean save(Materia materia) {
		String sql = "INSERT INTO MATERIA (id_materia_c, id_grupo, id_usuario, horas_general, horas_apoyo) VALUES (?, ?, ?, ?, ?)";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, materia.getIdMateriaC());
			ps.setInt(2, materia.getIdGrupo());
			ps.setInt(3, materia.getIdUsuario());
			ps.setInt(4, materia.getHorasGeneral());
			ps.setInt(5, materia.getHorasApoyo());
			
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
	public ArrayList<Materia> getAllByIdGrupo(Integer idGrupo) {
		
		ArrayList<Materia> materias = new ArrayList<Materia>();
		
		
		try {
			
			String sql = "SELECT * FROM MATERIA WHERE id_grupo = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, idGrupo);
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				Materia materia = new Materia();
				materia.setIdMatera(rs.getInt("id_materia"));
				materia.setIdMateriaC(rs.getInt("id_materia_c"));
				materia.setIdGrupo(rs.getInt("id_grupo"));
				materia.setIdUsuario(rs.getInt("id_usuario"));
				materia.setHorasGeneral(rs.getInt("horas_general"));
				materia.setHorasApoyo(rs.getInt("horas_apoyo"));
				
				materias.add(materia);
			}

		} catch (SQLException e) {
			materias.clear();
			LOG.error("getAllByIdGrupo(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAllByIdGrupo(): " + e.getMessage());
			}
		}
		
		return materias;
	}

	
}
