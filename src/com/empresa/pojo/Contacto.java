package com.empresa.pojo;


public class Contacto {

	private Integer idContacto;
	private String nombre;
	private String apPaterno;
	private String apMaterno;
	private String sexo;
	private String fNacimiento;
	private Integer idUsuario;
	private String discapacidad;

	public Contacto() {}

	public Contacto(Integer idContacto, String nombre, String apPaterno, String apMaterno, String sexo,
			String fNacimiento, Integer idUsuario, String discapacidad) {
		super();
		this.idContacto = idContacto;
		this.nombre = nombre;
		this.apPaterno = apPaterno;
		this.apMaterno = apMaterno;
		this.sexo = sexo;
		this.fNacimiento = fNacimiento;
		this.idUsuario = idUsuario;
		this.discapacidad = discapacidad;
	}

	public Integer getIdContacto() {
		return idContacto;
	}

	public void setIdContacto(Integer idContacto) {
		this.idContacto = idContacto;
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

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getfNacimiento() {
		return fNacimiento;
	}

	public void setfNacimiento(String fNacimiento) {
		this.fNacimiento = fNacimiento;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getDiscapacidad() {
		return discapacidad;
	}

	public void setDiscapacidad(String discapacidad) {
		this.discapacidad = discapacidad;
	}

	@Override
	public String toString() {
		return "Contacto [idContacto=" + idContacto + ", nombre=" + nombre + ", apPaterno=" + apPaterno + ", apMaterno="
				+ apMaterno + ", sexo=" + sexo + ", fNacimiento=" + fNacimiento + ", idUsuario=" + idUsuario
				+ ", discapacidad=" + discapacidad + "]";
	}
}
