package com.empresa.modelo;

import java.util.ArrayList;

import com.empresa.pojo.MateriaC;

public interface MateriaCDao {

	ArrayList<MateriaC> getAll();
	ArrayList<MateriaC> getAllByIdCuatriAndByIdCarrera(Integer idCuatriC, Integer idCarreraC);
}
