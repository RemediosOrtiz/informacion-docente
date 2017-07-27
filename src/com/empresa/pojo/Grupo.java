package com.empresa.pojo;

public class Grupo {

	private Integer idGrupo;
	private Integer idCuatriC;
	private Integer idCarreraC;
	private Integer idUsuario;
	private String nombreGrupo;
	private Integer idGrupoC;
	
	public Grupo(){}

	public Grupo(Integer idGrupo, Integer idCuatriC, Integer idCarreraC, Integer idUsuario, String nombreGrupo,
			Integer idGrupoC) {
		this.idGrupo = idGrupo;
		this.idCuatriC = idCuatriC;
		this.idCarreraC = idCarreraC;
		this.idUsuario = idUsuario;
		this.nombreGrupo = nombreGrupo;
		this.idGrupoC = idGrupoC;
	}

	public Integer getIdGrupo() {
		return idGrupo;
	}

	public void setIdGrupo(Integer idGrupo) {
		this.idGrupo = idGrupo;
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

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNombreGrupo() {
		return nombreGrupo;
	}

	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}

	public Integer getIdGrupoC() {
		return idGrupoC;
	}

	public void setIdGrupoC(Integer idGrupoC) {
		this.idGrupoC = idGrupoC;
	}

	@Override
	public String toString() {
		return "Grupo [idGrupo=" + idGrupo + ", idCuatriC=" + idCuatriC + ", idCarreraC=" + idCarreraC + ", idUsuario="
				+ idUsuario + ", nombreGrupo=" + nombreGrupo + ", idGrupoC=" + idGrupoC + "]";
	}
}
