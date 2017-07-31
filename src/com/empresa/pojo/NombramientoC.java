package com.empresa.pojo;

public class NombramientoC {

	private Integer idNombramientoC;
	private String descNombramiento;
	
	public NombramientoC(){	}

	public NombramientoC(Integer idNombramientoC, String descNombramiento) {
		this.idNombramientoC = idNombramientoC;
		this.descNombramiento = descNombramiento;
	}

	public Integer getIdNombramientoC() {
		return idNombramientoC;
	}

	public void setIdNombramientoC(Integer idNombramientoC) {
		this.idNombramientoC = idNombramientoC;
	}

	public String getDescNombramiento() {
		return descNombramiento;
	}

	public void setDescNombramiento(String descNombramiento) {
		this.descNombramiento = descNombramiento;
	}

	@Override
	public String toString() {
		return "NombramientoC [idNombramientoC=" + idNombramientoC + ", descNombramiento=" + descNombramiento + "]";
	}
}
