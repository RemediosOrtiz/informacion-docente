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
	
	
	ArrayList<ReporteGeneral> getExperienciaDocente0();
	ArrayList<ReporteGeneral> getExperienciaDocente1A4();
	
	ArrayList<ReporteGeneral> getExperienciaLaboralMayorA10();
}
