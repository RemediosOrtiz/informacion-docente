package com.empresa.modelo;

import com.empresa.pojo.UsuarioRol;

public interface UsuarioRolDao {
	/**
	 * Devuelve un rol de usuario por id
	 * @param id
	 * @return UsuarioRol
	 */
	UsuarioRol getUsuarioRolById(Integer id);
}
