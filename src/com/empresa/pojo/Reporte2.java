package com.empresa.pojo;

public class Reporte2 {

	private String descNombramiento;
	private Integer clave;
	private String nombreGrupo;
	private Integer horas;
	
	public Reporte2(){
		
	}
	
	public Reporte2(String descNombramiento, Integer clave, String nombreGrupo, Integer horas) {
		this.descNombramiento = descNombramiento;
		this.clave = clave;
		this.nombreGrupo = nombreGrupo;
		this.horas = horas;
	}
	public String getDescNombramiento() {
		return descNombramiento;
	}
	public void setDescNombramiento(String descNombramiento) {
		this.descNombramiento = descNombramiento;
	}
	public Integer getClave() {
		return clave;
	}
	public void setClave(Integer clave) {
		this.clave = clave;
	}
	public String getNombreGrupo() {
		return nombreGrupo;
	}
	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}
	public Integer getHoras() {
		return horas;
	}
	public void setHoras(Integer horas) {
		this.horas = horas;
	}
	@Override
	public String toString() {
		return "Reporte2 [descNombramiento=" + descNombramiento + ", clave=" + clave + ", nombreGrupo=" + nombreGrupo
				+ ", horas=" + horas + "]";
	}
}
