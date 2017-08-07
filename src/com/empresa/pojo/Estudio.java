package com.empresa.pojo;

public class Estudio {

	private Integer idUsuario;
	private Integer idCarreraUsuarioC;
	private Integer idNivelEstudioC;
	private String especialidadDesc;
	private Integer continuidadEstudios;
	private String continuidadEstudiosQueEstudia;
	private String continuidadEstudiosLugar;
	private Integer continuidadEstudiosTieneBeca;
	private String continuidadEstudiosTieneBecaDesc;
	private String fIngreso;
	private Integer experienciaLaboral;
	
	public Estudio() {
	}

	public Estudio(Integer idUsuario, Integer idCarreraUsuarioC, Integer idNivelEstudioC, String especialidadDesc,
			Integer continuidadEstudios, String continuidadEstudiosQueEstudia, String continuidadEstudiosLugar,
			Integer continuidadEstudiosTieneBeca, String continuidadEstudiosTieneBecaDesc, String fIngreso,
			Integer experienciaLaboral) {
		this.idUsuario = idUsuario;
		this.idCarreraUsuarioC = idCarreraUsuarioC;
		this.idNivelEstudioC = idNivelEstudioC;
		this.especialidadDesc = especialidadDesc;
		this.continuidadEstudios = continuidadEstudios;
		this.continuidadEstudiosQueEstudia = continuidadEstudiosQueEstudia;
		this.continuidadEstudiosLugar = continuidadEstudiosLugar;
		this.continuidadEstudiosTieneBeca = continuidadEstudiosTieneBeca;
		this.continuidadEstudiosTieneBecaDesc = continuidadEstudiosTieneBecaDesc;
		this.fIngreso = fIngreso;
		this.experienciaLaboral = experienciaLaboral;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Integer getIdCarreraUsuarioC() {
		return idCarreraUsuarioC;
	}

	public void setIdCarreraUsuarioC(Integer idCarreraUsuarioC) {
		this.idCarreraUsuarioC = idCarreraUsuarioC;
	}

	public Integer getIdNivelEstudioC() {
		return idNivelEstudioC;
	}

	public void setIdNivelEstudioC(Integer idNivelEstudioC) {
		this.idNivelEstudioC = idNivelEstudioC;
	}

	public String getEspecialidadDesc() {
		return especialidadDesc;
	}

	public void setEspecialidadDesc(String especialidadDesc) {
		this.especialidadDesc = especialidadDesc;
	}

	public Integer getContinuidadEstudios() {
		return continuidadEstudios;
	}

	public void setContinuidadEstudios(Integer continuidadEstudios) {
		this.continuidadEstudios = continuidadEstudios;
	}

	public String getContinuidadEstudiosQueEstudia() {
		return continuidadEstudiosQueEstudia;
	}

	public void setContinuidadEstudiosQueEstudia(String continuidadEstudiosQueEstudia) {
		this.continuidadEstudiosQueEstudia = continuidadEstudiosQueEstudia;
	}

	public String getContinuidadEstudiosLugar() {
		return continuidadEstudiosLugar;
	}

	public void setContinuidadEstudiosLugar(String continuidadEstudiosLugar) {
		this.continuidadEstudiosLugar = continuidadEstudiosLugar;
	}

	public Integer getContinuidadEstudiosTieneBeca() {
		return continuidadEstudiosTieneBeca;
	}

	public void setContinuidadEstudiosTieneBeca(Integer continuidadEstudiosTieneBeca) {
		this.continuidadEstudiosTieneBeca = continuidadEstudiosTieneBeca;
	}

	public String getContinuidadEstudiosTieneBecaDesc() {
		return continuidadEstudiosTieneBecaDesc;
	}

	public void setContinuidadEstudiosTieneBecaDesc(String continuidadEstudiosTieneBecaDesc) {
		this.continuidadEstudiosTieneBecaDesc = continuidadEstudiosTieneBecaDesc;
	}

	public String getfIngreso() {
		return fIngreso;
	}

	public void setfIngreso(String fIngreso) {
		this.fIngreso = fIngreso;
	}

	public Integer getExperienciaLaboral() {
		return experienciaLaboral;
	}

	public void setExperienciaLaboral(Integer experienciaLaboral) {
		this.experienciaLaboral = experienciaLaboral;
	}

	@Override
	public String toString() {
		return "Estudio [idUsuario=" + idUsuario + ", idCarreraUsuarioC=" + idCarreraUsuarioC + ", idNivelEstudioC="
				+ idNivelEstudioC + ", especialidadDesc=" + especialidadDesc + ", continuidadEstudios="
				+ continuidadEstudios + ", continuidadEstudiosQueEstudia=" + continuidadEstudiosQueEstudia
				+ ", continuidadEstudiosLugar=" + continuidadEstudiosLugar + ", continuidadEstudiosTieneBeca="
				+ continuidadEstudiosTieneBeca + ", continuidadEstudiosTieneBecaDesc="
				+ continuidadEstudiosTieneBecaDesc + ", fIngreso=" + fIngreso + ", experienciaLaboral="
				+ experienciaLaboral + "]";
	}
}
