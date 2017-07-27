package com.empresa.pojo;

public class Materia {

	private Integer idMatera;
	private Integer idMateriaC;
	private Integer idGrupo;
	private Integer idUsuario;
	private Integer horasGeneral;
	private Integer horasApoyo;
	
	public Materia() {
	}

	public Materia(Integer idMatera, Integer idMateriaC, Integer idGrupo, Integer idUsuario, Integer horasGeneral,
			Integer horasApoyo) {
		this.idMatera = idMatera;
		this.idMateriaC = idMateriaC;
		this.idGrupo = idGrupo;
		this.idUsuario = idUsuario;
		this.horasGeneral = horasGeneral;
		this.horasApoyo = horasApoyo;
	}

	public Integer getIdMatera() {
		return idMatera;
	}

	public void setIdMatera(Integer idMatera) {
		this.idMatera = idMatera;
	}

	public Integer getIdMateriaC() {
		return idMateriaC;
	}

	public void setIdMateriaC(Integer idMateriaC) {
		this.idMateriaC = idMateriaC;
	}

	public Integer getIdGrupo() {
		return idGrupo;
	}

	public void setIdGrupo(Integer idGrupo) {
		this.idGrupo = idGrupo;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Integer getHorasGeneral() {
		return horasGeneral;
	}

	public void setHorasGeneral(Integer horasGeneral) {
		this.horasGeneral = horasGeneral;
	}

	public Integer getHorasApoyo() {
		return horasApoyo;
	}

	public void setHorasApoyo(Integer horasApoyo) {
		this.horasApoyo = horasApoyo;
	}

	@Override
	public String toString() {
		return "Materia [idMatera=" + idMatera + ", idMateriaC=" + idMateriaC + ", idGrupo=" + idGrupo + ", idUsuario="
				+ idUsuario + ", horasGeneral=" + horasGeneral + ", horasApoyo=" + horasApoyo + "]";
	}
}
