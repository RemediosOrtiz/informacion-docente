package com.empresa.pojo;

public class DocenteLaboral {
	
	private Integer idUsuario;
	private Integer idCarreraC;
	private Integer reconocimientoPerfilPromepSep;
	private String reconocimientoPerfilPromepSepDesc;
	private Integer perteneceCA;
	private String perteneceCADesc;
	private Integer innovadoraConocimiento;
	private String innovadoraConocimientoDesc;
	private Integer ptcRegistradoSNI;
	private String ptcRegistradoSNIDesc;
	private Integer imparteLicOtroPe;
	private String imparteLicOtroPeDesc;
	private Integer experienciaDocente;
	private Integer alertOpcionActializar; // Puede ser de un select con valor 1, 2, 3, etc
	
	
	public DocenteLaboral(){}


	public DocenteLaboral(Integer idUsuario, Integer idCarreraC, Integer reconocimientoPerfilPromepSep,
			String reconocimientoPerfilPromepSepDesc, Integer perteneceCA, String perteneceCADesc,
			Integer innovadoraConocimiento, String innovadoraConocimientoDesc, Integer ptcRegistradoSNI,
			String ptcRegistradoSNIDesc, Integer imparteLicOtroPe, String imparteLicOtroPeDesc,
			Integer experienciaDocente, Integer alertOpcionActializar) {
		super();
		this.idUsuario = idUsuario;
		this.idCarreraC = idCarreraC;
		this.reconocimientoPerfilPromepSep = reconocimientoPerfilPromepSep;
		this.reconocimientoPerfilPromepSepDesc = reconocimientoPerfilPromepSepDesc;
		this.perteneceCA = perteneceCA;
		this.perteneceCADesc = perteneceCADesc;
		this.innovadoraConocimiento = innovadoraConocimiento;
		this.innovadoraConocimientoDesc = innovadoraConocimientoDesc;
		this.ptcRegistradoSNI = ptcRegistradoSNI;
		this.ptcRegistradoSNIDesc = ptcRegistradoSNIDesc;
		this.imparteLicOtroPe = imparteLicOtroPe;
		this.imparteLicOtroPeDesc = imparteLicOtroPeDesc;
		this.experienciaDocente = experienciaDocente;
		this.alertOpcionActializar = alertOpcionActializar;
	}


	public Integer getIdUsuario() {
		return idUsuario;
	}


	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}


	public Integer getIdCarreraC() {
		return idCarreraC;
	}


	public void setIdCarreraC(Integer idCarreraC) {
		this.idCarreraC = idCarreraC;
	}


	public Integer getReconocimientoPerfilPromepSep() {
		return reconocimientoPerfilPromepSep;
	}


	public void setReconocimientoPerfilPromepSep(Integer reconocimientoPerfilPromepSep) {
		this.reconocimientoPerfilPromepSep = reconocimientoPerfilPromepSep;
	}


	public String getReconocimientoPerfilPromepSepDesc() {
		return reconocimientoPerfilPromepSepDesc;
	}


	public void setReconocimientoPerfilPromepSepDesc(String reconocimientoPerfilPromepSepDesc) {
		this.reconocimientoPerfilPromepSepDesc = reconocimientoPerfilPromepSepDesc;
	}


	public Integer getPerteneceCA() {
		return perteneceCA;
	}


	public void setPerteneceCA(Integer perteneceCA) {
		this.perteneceCA = perteneceCA;
	}


	public String getPerteneceCADesc() {
		return perteneceCADesc;
	}


	public void setPerteneceCADesc(String perteneceCADesc) {
		this.perteneceCADesc = perteneceCADesc;
	}


	public Integer getInnovadoraConocimiento() {
		return innovadoraConocimiento;
	}


	public void setInnovadoraConocimiento(Integer innovadoraConocimiento) {
		this.innovadoraConocimiento = innovadoraConocimiento;
	}


	public String getInnovadoraConocimientoDesc() {
		return innovadoraConocimientoDesc;
	}


	public void setInnovadoraConocimientoDesc(String innovadoraConocimientoDesc) {
		this.innovadoraConocimientoDesc = innovadoraConocimientoDesc;
	}


	public Integer getPtcRegistradoSNI() {
		return ptcRegistradoSNI;
	}


	public void setPtcRegistradoSNI(Integer ptcRegistradoSNI) {
		this.ptcRegistradoSNI = ptcRegistradoSNI;
	}


	public String getPtcRegistradoSNIDesc() {
		return ptcRegistradoSNIDesc;
	}


	public void setPtcRegistradoSNIDesc(String ptcRegistradoSNIDesc) {
		this.ptcRegistradoSNIDesc = ptcRegistradoSNIDesc;
	}


	public Integer getImparteLicOtroPe() {
		return imparteLicOtroPe;
	}


	public void setImparteLicOtroPe(Integer imparteLicOtroPe) {
		this.imparteLicOtroPe = imparteLicOtroPe;
	}


	public String getImparteLicOtroPeDesc() {
		return imparteLicOtroPeDesc;
	}


	public void setImparteLicOtroPeDesc(String imparteLicOtroPeDesc) {
		this.imparteLicOtroPeDesc = imparteLicOtroPeDesc;
	}


	public Integer getExperienciaDocente() {
		return experienciaDocente;
	}


	public void setExperienciaDocente(Integer experienciaDocente) {
		this.experienciaDocente = experienciaDocente;
	}


	public Integer getAlertOpcionActializar() {
		return alertOpcionActializar;
	}


	public void setAlertOpcionActializar(Integer alertOpcionActializar) {
		this.alertOpcionActializar = alertOpcionActializar;
	}


	@Override
	public String toString() {
		return "DocenteLaboral [idUsuario=" + idUsuario + ", idCarreraC=" + idCarreraC
				+ ", reconocimientoPerfilPromepSep=" + reconocimientoPerfilPromepSep
				+ ", reconocimientoPerfilPromepSepDesc=" + reconocimientoPerfilPromepSepDesc + ", perteneceCA="
				+ perteneceCA + ", perteneceCADesc=" + perteneceCADesc + ", innovadoraConocimiento="
				+ innovadoraConocimiento + ", innovadoraConocimientoDesc=" + innovadoraConocimientoDesc
				+ ", ptcRegistradoSNI=" + ptcRegistradoSNI + ", ptcRegistradoSNIDesc=" + ptcRegistradoSNIDesc
				+ ", imparteLicOtroPe=" + imparteLicOtroPe + ", imparteLicOtroPeDesc=" + imparteLicOtroPeDesc
				+ ", experienciaDocente=" + experienciaDocente + ", alertOpcionActializar=" + alertOpcionActializar
				+ "]";
	}
	
}
