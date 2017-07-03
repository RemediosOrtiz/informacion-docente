package com.empresa.pojo;

public class Usuario {

	private Integer idUsuario;
	private String matricula; // Funciona como usuario del sistema
	private String password;
	private Integer idUsuarioRol;
	private Integer estatus;
	
	private UsuarioRol usuarioRol;
	private Contacto contacto;
	
	public Usuario() {	}

	public Usuario(Integer idUsuario, String matricula, String password, Integer idUsuarioRol, Integer estatus,
			UsuarioRol usuarioRol, Contacto contacto) {
		this.idUsuario = idUsuario;
		this.matricula = matricula;
		this.password = password;
		this.idUsuarioRol = idUsuarioRol;
		this.estatus = estatus;
		this.usuarioRol = usuarioRol;
		this.contacto = contacto;
	}

	public Usuario(Integer idUsuario, String matricula, String password, Integer idUsuarioRol, Integer estatus) {
		this.idUsuario = idUsuario;
		this.matricula = matricula;
		this.password = password;
		this.idUsuarioRol = idUsuarioRol;
		this.estatus = estatus;
	}
	
	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getIdUsuarioRol() {
		return idUsuarioRol;
	}

	public void setIdUsuarioRol(Integer idUsuarioRol) {
		this.idUsuarioRol = idUsuarioRol;
	}

	public Integer getEstatus() {
		return estatus;
	}

	public void setEstatus(Integer estatus) {
		this.estatus = estatus;
	}

	public Contacto getContacto() {
		return contacto;
	}

	public void setContacto(Contacto contacto) {
		this.contacto = contacto;
	}

	@Override
	public String toString() {
		return "Usuario [idUsuario=" + idUsuario + ", matricula=" + matricula + ", password=" + password
				+ ", idUsuarioRol=" + idUsuarioRol + ", estatus=" + estatus + ", usuarioRol=" + usuarioRol
				+ ", contacto=" + contacto + "]";
	}
}
