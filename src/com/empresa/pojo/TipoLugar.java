package com.empresa.pojo;

public class TipoLugar {

	private Integer idTipoLugar;
	private String descLugar;
	
	public TipoLugar(){}
	
	public TipoLugar(Integer idTipoLugar, String descLugar) {
		this.idTipoLugar = idTipoLugar;
		this.descLugar = descLugar;
	}

	public Integer getIdTipoLugar() {
		return idTipoLugar;
	}

	public void setIdTipoLugar(Integer idTipoLugar) {
		this.idTipoLugar = idTipoLugar;
	}

	public String getDescLugar() {
		return descLugar;
	}

	public void setDescLugar(String descLugar) {
		this.descLugar = descLugar;
	}

	@Override
	public String toString() {
		return "TipoLugar [idTipoLugar=" + idTipoLugar + ", descLugar=" + descLugar + "]";
	}
}
