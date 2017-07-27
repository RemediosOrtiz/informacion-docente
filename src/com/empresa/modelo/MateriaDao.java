package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.Materia;

public interface MateriaDao {

	Boolean save(Materia materia);
	ArrayList<Materia> getAllByIdGrupo(Integer idGrupo);
}
