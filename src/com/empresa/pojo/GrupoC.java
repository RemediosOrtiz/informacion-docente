package com.empresa.pojo;

public class GrupoC {

	private Integer idGrupoC;

	public GrupoC(){}

	public GrupoC(Integer idGrupoC) {
		this.idGrupoC = idGrupoC;
	}

	public Integer getIdGrupoC() {
		return idGrupoC;
	}

	public void setIdGrupoC(Integer idGrupoC) {
		this.idGrupoC = idGrupoC;
	}

	@Override
	public String toString() {
		return "GrupoC [idGrupoC=" + idGrupoC + "]";
	}
}