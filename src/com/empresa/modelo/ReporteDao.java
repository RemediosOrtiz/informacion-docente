package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.Reporte1;
import com.empresa.pojo.Reporte2;
import com.empresa.pojo.Reporte4;
import com.empresa.pojo.ReporteGenerico;

public interface ReporteDao {

	ArrayList<Reporte1> getAllReporte1();
	ArrayList<Reporte2> getAllReporte2();
	ArrayList<Reporte4> getAllReporte4();
	ArrayList<ReporteGenerico> getAllReporte6();
	ArrayList<ReporteGenerico> getAllReporte7();
	ArrayList<ReporteGenerico> getAllReporte8();
	ArrayList<ReporteGenerico> getAllReporte9();
}
