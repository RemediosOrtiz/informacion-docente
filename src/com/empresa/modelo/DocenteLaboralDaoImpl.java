package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.Contacto;
import com.empresa.pojo.DocenteLaboral;

public class DocenteLaboralDaoImpl implements DocenteLaboralDao{
	
	public static final Logger LOG = LogManager.getLogger("DocenteLaboralDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public DocenteLaboralDaoImpl() {}
	
	public DocenteLaboralDaoImpl(Connection con) {
		this.con=con;
	}

	@Override
	public DocenteLaboral getDocenteLaboralByIdUsuario(Integer idUsuario) {
		
		DocenteLaboral docenteLaboral = new DocenteLaboral();
		
		try {
			String sql = "SELECT * FROM DOCENTE_LABORAL WHERE id_usuario = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idUsuario);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				docenteLaboral.setIdUsuario(rs.getInt("id_usuario"));
				docenteLaboral.setIdNivelEstudio(rs.getInt("id_nivel_estudio_c"));
				docenteLaboral.setIdCarreraC(rs.getInt("id_carrera_c"));
				docenteLaboral.setReconocimientoPerfilPromepSep(rs.getInt("reconocimiento_perfil_promep_sep"));
				docenteLaboral.setReconocimientoPerfilPromepSepDesc(rs.getString("reconocimiento_perfil_promep_sep_desc"));
				docenteLaboral.setPerteneceCA(rs.getInt("pertenece_ca"));
				docenteLaboral.setPerteneceCADesc(rs.getString("pertenece_ca_desc"));
				docenteLaboral.setInnovadoraConocimiento(rs.getInt("innovadora_conocimiento"));
				docenteLaboral.setInnovadoraConocimientoDesc(rs.getString("innovadora_conocimiento_desc"));
				docenteLaboral.setPtcRegistradoSNI(rs.getInt("ptc_registrado_sni"));
				docenteLaboral.setPtcRegistradoSNIDesc(rs.getString("ptc_registrado_sni_desc"));
				docenteLaboral.setEspecialidadDesc(rs.getString("especialidad_desc"));
				
				docenteLaboral.setContinuidadEstudios(rs.getInt("continuidad_estudios"));
				docenteLaboral.setContinuidadEstudiosQueEstudio(rs.getString("continuidad_estudios_que_estudia"));
				docenteLaboral.setContinuidadEstudiosLugar(rs.getString("continuidad_estudios_lugar"));
				docenteLaboral.setContinuidadEstudiosTieneBeca(rs.getInt("continuidad_estudios_tiene_beca"));
				docenteLaboral.setContinuidadEstudiosTieneBecaDesc(rs.getString("continuidad_estudios_tiene_beca_desc"));
				docenteLaboral.setImparteLicOtroPe(rs.getInt("imparte_lic_otro_pe"));
				docenteLaboral.setImparteLicOtroPeDesc(rs.getString("imparte_lic_otro_pe_desc"));
				docenteLaboral.setfIngreso(rs.getString("f_ingreso"));
				docenteLaboral.setExperienciaLaboral(rs.getInt("experiencia_laboral"));
				docenteLaboral.setExperienciaDocente(rs.getInt("experiencia_docente"));
				docenteLaboral.setAlertOpcionActializar(rs.getInt("alert_opcion_actializar"));
				
			}
			
			
		} catch (SQLException e) {
			LOG.error("getDocenteLaboralByIdUsuario() " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getDocenteLaboralByIdUsuario(): " + e.getMessage());
			}
		}
		
		return docenteLaboral;
	}

	@Override
	public Boolean saveDocenteLaboral(DocenteLaboral docenteLaboral) {
		String sql = "INSERT INTO DOCENTE_LABORAL (id_nivel_estudio_c, id_usuario, id_carrera_c, reconocimiento_perfil_promep_sep, reconocimiento_perfil_promep_sep_desc,"
				+ "pertenece_ca, pertenece_ca_desc, innovadora_conocimiento, innovadora_conocimiento_desc, ptc_registrado_sni, ptc_registrado_sni_desc,"
				+ "especialidad_desc, continuidad_estudios, continuidad_estudios_que_estudia, continuidad_estudios_lugar, continuidad_estudios_tiene_beca,"
				+ "continuidad_estudios_tiene_beca_desc, imparte_lic_otro_pe, imparte_lic_otro_pe_desc, f_ingreso, experiencia_laboral,"
				+ "experiencia_docente, alert_opcion_actializar) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, docenteLaboral.getIdNivelEstudio());
			ps.setInt(2, docenteLaboral.getIdUsuario());
			ps.setInt(3, docenteLaboral.getIdCarreraC());
			ps.setInt(4, docenteLaboral.getReconocimientoPerfilPromepSep());
			ps.setString(5, docenteLaboral.getReconocimientoPerfilPromepSepDesc());
			ps.setInt(6, docenteLaboral.getPerteneceCA());
			ps.setString(7, docenteLaboral.getPerteneceCADesc());
			ps.setInt(8, docenteLaboral.getInnovadoraConocimiento());
			ps.setString(9, docenteLaboral.getInnovadoraConocimientoDesc());
			ps.setInt(10, docenteLaboral.getPtcRegistradoSNI());
			ps.setString(11, docenteLaboral.getPtcRegistradoSNIDesc());
			ps.setString(12, docenteLaboral.getEspecialidadDesc());
			ps.setInt(13, docenteLaboral.getContinuidadEstudios());
			ps.setString(14, docenteLaboral.getContinuidadEstudiosQueEstudio());
			ps.setString(15, docenteLaboral.getContinuidadEstudiosLugar());
			ps.setInt(16, docenteLaboral.getContinuidadEstudiosTieneBeca());
			ps.setString(17, docenteLaboral.getContinuidadEstudiosTieneBecaDesc());
			ps.setInt(18, docenteLaboral.getImparteLicOtroPe());
			ps.setString(19, docenteLaboral.getImparteLicOtroPeDesc());
			ps.setString(20, docenteLaboral.getfIngreso());
			ps.setInt(21, docenteLaboral.getExperienciaLaboral());
			ps.setInt(22, docenteLaboral.getExperienciaDocente());
			ps.setInt(23, docenteLaboral.getAlertOpcionActializar());
			
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
