package com.empresa.pojo;

public class Direccion {

	private Integer idDireccion;
	private String numero;
	private String calle;
	private Integer cp;
	private Integer idContacto;
	private Integer idTipoLugar;
	
	public Direccion(){}
	
	public Direccion(Integer idDireccion, String numero, String calle, Integer cp, Integer idContacto,
			Integer idTipoLugar) {
		this.idDireccion = idDireccion;
		this.numero = numero;
		this.calle = calle;
		this.cp = cp;
		this.idContacto = idContacto;
		this.idTipoLugar = idTipoLugar;
	}

	public Integer getIdDireccion() {
		return idDireccion;
	}

	public void setIdDireccion(Integer idDireccion) {
		this.idDireccion = idDireccion;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public Integer getCp() {
		return cp;
	}

	public void setCp(Integer cp) {
		this.cp = cp;
	}

	public Integer getIdContacto() {
		return idContacto;
	}

	public void setIdContacto(Integer idContacto) {
		this.idContacto = idContacto;
	}

	public Integer getIdTipoLugar() {
		return idTipoLugar;
	}

	public void setIdTipoLugar(Integer idTipoLugar) {
		this.idTipoLugar = idTipoLugar;
	}

	@Override
	public String toString() {
		return "Direccion [idDireccion=" + idDireccion + ", numero=" + numero + ", calle=" + calle + ", cp=" + cp
				+ ", idContacto=" + idContacto + ", idTipoLugar=" + idTipoLugar + "]";
	}
	
}
