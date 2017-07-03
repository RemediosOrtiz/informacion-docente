package com.empresa.pojo;

public class UsuarioRol {

	private Integer IdUsuarioRol;
	private String descRol;
	
	public UsuarioRol() {}
	
	public UsuarioRol(Integer idUsuarioRol, String descRol) {
		IdUsuarioRol = idUsuarioRol;
		this.descRol = descRol;
	}

	public Integer getIdUsuarioRol() {
		return IdUsuarioRol;
	}

	public void setIdUsuarioRol(Integer idUsuarioRol) {
		IdUsuarioRol = idUsuarioRol;
	}

	public String getDescRol() {
		return descRol;
	}

	public void setDescRol(String descRol) {
		this.descRol = descRol;
	}

	@Override
	public String toString() {
		return "UsuarioRol [IdUsuarioRol=" + IdUsuarioRol + ", descRol=" + descRol + "]";
	}
}
