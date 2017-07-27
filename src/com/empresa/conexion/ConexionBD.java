package com.empresa.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class ConexionBD {
	
	private static final ConexionBD conexionBD = new ConexionBD();
	
	private final String USERNAME = "homestead"; // "homestead";
	private final String PASSWORD = "secret"; // "secret";
	private final String HOST = "127.0.0.1";
	private final String PORT = "33060"; // "33060";
	private final String DATABASE = "SISTEMA_GESTOR_DOCENTE";
	private final String CLASSNAME = "com.mysql.jdbc.Driver";
	private final String SSL = "?autoReconnect=true&useSSL=false";
	
	private final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE + SSL;
	
	private Connection con;
	
	/**
     * Contructor privado que evita crear nuevas
     * instancias de esta clase.
     */
	private ConexionBD() {	}
	
	/**
     * Método que retorna una unica instacia
     * de la clase ConexionBD
     * @return conexionBD ConexionBD
     */
	public static ConexionBD getConexionBD() {
		return conexionBD;
	}
	
	/**
     * Método que devuelve la conexión
     * del singleton ConexionBD
     * @return con Connection
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
     */
	public Connection getCon() throws ClassNotFoundException, SQLException  {
		
		Class.forName(CLASSNAME);
		con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		return con;
	}
	
	/**
	 * Método que permite modificar
	 * la conexión del singleton
	 * @param con Connection
	 */
	public void setCon(Connection con) {
		this.con = con;
	}
}
