package com.empresa.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.empresa.conexion.ConexionBD;
import com.empresa.modelo.DireccionDao;
import com.empresa.modelo.DireccionDaoImpl;
import com.empresa.modelo.DocenteLaboralDao;
import com.empresa.modelo.DocenteLaboralDaoImpl;
import com.empresa.pojo.Direccion;
import com.empresa.pojo.DocenteLaboral;

public class TestDirecciones {

	public static void main(String[] args) {
		
		Connection con = null;
		
		try {
			con = ConexionBD.getConexionBD().getCon();
			
			DocenteLaboralDao docenteLaboralDao = new DocenteLaboralDaoImpl(con);
			DocenteLaboral docenteLaboral = docenteLaboralDao.getDocenteLaboralByIdUsuario(3);
			
			System.out.println(docenteLaboral.toString());
		
			
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
