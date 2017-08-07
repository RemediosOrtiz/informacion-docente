package com.empresa.pojo;

public class CarreraUsuarioC {

	private Integer idCarreraUsuarioC;
	private String nombreCarreraUsuario;
	
	
	public CarreraUsuarioC() {
	}

	public CarreraUsuarioC(Integer idCarreraUsuarioC, String nombreCarreraUsuario) {
		this.idCarreraUsuarioC = idCarreraUsuarioC;
		this.nombreCarreraUsuario = nombreCarreraUsuario;
	}

	public Integer getIdCarreraUsuarioC() {
		return idCarreraUsuarioC;
	}

	public void setIdCarreraUsuarioC(Integer idCarreraUsuarioC) {
		this.idCarreraUsuarioC = idCarreraUsuarioC;
	}

	public String getNombreCarreraUsuario() {
		return nombreCarreraUsuario;
	}

	public void setNombreCarreraUsuario(String nombreCarreraUsuario) {
		this.nombreCarreraUsuario = nombreCarreraUsuario;
	}

	@Override
	public String toString() {
		return "CarreraUsuarioC [idCarreraUsuarioC=" + idCarreraUsuarioC + ", nombreCarreraUsuario="
				+ nombreCarreraUsuario + "]";
	}
}
