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
				docenteLaboral.setIdCarreraC(rs.getInt("id_carrera_c"));
				docenteLaboral.setReconocimientoPerfilPromepSep(rs.getInt("reconocimiento_perfil_promep_sep"));
				docenteLaboral.setReconocimientoPerfilPromepSepDesc(rs.getString("reconocimiento_perfil_promep_sep_desc"));
				docenteLaboral.setPerteneceCA(rs.getInt("pertenece_ca"));
				docenteLaboral.setPerteneceCADesc(rs.getString("pertenece_ca_desc"));
				docenteLaboral.setInnovadoraConocimiento(rs.getInt("innovadora_conocimiento"));
				docenteLaboral.setInnovadoraConocimientoDesc(rs.getString("innovadora_conocimiento_desc"));
				docenteLaboral.setPtcRegistradoSNI(rs.getInt("ptc_registrado_sni"));
				docenteLaboral.setPtcRegistradoSNIDesc(rs.getString("ptc_registrado_sni_desc"));
				docenteLaboral.setImparteLicOtroPe(rs.getInt("imparte_lic_otro_pe"));
				docenteLaboral.setImparteLicOtroPeDesc(rs.getString("imparte_lic_otro_pe_desc"));
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
		String sql = "INSERT INTO DOCENTE_LABORAL (id_usuario, id_carrera_c, reconocimiento_perfil_promep_sep, reconocimiento_perfil_promep_sep_desc, pertenece_ca,"
				+ "pertenece_ca_desc, innovadora_conocimiento, innovadora_conocimiento_desc, ptc_registrado_sni, ptc_registrado_sni_desc, imparte_lic_otro_pe, imparte_lic_otro_pe_desc, "
				+ "experiencia_docente, alert_opcion_actializar) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, docenteLaboral.getIdUsuario());
			ps.setInt(2, docenteLaboral.getIdCarreraC());
			ps.setInt(3, docenteLaboral.getReconocimientoPerfilPromepSep());
			ps.setString(4, docenteLaboral.getReconocimientoPerfilPromepSepDesc());
			ps.setInt(5, docenteLaboral.getPerteneceCA());
			ps.setString(6, docenteLaboral.getPerteneceCADesc());
			ps.setInt(7, docenteLaboral.getInnovadoraConocimiento());
			ps.setString(8, docenteLaboral.getInnovadoraConocimientoDesc());
			ps.setInt(9, docenteLaboral.getPtcRegistradoSNI());
			ps.setString(10, docenteLaboral.getPtcRegistradoSNIDesc());
			ps.setInt(11, docenteLaboral.getImparteLicOtroPe());
			ps.setString(12, docenteLaboral.getImparteLicOtroPeDesc());
			ps.setInt(13, docenteLaboral.getExperienciaDocente());
			ps.setInt(14, docenteLaboral.getAlertOpcionActializar());
			
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
