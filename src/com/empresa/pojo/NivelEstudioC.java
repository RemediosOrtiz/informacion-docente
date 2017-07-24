package com.empresa.pojo;

public class NivelEstudioC {

	private Integer idNivelEstudioC;
	private String descNivelEstudio;
	
	public NivelEstudioC(){}

	public NivelEstudioC(Integer idNivelEstudioC, String descNivelEstudio) {
		this.idNivelEstudioC = idNivelEstudioC;
		this.descNivelEstudio = descNivelEstudio;
	}

	public Integer getIdNivelEstudioC() {
		return idNivelEstudioC;
	}

	public void setIdNivelEstudioC(Integer idNivelEstudioC) {
		this.idNivelEstudioC = idNivelEstudioC;
	}

	public String getDescNivelEstudio() {
		return descNivelEstudio;
	}

	public void setDescNivelEstudio(String descNivelEstudio) {
		this.descNivelEstudio = descNivelEstudio;
	}

	@Override
	public String toString() {
		return "nivelEstudioC [idNivelEstudioC=" + idNivelEstudioC + ", descNivelEstudio=" + descNivelEstudio + "]";
	};
}
