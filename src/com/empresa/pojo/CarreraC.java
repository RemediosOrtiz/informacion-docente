package com.empresa.pojo;

public class CarreraC {

	private Integer idCarreraC;
	private String nombreCarrera;
	private String acronimoCarrera;
	private String nivelEstudio;
	
	public CarreraC(){}

	public CarreraC(Integer idCarreraC, String nombreCarrera, String acronimoCarrera,
			String nivelEstudio) {
		this.idCarreraC = idCarreraC;
		this.nombreCarrera = nombreCarrera;
		this.acronimoCarrera = acronimoCarrera;
		this.nivelEstudio = nivelEstudio;
	}

	public Integer getIdCarreraC() {
		return idCarreraC;
	}

	public void setIdCarreraC(Integer idCarreraC) {
		this.idCarreraC = idCarreraC;
	}

	public String getNombreCarrera() {
		return nombreCarrera;
	}

	public void setNombreCarrera(String nombreCarrera) {
		this.nombreCarrera = nombreCarrera;
	}

	public String getAcronimoCarrera() {
		return acronimoCarrera;
	}

	public void setAcronimoCarrera(String acronimoCarrera) {
		this.acronimoCarrera = acronimoCarrera;
	}

	public String getNivelEstudio() {
		return nivelEstudio;
	}

	public void setNivelEstudio(String nivelEstudio) {
		this.nivelEstudio = nivelEstudio;
	}

	@Override
	public String toString() {
		return "CarreraC [idCarreraC=" + idCarreraC + ", nombreCarrera=" + nombreCarrera + ", acronimoCarrera="
				+ acronimoCarrera + ", nivelEstudio=" + nivelEstudio + "]";
	}
}
