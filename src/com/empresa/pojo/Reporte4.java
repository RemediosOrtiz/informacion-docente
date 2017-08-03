package com.empresa.pojo;

public class Reporte4 {

	private String descNombramiento;
	private Integer idUsuaerio;
	private String sexo;
	private String nombre;
	private String apPaterno;
	private String apMaterno;
	private String anios;
	public Reporte4() {
		super();
	}
	public Reporte4(String descNombramiento, Integer idUsuaerio, String sexo, String nombre, String apPaterno,
			String apMaterno, String anios) {
		super();
		this.descNombramiento = descNombramiento;
		this.idUsuaerio = idUsuaerio;
		this.sexo = sexo;
		this.nombre = nombre;
		this.apPaterno = apPaterno;
		this.apMaterno = apMaterno;
		this.anios = anios;
	}
	public String getDescNombramiento() {
		return descNombramiento;
	}
	public void setDescNombramiento(String descNombramiento) {
		this.descNombramiento = descNombramiento;
	}
	public Integer getIdUsuaerio() {
		return idUsuaerio;
	}
	public void setIdUsuaerio(Integer idUsuaerio) {
		this.idUsuaerio = idUsuaerio;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApPaterno() {
		return apPaterno;
	}
	public void setApPaterno(String apPaterno) {
		this.apPaterno = apPaterno;
	}
	public String getApMaterno() {
		return apMaterno;
	}
	public void setApMaterno(String apMaterno) {
		this.apMaterno = apMaterno;
	}
	public String getAnios() {
		return anios;
	}
	public void setAnios(String anios) {
		this.anios = anios;
	}
	@Override
	public String toString() {
		return "Reporte4 [descNombramiento=" + descNombramiento + ", idUsuaerio=" + idUsuaerio + ", sexo=" + sexo
				+ ", nombre=" + nombre + ", apPaterno=" + apPaterno + ", apMaterno=" + apMaterno + ", anios=" + anios
				+ "]";
	}
	
	
	
}
