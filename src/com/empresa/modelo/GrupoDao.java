package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.Grupo;

public interface GrupoDao {
	Boolean save(Grupo grupo);
	ArrayList<Grupo> getAll();
	Grupo getGrupoById(Integer idGrupo);
}
