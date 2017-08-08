package com.empresa.pojo;

public class ReporteHorasContratacion {

	private String nombre;
	private String apPaterno;
	private String apMaterno;
	private String descNombramiento;
	private Integer hrsGrupo;
	private Integer hrsApoyo;
	private Integer hrsTotal;
	
	public ReporteHorasContratacion() {
	}
	
	public ReporteHorasContratacion(String nombre, String apPaterno, String apMaterno, String descNombramiento,
			Integer hrsGrupo, Integer hrsApoyo, Integer hrsTotal) {
		this.nombre = nombre;
		this.apPaterno = apPaterno;
		this.apMaterno = apMaterno;
		this.descNombramiento = descNombramiento;
		this.hrsGrupo = hrsGrupo;
		this.hrsApoyo = hrsApoyo;
		this.hrsTotal = hrsTotal;
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
	public String getDescNombramiento() {
		return descNombramiento;
	}
	public void setDescNombramiento(String descNombramiento) {
		this.descNombramiento = descNombramiento;
	}
	public Integer getHrsGrupo() {
		return hrsGrupo;
	}
	public void setHrsGrupo(Integer hrsGrupo) {
		this.hrsGrupo = hrsGrupo;
	}
	public Integer getHrsApoyo() {
		return hrsApoyo;
	}
	public void setHrsApoyo(Integer hrsApoyo) {
		this.hrsApoyo = hrsApoyo;
	}
	public Integer getHrsTotal() {
		return hrsTotal;
	}
	public void setHrsTotal(Integer hrsTotal) {
		this.hrsTotal = hrsTotal;
	}
	@Override
	public String toString() {
		return "ReporteHorasContratacion [nombre=" + nombre + ", apPaterno=" + apPaterno + ", apMaterno=" + apMaterno
				+ ", descNombramiento=" + descNombramiento + ", hrsGrupo=" + hrsGrupo + ", hrsApoyo=" + hrsApoyo
				+ ", hrsTotal=" + hrsTotal + "]";
	}
}
