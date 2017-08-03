package com.empresa.pojo;

public class Reporte1 {
	private String nombramiento;
	private String sexoH;
	private Integer sexoHTotal;
	
	private String sexoM;
	private Integer sexoMTotal;
	
	private Integer total;
	
	public Reporte1(){}

	public Reporte1(String nombramiento, String sexoH, Integer sexoHTotal, String sexoM, Integer sexoMTotal,
			Integer total) {
		this.nombramiento = nombramiento;
		this.sexoH = sexoH;
		this.sexoHTotal = sexoHTotal;
		this.sexoM = sexoM;
		this.sexoMTotal = sexoMTotal;
		this.total = total;
	}

	public String getNombramiento() {
		return nombramiento;
	}

	public void setNombramiento(String nombramiento) {
		this.nombramiento = nombramiento;
	}

	public String getSexoH() {
		return sexoH;
	}

	public void setSexoH(String sexoH) {
		this.sexoH = sexoH;
	}

	public Integer getSexoHTotal() {
		return sexoHTotal;
	}

	public void setSexoHTotal(Integer sexoHTotal) {
		this.sexoHTotal = sexoHTotal;
	}

	public String getSexoM() {
		return sexoM;
	}

	public void setSexoM(String sexoM) {
		this.sexoM = sexoM;
	}

	public Integer getSexoMTotal() {
		return sexoMTotal;
	}

	public void setSexoMTotal(Integer sexoMTotal) {
		this.sexoMTotal = sexoMTotal;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Reporte1 [nombramiento=" + nombramiento + ", sexoH=" + sexoH + ", sexoHTotal=" + sexoHTotal + ", sexoM="
				+ sexoM + ", sexoMTotal=" + sexoMTotal + ", total=" + total + "]";
	}
}
