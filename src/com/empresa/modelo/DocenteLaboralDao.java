package com.empresa.modelo;

import com.empresa.pojo.DocenteLaboral;

public interface DocenteLaboralDao {
	
	DocenteLaboral getDocenteLaboralByIdUsuario(Integer idUsuario);
	Boolean saveDocenteLaboral(DocenteLaboral docenteLaboral);
}
