package com.empresa.modelo;

import com.empresa.pojo.Estudio;

public interface EstudioDao {

	Estudio getEstudioByIdUsuario(Integer idUsuario);
	
	Boolean save(Estudio estudio);
}
