package com.empresa.pojo;

public class ReporteGeneral {

	private String descNombramiento;
	private Integer total;
	
	public ReporteGeneral() {
	}
	public ReporteGeneral(String descNombramiento, Integer total) {
		this.descNombramiento = descNombramiento;
		this.total = total;
	}
	public String getDescNombramiento() {
		return descNombramiento;
	}
	public void setDescNombramiento(String descNombramiento) {
		this.descNombramiento = descNombramiento;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "ReporteGenerico [descNombramiento=" + descNombramiento + ", total=" + total + "]";
	}
}
