package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.Direccion;

public interface DireccionDao {

	ArrayList<Direccion> getAll();
	Boolean save(Direccion direccion);
	ArrayList<Direccion> getAllByContactoId(Integer id_contacto);
	Direccion getDireccionById(Integer idDireccion);
	Boolean update(Direccion direccion);
	Boolean deleteDireccionById(Integer idDireccion);
}