package com.empresa.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.empresa.conexion.ConexionBD;
import com.empresa.modelo.TipoLugarDao;
import com.empresa.modelo.TipoLugarDaoImpl;
import com.empresa.pojo.TipoLugar;

public class TestTipoUsario {

	public static void main(String[] args) {
Connection con = null;
		
		try {
			con = ConexionBD.getConexionBD().getCon();
			
			TipoLugarDao tipoLugarDao = new TipoLugarDaoImpl(con);
			
			ArrayList<TipoLugar> tipoLugares = tipoLugarDao.getAll();
			
			for (TipoLugar tipoLugar : tipoLugares) {
				System.out.println(tipoLugar.toString());
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
