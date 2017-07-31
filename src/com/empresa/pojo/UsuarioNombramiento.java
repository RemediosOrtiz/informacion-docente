package com.empresa.pojo;

public class UsuarioNombramiento {

	private Integer idUsuario;
	private Integer idNombramientoC;
	
	public UsuarioNombramiento() {
		
	}

	public UsuarioNombramiento(Integer idUsuario, Integer idNombramientoC) {
		this.idUsuario = idUsuario;
		this.idNombramientoC = idNombramientoC;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Integer getIdNombramientoC() {
		return idNombramientoC;
	}

	public void setIdNombramientoC(Integer idNombramientoC) {
		this.idNombramientoC = idNombramientoC;
	}

	@Override
	public String toString() {
		return "UsuarioNombramiento [idUsuario=" + idUsuario + ", idNombramientoC=" + idNombramientoC + "]";
	}
}
