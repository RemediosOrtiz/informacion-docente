package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.Usuario;

public interface UsuarioDao {

	ArrayList<Usuario> getAll();
	Boolean login(String matricula, String password);
	Usuario getUsuarioByMatricula(String matricula);
	Boolean save(Usuario usuario);
	Boolean update(Usuario usuario);
	Usuario getUsuarioById(Integer id);
	Boolean removeUsuarioById(Integer id);
}
