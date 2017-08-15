package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.ReporteGeneral;

public class ReporteGeneralDaoImpl implements ReporteGeneralDao {

	private static final Logger LOG = LogManager.getLogger("ReporteGeneralDaoImpl");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public ReporteGeneralDaoImpl(){};
	
	public ReporteGeneralDaoImpl(Connection con){
		this.con = con;
	};
	
	@Override
	public ArrayList<ReporteGeneral> getTSUHombres() {
		
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN DOCENTE_LABORAL B ON A.id_usuario=B.id_usuario INNER JOIN CARRERA_C C ON B.id_carrera_c=C.id_carrera_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN CONTACTO F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol=4 AND F.sexo = 'Hombre' AND C.nivel_estudio = 'Nivel TSU' AND E.id_nombramiento_c=X.id_nombramiento_c GROUP BY E.desc_nombramiento) AS total FROM NOMBRAMIENTO_C X";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getTSUHombres(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getTSUMujeres() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN DOCENTE_LABORAL B ON A.id_usuario=B.id_usuario INNER JOIN CARRERA_C C ON B.id_carrera_c=C.id_carrera_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN CONTACTO F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol=4 AND F.sexo = 'Mujer' AND C.nivel_estudio = 'Nivel TSU' AND E.id_nombramiento_c=X.id_nombramiento_c GROUP BY E.desc_nombramiento) AS total FROM NOMBRAMIENTO_C X";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getTSUMujeres(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getTSUTotal() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN DOCENTE_LABORAL B ON A.id_usuario=B.id_usuario INNER JOIN CARRERA_C C ON B.id_carrera_c=C.id_carrera_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN CONTACTO F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol=4 AND C.nivel_estudio = 'Nivel TSU' AND E.id_nombramiento_c=X.id_nombramiento_c GROUP BY E.desc_nombramiento) AS total FROM NOMBRAMIENTO_C X";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getTSUTotal(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getTSUTotalHoras() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, ( SELECT SUM(horas_general + horas_apoyo) FROM USUARIO A INNER JOIN DOCENTE_LABORAL B ON A.id_usuario=B.id_usuario INNER JOIN CARRERA_C C ON B.id_carrera_c=C.id_carrera_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN CONTACTO F ON A.id_usuario=F.id_usuario INNER JOIN MATERIA G ON A.id_usuario=G.id_usuario WHERE A.id_usuario_rol=4 AND C.nivel_estudio = 'Nivel TSU' AND E.id_nombramiento_c=X.id_nombramiento_c  GROUP BY E.desc_nombramiento) AS total FROM NOMBRAMIENTO_C X";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getTSUTotalHoras(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getGradoEstudioTSU() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c WHERE C.desc_nivel_estudio = 'TSU' AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";

		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getGradoEstudioTSU(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getGradoEstudioSinLicenciatura() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c WHERE C.desc_nivel_estudio = 'LIC. SIN GRADO' AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";

		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getGradoEstudioSinLicenciatura(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getGradoEstudioConLicenciatura() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c WHERE C.desc_nivel_estudio = 'LIC. CON GRADO' AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";

		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getGradoEstudioConLicenciatura(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}
	
	
	@Override
	public ArrayList<ReporteGeneral> getGradoEstudioEspecialidad() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c WHERE C.desc_nivel_estudio = 'ESPECIALIDAD' AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";

		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getGradoEstudioEspecialidad(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getGradoEstudioTeacher() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c WHERE C.desc_nivel_estudio = 'TEACHER' AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";

		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getGradoEstudioTeacher(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;

	}

	@Override
	public ArrayList<ReporteGeneral> getGradoEstudioSinMastria() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c WHERE C.desc_nivel_estudio = 'MTRIA. SIN GRADO' AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";

		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getGradoEstudioSinMastria(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getGradoEstudioConMastria() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c WHERE C.desc_nivel_estudio = 'MTRIA. CON GRADO' AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";

		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getGradoEstudioConMastria(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getGradoEstudioSinDoctorado() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c WHERE C.desc_nivel_estudio = 'DOCTORADO SIN GRADO' AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";

		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getGradoEstudioSinDoctorado(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getGradoEstudioConDoctorado() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c WHERE C.desc_nivel_estudio = 'DOCTORADO CON GRADO' AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";

		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getGradoEstudioConDoctorado(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getExperienciaDocente0() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND F.experiencia_docente = 0 AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getExperienciaDocente0(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getExperienciaDocente1A4() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND F.experiencia_docente IN (1, 2, 3, 4) AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getExperienciaDocente1A4(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getExperienciaDocente5A10() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND F.experiencia_docente IN (5, 6, 7, 8, 9, 10) AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getExperienciaDocente5A10(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getExperienciaDocenteMayorA10() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND F.experiencia_docente > 10 AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getExperienciaDocenteMayorA10(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getExperienciaLaboral0() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND B.experiencia_laboral = 0 AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getExperienciaLaboral0(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getExperienciaLaboral1A4() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND B.experiencia_laboral IN (1, 2, 3, 4) AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getExperienciaLaboral1A4(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getExperienciaLaboral5A10() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND B.experiencia_laboral IN (5, 6, 7, 8, 9, 10) AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getExperienciaLaboral5A10(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getExperienciaLaboralMayorA10() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND B.experiencia_laboral > 10 AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getExperienciaLaboralMayorA10(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getDocenteParticipaEnCA() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND F.pertenece_ca = 1 AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getDocenteParticipaEnCA(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getDocenteParticipaEnLineasInnovadoras() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND F.innovadora_conocimiento = 1 AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getDocenteParticipaEnLineasInnovadoras(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getDocenteCuentaConPTC() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND F.ptc_registrado_sni = 1 AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getDocenteCuentaConPTC(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}

	@Override
	public ArrayList<ReporteGeneral> getDonceteCuentaConPROMEP() {
		ArrayList<ReporteGeneral> reportesGenerales = new ArrayList<ReporteGeneral>();
		
		String sql = "SELECT X.id_nombramiento_c AS desc_nombramiento, (SELECT COUNT(*) FROM USUARIO A INNER JOIN ESTUDIOS B ON A.id_usuario=B.id_usuario INNER JOIN NIVEL_ESTUDIO_C C ON B.id_nivel_estudio_c=C.id_nivel_estudio_c INNER JOIN USUARIO_NOMBRAMIENTO D ON A.id_usuario = D.id_usuario INNER JOIN NOMBRAMIENTO_C E ON D.id_nombramiento_c=E.id_nombramiento_c INNER JOIN DOCENTE_LABORAL F ON A.id_usuario=F.id_usuario WHERE A.id_usuario_rol = 4 AND F.reconocimiento_perfil_promep_sep = 1 AND E.id_nombramiento_c=X.id_nombramiento_c) AS total FROM NOMBRAMIENTO_C X";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				ReporteGeneral reporteGeneral = new ReporteGeneral();
				reporteGeneral.setDescNombramiento(rs.getString("desc_nombramiento"));
				reporteGeneral.setTotal(rs.getInt("total"));
				
				reportesGenerales.add(reporteGeneral);
			}

		} catch (SQLException e) {
			reportesGenerales.clear();
			LOG.error("getAllReporte1(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getDonceteCuentaConPROMEP(): " + e.getMessage());
			}
		}
		
		return reportesGenerales;
	}
	

}
