package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.CarreraC;

public class CarreraCDaoImpl implements CarreraCDao {

	private static final Logger LOG = LogManager.getLogger("CarreraCDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public CarreraCDaoImpl(){};
	
	public CarreraCDaoImpl(Connection con){
		this.con = con;
	};
	
	
	@Override
	public ArrayList<CarreraC> getAll() {
		ArrayList<CarreraC> carrerasC = new ArrayList<CarreraC>();
		
		String sql = "SELECT * FROM CARRERA_C";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				CarreraC carreraC = new CarreraC(
						rs.getInt("id_carrera_c"),
						rs.getString("nombre_carrera"),
						rs.getString("acronimo_carrera"),
						rs.getString("nivel_estudio")
						);
				
				carrerasC.add(carreraC);
			}

		} catch (SQLException e) {
			carrerasC.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return carrerasC;
	}

}
