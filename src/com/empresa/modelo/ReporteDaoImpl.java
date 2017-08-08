package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.Reporte1;
import com.empresa.pojo.Reporte2;
import com.empresa.pojo.Reporte4;
import com.empresa.pojo.ReporteGenerico;
import com.empresa.pojo.ReporteHorasContratacion;

public class ReporteDaoImpl implements ReporteDao {

	private static final Logger LOG = LogManager.getLogger("ReporteDaoImpl");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public ReporteDaoImpl(){};
	
	public ReporteDaoImpl(Connection con){
		this.con = con;
	};
	
	@Override
	public ArrayList<Reporte1> getAllReporte1() {
		ArrayList<Reporte1> reportes1 = new ArrayList<Reporte1>();
		
		String sql = "SELECT X.desc_nombramiento AS nombramiento, 'Hombres' AS sexo_h, (SELECT COUNT(*) AS total FROM USUARIO A JOIN CONTACTO B ON A.id_usuario=B.id_usuario JOIN USUARIO_NOMBRAMIENTO C ON A.id_usuario=C.id_usuario JOIN NOMBRAMIENTO_C D ON C. id_nombramiento_c=D.id_nombramiento_c WHERE A.id_usuario_rol = 4 AND B.sexo = 'Hombre' AND D.id_nombramiento_c = X.id_nombramiento_c GROUP BY  D.desc_nombramiento)   AS sexo_h_total, 'Mujer' AS sexo_m, (SELECT IF(COUNT(*) IS NULL, 0, COUNT(*)) AS total FROM USUARIO A JOIN CONTACTO B ON A.id_usuario=B.id_usuario JOIN USUARIO_NOMBRAMIENTO C ON A.id_usuario=C.id_usuario JOIN NOMBRAMIENTO_C D ON C. id_nombramiento_c=D.id_nombramiento_c WHERE A.id_usuario_rol = 4 AND B.sexo = 'Mujer' AND D.id_nombramiento_c = X.id_nombramiento_c GROUP BY  D.desc_nombramiento) AS sexo_m_total, (SELECT IF(COUNT(*) IS NULL, 0, COUNT(*)) AS total FROM USUARIO A JOIN CONTACTO B ON A.id_usuario=B.id_usuario JOIN USUARIO_NOMBRAMIENTO C ON A.id_usuario=C.id_usuario JOIN NOMBRAMIENTO_C D ON C. id_nombramiento_c=D.id_nombramiento_c WHERE A.id_usuario_rol = 4 AND D.id_nombramiento_c = X.id_nombramiento_c GROUP BY  D.desc_nombramiento) AS total FROM NOMBRAMIENTO_C X;";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				Reporte1 reporte1 = new Reporte1(
						rs.getString("nombramiento"),
						rs.getString("sexo_h"),
						rs.getInt("sexo_h_total"),
						rs.getString("sexo_m"),
						rs.getInt("sexo_m_total"),
						rs.getInt("total")
						);
				
				reportes1.add(reporte1);
			}

		} catch (SQLException e) {
			reportes1.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAllReporte1(): " + e.getMessage());
			}
		}
		
		return reportes1;
	}

	@Override
	public ArrayList<Reporte2> getAllReporte2() {
		
		ArrayList<Reporte2> reportes2 = new ArrayList<Reporte2>();
		
		String sql ="SELECT W.desc_nombramiento, X.id_grupo AS CLAVE, X.nombre_grupo, (SELECT SUM(horas_general) FROM MATERIA A INNER JOIN GRUPO B ON A.id_grupo=B.id_grupo WHERE B.id_grupo = X.id_grupo) AS horas FROM GRUPO X INNER JOIN USUARIO Y ON X.id_usuario=Y.id_usuario INNER JOIN USUARIO_NOMBRAMIENTO Z ON Y.id_usuario=Z.id_usuario INNER JOIN NOMBRAMIENTO_C W ON Z. id_nombramiento_c=W.id_nombramiento_c";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				Reporte2 reporte2 = new Reporte2(
						rs.getString("desc_nombramiento"),
						rs.getInt("CLAVE"),
						rs.getString("nombre_grupo"),
						rs.getInt("horas"));
				
				reportes2.add(reporte2);
			}

		} catch (SQLException e) {
			reportes2.clear();
			LOG.error("getAllReporte2(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAllReporte2(): " + e.getMessage());
			}
		}
		
		return reportes2;
	}

	@Override
	public ArrayList<Reporte4> getAllReporte4() {
		ArrayList<Reporte4> reportes4 = new ArrayList<Reporte4>();
		
		String sql = "SELECT W.desc_nombramiento, A.id_usuario, B.sexo, B.nombre, B.ap_paterno, B.ap_materno, SUM(A.experiencia_docente) AS anios FROM  USUARIO Y INNER JOIN USUARIO_NOMBRAMIENTO Z ON Y.id_usuario=Z.id_usuario INNER JOIN NOMBRAMIENTO_C W ON Z. id_nombramiento_c=W.id_nombramiento_c INNER JOIN DOCENTE_LABORAL A ON Y.id_usuario=A.id_usuario INNER JOIN CONTACTO B ON Y.id_usuario=B.id_usuario group by A.id_usuario, W.desc_nombramiento ORDER BY 1";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				Reporte4 reporte4 = new Reporte4(
						rs.getString("desc_nombramiento"),
						rs.getInt("id_usuario"),
						rs.getString("sexo"),
						rs.getString("nombre"),
						rs.getString("ap_paterno"),
						rs.getString("ap_materno"),
						rs.getString("anios")
						);
				
				reportes4.add(reporte4);
			}

		} catch (SQLException e) {
			reportes4.clear();
			LOG.error("getAllReporte4(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAllReporte4(): " + e.getMessage());
			}
		}
		
		return reportes4;
	}

	@Override
	public ArrayList<ReporteGenerico> getAllReporte6() {
		ArrayList<ReporteGenerico> reporteGenericos = new ArrayList<ReporteGenerico>();
		
		String sql = "SELECT D.desc_nombramiento, COUNT(*) AS total FROM USUARIO A INNER JOIN CONTACTO B ON A.id_usuario=B.id_usuario INNER JOIN USUARIO_NOMBRAMIENTO C ON A.id_usuario=C.id_usuario INNER JOIN NOMBRAMIENTO_C D ON C. id_nombramiento_c=D.id_nombramiento_c INNER JOIN DOCENTE_LABORAL E ON A.id_usuario=E.id_usuario WHERE A.id_usuario_rol = 4 AND E.pertenece_ca = 1 GROUP BY D.desc_nombramiento ORDER BY 1";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGenerico reporteGenerico = new ReporteGenerico(
						rs.getString("desc_nombramiento"),
						rs.getInt("total"));
				
				reporteGenericos.add(reporteGenerico);
			}

		} catch (SQLException e) {
			reporteGenericos.clear();
			LOG.error("getAllReporte5(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAllReporte5(): " + e.getMessage());
			}
		}
		
		return reporteGenericos;
	}

	@Override
	public ArrayList<ReporteGenerico> getAllReporte7() {
		ArrayList<ReporteGenerico> reporteGenericos = new ArrayList<ReporteGenerico>();
		
		String sql = "SELECT D.desc_nombramiento, COUNT(*) AS total FROM USUARIO A INNER JOIN CONTACTO B ON A.id_usuario=B.id_usuario INNER JOIN USUARIO_NOMBRAMIENTO C ON A.id_usuario=C.id_usuario INNER JOIN NOMBRAMIENTO_C D ON C. id_nombramiento_c=D.id_nombramiento_c INNER JOIN DOCENTE_LABORAL E ON A.id_usuario=E.id_usuario WHERE A.id_usuario_rol = 4 AND E.innovadora_conocimiento = 1 GROUP BY D.desc_nombramiento ORDER BY 1";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGenerico reporteGenerico = new ReporteGenerico(
						rs.getString("desc_nombramiento"),
						rs.getInt("total"));
				
				reporteGenericos.add(reporteGenerico);
			}

		} catch (SQLException e) {
			reporteGenericos.clear();
			LOG.error("getAllReporte5(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAllReporte5(): " + e.getMessage());
			}
		}
		
		return reporteGenericos;
	}

	@Override
	public ArrayList<ReporteGenerico> getAllReporte8() {
ArrayList<ReporteGenerico> reporteGenericos = new ArrayList<ReporteGenerico>();
		
		String sql = "SELECT D.desc_nombramiento, COUNT(*) AS total FROM USUARIO A INNER JOIN CONTACTO B ON A.id_usuario=B.id_usuario INNER JOIN USUARIO_NOMBRAMIENTO C ON A.id_usuario=C.id_usuario INNER JOIN NOMBRAMIENTO_C D ON C. id_nombramiento_c=D.id_nombramiento_c INNER JOIN DOCENTE_LABORAL E ON A.id_usuario=E.id_usuario WHERE A.id_usuario_rol = 4 AND E.ptc_registrado_sni = 1 GROUP BY D.desc_nombramiento ORDER BY 1";;
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGenerico reporteGenerico = new ReporteGenerico(
						rs.getString("desc_nombramiento"),
						rs.getInt("total"));
				
				reporteGenericos.add(reporteGenerico);
			}

		} catch (SQLException e) {
			reporteGenericos.clear();
			LOG.error("getAllReporte5(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAllReporte5(): " + e.getMessage());
			}
		}
		
		return reporteGenericos;
	}

	@Override
	public ArrayList<ReporteGenerico> getAllReporte9() {
		ArrayList<ReporteGenerico> reporteGenericos = new ArrayList<ReporteGenerico>();
		
		String sql = "SELECT D.desc_nombramiento, COUNT(*) AS total FROM USUARIO A INNER JOIN CONTACTO B ON A.id_usuario=B.id_usuario INNER JOIN USUARIO_NOMBRAMIENTO C ON A.id_usuario=C.id_usuario INNER JOIN NOMBRAMIENTO_C D ON C. id_nombramiento_c=D.id_nombramiento_c INNER JOIN DOCENTE_LABORAL E ON A.id_usuario=E.id_usuario WHERE A.id_usuario_rol = 4 AND E.reconocimiento_perfil_promep_sep = 1 GROUP BY D.desc_nombramiento ORDER BY 1;";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGenerico reporteGenerico = new ReporteGenerico(
						rs.getString("desc_nombramiento"),
						rs.getInt("total"));
				
				reporteGenericos.add(reporteGenerico);
			}

		} catch (SQLException e) {
			reporteGenericos.clear();
			LOG.error("getAllReporte5(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAllReporte5(): " + e.getMessage());
			}
		}
		
		return reporteGenericos;
	}

	@Override
	public ArrayList<ReporteHorasContratacion> getAllReporteHorasContratacion() {

		ArrayList<ReporteHorasContratacion> reportesHorasContratacion = new ArrayList<ReporteHorasContratacion>();
		
		String sql = "SELECT B.nombre, B.ap_paterno, B.ap_materno, (SELECT AA.desc_nombramiento FROM NOMBRAMIENTO_C AA INNER JOIN USUARIO_NOMBRAMIENTO AB ON AA.id_nombramiento_c=AB.id_nombramiento_c WHERE AB.id_usuario = A.id_usuario) AS desc_nombramiento, (SELECT SUM(horas_general) FROM MATERIA WHERE id_usuario = A.id_usuario) AS hrs_grupo, (SELECT SUM(horas_apoyo) FROM MATERIA WHERE id_usuario = A.id_usuario) AS hrs_apoyo, (SELECT SUM(horas_general + horas_apoyo) FROM MATERIA WHERE id_usuario = A.id_usuario) AS hrs_total FROM USUARIO A INNER JOIN CONTACTO B ON A.id_usuario=B.id_usuario WHERE A.id_usuario_rol = 4";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteHorasContratacion reporteHorasContratacion = new ReporteHorasContratacion();
				reporteHorasContratacion.setNombre(rs.getString("nombre"));
				reporteHorasContratacion.setApPaterno(rs.getString("ap_paterno"));
				reporteHorasContratacion.setApMaterno(rs.getString("ap_materno"));
				reporteHorasContratacion.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteHorasContratacion.setHrsGrupo(rs.getInt("hrs_grupo"));
				reporteHorasContratacion.setHrsApoyo(rs.getInt("hrs_apoyo"));
				reporteHorasContratacion.setHrsTotal(rs.getInt("hrs_total"));
				
				reportesHorasContratacion.add(reporteHorasContratacion);
			}

		} catch (SQLException e) {
			reportesHorasContratacion.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAllReporte1(): " + e.getMessage());
			}
		}
		
		return reportesHorasContratacion;
	}

}
