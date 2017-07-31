package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.UsuarioNombramiento;

public interface UsuarioNombramientoDao {

	ArrayList<UsuarioNombramiento> getAll();
	UsuarioNombramiento getUsuarioNombramientoById(Integer idUsuario);
	Boolean save(UsuarioNombramiento usuarioNombramiento);
}
