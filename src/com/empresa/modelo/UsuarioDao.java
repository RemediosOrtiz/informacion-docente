package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.Usuario;

public interface UsuarioDao {

	ArrayList<Usuario> getAll();
	Usuario getUsuarioLogin(String matricula, String password);
	Usuario getUsuarioByMatricula(String matricula);
	Boolean save(Usuario usuario);
	Usuario getUsuarioById(Integer id);
	Boolean removeUsuarioById(Integer id);
}
