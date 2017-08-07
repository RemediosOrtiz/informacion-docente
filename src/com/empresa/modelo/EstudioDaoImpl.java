package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.Estudio;

public class EstudioDaoImpl implements EstudioDao {

	public static final Logger LOG = LogManager.getLogger("EstudioDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public EstudioDaoImpl() {}
	
	public EstudioDaoImpl(Connection con) {
		this.con=con;
	}
	
	@Override
	public Estudio getEstudioByIdUsuario(Integer idUsuario) {
		
		Estudio estudio = new Estudio();
		
		try {
			String sql = "SELECT * FROM ESTUDIOS WHERE id_usuario = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idUsuario);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				estudio.setIdUsuario(rs.getInt("id_usuario"));
				estudio.setIdCarreraUsuarioC(rs.getInt("id_carrera_usuario_c"));
				estudio.setIdNivelEstudioC(rs.getInt("id_nivel_estudio_c"));
				estudio.setEspecialidadDesc(rs.getString("especialidad_desc"));
				estudio.setContinuidadEstudios(rs.getInt("continuidad_estudios"));
				estudio.setContinuidadEstudiosQueEstudia(rs.getString("continuidad_estudios_que_estudia"));
				estudio.setContinuidadEstudiosLugar(rs.getString("continuidad_estudios_lugar"));
				estudio.setContinuidadEstudiosTieneBeca(rs.getInt("continuidad_estudios_tiene_beca"));
				estudio.setContinuidadEstudiosTieneBecaDesc(rs.getString("continuidad_estudios_tiene_beca_desc"));
				estudio.setfIngreso(rs.getString("f_ingreso"));
				estudio.setExperienciaLaboral(rs.getInt("experiencia_laboral"));
			}
			
			
		} catch (SQLException e) {
			LOG.error("getEstudioByIdUsuario() " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getEstudioByIdUsuario(): " + e.getMessage());
			}
		}
		
		return estudio;
	}

	@Override
	public Boolean save(Estudio estudio) {
		String sql = "INSERT INTO ESTUDIOS (id_usuario, id_carrera_usuario_c, id_nivel_estudio_c, especialidad_desc, continuidad_estudios, continuidad_estudios_que_estudia, continuidad_estudios_lugar, continuidad_estudios_tiene_beca, continuidad_estudios_tiene_beca_desc, f_ingreso, experiencia_laboral) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, estudio.getIdUsuario());
			ps.setInt(2, estudio.getIdCarreraUsuarioC());
			ps.setInt(3, estudio.getIdNivelEstudioC());
			ps.setString(4, estudio.getEspecialidadDesc());
			ps.setInt(5, estudio.getContinuidadEstudios());
			ps.setString(6, estudio.getContinuidadEstudiosQueEstudia());
			ps.setString(7, estudio.getContinuidadEstudiosLugar());
			ps.setInt(8, estudio.getContinuidadEstudiosTieneBeca());
			ps.setString(9, estudio.getContinuidadEstudiosTieneBecaDesc());
			ps.setString(10, estudio.getfIngreso());
			ps.setInt(11, estudio.getExperienciaLaboral());
			
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
