package com.empresa.pojo;

public class UsuarioRol {

	private Integer idUsuarioRol;
	private String descRol;
	
	public UsuarioRol() {}

	public UsuarioRol(Integer idUsuarioRol, String descRol) {
		this.idUsuarioRol = idUsuarioRol;
		this.descRol = descRol;
	}

	public Integer getIdUsuarioRol() {
		return idUsuarioRol;
	}

	public void setIdUsuarioRol(Integer idUsuarioRol) {
		this.idUsuarioRol = idUsuarioRol;
	}

	public String getDescRol() {
		return descRol;
	}

	public void setDescRol(String descRol) {
		this.descRol = descRol;
	}

	@Override
	public String toString() {
		return "UsuarioRol [idUsuarioRol=" + idUsuarioRol + ", descRol=" + descRol + "]";
	}
}
