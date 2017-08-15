package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.ReporteGeneral;

public interface ReporteGeneralDao {

	// Solo profesores
	ArrayList<ReporteGeneral> getTSUHombres();
	ArrayList<ReporteGeneral> getTSUMujeres();
	ArrayList<ReporteGeneral> getTSUTotal();
	ArrayList<ReporteGeneral> getTSUTotalHoras();
	
	ArrayList<ReporteGeneral> getGradoEstudioTSU();
	ArrayList<ReporteGeneral> getGradoEstudioSinLicenciatura();
	ArrayList<ReporteGeneral> getGradoEstudioConLicenciatura();
	ArrayList<ReporteGeneral> getGradoEstudioEspecialidad();
	ArrayList<ReporteGeneral> getGradoEstudioTeacher();
	ArrayList<ReporteGeneral> getGradoEstudioSinMastria();
	ArrayList<ReporteGeneral> getGradoEstudioConMastria();
	ArrayList<ReporteGeneral> getGradoEstudioSinDoctorado();
	ArrayList<ReporteGeneral> getGradoEstudioConDoctorado();
	
	ArrayList<ReporteGeneral> getExperienciaDocente0();
	ArrayList<ReporteGeneral> getExperienciaDocente1A4();
	ArrayList<ReporteGeneral> getExperienciaDocente5A10();
	ArrayList<ReporteGeneral> getExperienciaDocenteMayorA10();
	
	ArrayList<ReporteGeneral> getExperienciaLaboral0();
	ArrayList<ReporteGeneral> getExperienciaLaboral1A4();
	ArrayList<ReporteGeneral> getExperienciaLaboral5A10();
	ArrayList<ReporteGeneral> getExperienciaLaboralMayorA10();
	
	ArrayList<ReporteGeneral> getDocenteParticipaEnCA();
	ArrayList<ReporteGeneral> getDocenteParticipaEnLineasInnovadoras();
	ArrayList<ReporteGeneral> getDocenteCuentaConPTC();
	ArrayList<ReporteGeneral> getDonceteCuentaConPROMEP();
	
}
