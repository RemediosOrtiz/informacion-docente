package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.CarreraUsuarioC;

public class CarreraUsuarioCDaoImpl implements CarreraUsuarioCDao {

	private static final Logger LOG = LogManager.getLogger("CarreraUsuarioCDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public CarreraUsuarioCDaoImpl(){}
	
	public CarreraUsuarioCDaoImpl(Connection con){
		this.con = con;
	}
	
	@Override
	public ArrayList<CarreraUsuarioC> getAll() {
		ArrayList<CarreraUsuarioC> carrerasUsuarioC = new ArrayList<CarreraUsuarioC>();
		
		String sql = "SELECT * FROM CARRERA_USUARIO_C";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				CarreraUsuarioC carreraUsuarioC = new CarreraUsuarioC(
						rs.getInt("id_carrera_usuario_c"),
						rs.getString("nombre_carrera_usuario")
						);
				
				carrerasUsuarioC.add(carreraUsuarioC);
			}

		} catch (SQLException e) {
			carrerasUsuarioC.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return carrerasUsuarioC;
	}

}
