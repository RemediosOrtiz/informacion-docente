package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.Contacto;

public interface ContactoDao {

	ArrayList<Contacto> getAll();
	Contacto getContactoById(Integer id);
	Contacto getContactoByIdUsuario(Integer idUsuario);
	Boolean save(Contacto contacto);
	Boolean update(Contacto contacto);
}
