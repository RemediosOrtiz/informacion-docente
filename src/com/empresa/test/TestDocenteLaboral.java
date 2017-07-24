package com.empresa.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.empresa.conexion.ConexionBD;
import com.empresa.modelo.DireccionDao;
import com.empresa.modelo.DireccionDaoImpl;
import com.empresa.pojo.Direccion;

public class TestDocenteLaboral {

	public static void main(String[] args) {
		
		Connection con = null;
		
		try {
			con = ConexionBD.getConexionBD().getCon();
			
			DireccionDao direccionDao = new DireccionDaoImpl(con);
			
			ArrayList<Direccion> direcciones = direccionDao.getAllByContactoId(1);
			
			for (Direccion direccion : direcciones) {
				System.out.println(direccion.toString());
			}
		
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("ERROR: " + e.getMessage());
			
		} finally {
			
			try {
				if (con != null) con.close();
			} catch (SQLException e) {
				System.out.println("ERROR: " + e.getMessage());
			}
		}

	}

}
