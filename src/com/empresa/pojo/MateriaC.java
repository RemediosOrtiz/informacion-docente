package com.empresa.pojo;

public class MateriaC {

	private Integer idMateriaC;
	private Integer idCuatriC;
	private Integer idCarreraC;
	private String nombreMateria;
	
	
	public MateriaC() {
	}


	public MateriaC(Integer idMateriaC, Integer idCuatriC, Integer idCarreraC, String nombreMateria) {
		super();
		this.idMateriaC = idMateriaC;
		this.idCuatriC = idCuatriC;
		this.idCarreraC = idCarreraC;
		this.nombreMateria = nombreMateria;
	}


	public Integer getIdMateriaC() {
		return idMateriaC;
	}


	public void setIdMateriaC(Integer idMateriaC) {
		this.idMateriaC = idMateriaC;
	}


	public Integer getIdCuatriC() {
		return idCuatriC;
	}


	public void setIdCuatriC(Integer idCuatriC) {
		this.idCuatriC = idCuatriC;
	}


	public Integer getIdCarreraC() {
		return idCarreraC;
	}


	public void setIdCarreraC(Integer idCarreraC) {
		this.idCarreraC = idCarreraC;
	}


	public String getNombreMateria() {
		return nombreMateria;
	}


	public void setNombreMateria(String nombreMateria) {
		this.nombreMateria = nombreMateria;
	}


	@Override
	public String toString() {
		return "MateriaC [idMateriaC=" + idMateriaC + ", idCuatriC=" + idCuatriC + ", idCarreraC=" + idCarreraC
				+ ", nombreMateria=" + nombreMateria + "]";
	}
	
}
