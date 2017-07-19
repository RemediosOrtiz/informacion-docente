package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.Direccion;

public interface DireccionDao {

	ArrayList<Direccion> getAll();
	Boolean save(Direccion direcion);
	ArrayList<Direccion> getAllByContactoId(Integer id_contacto);
}