package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.CuatriC;

public class CuatriCDaoImpl implements CuatriCDao {
	
	private static final Logger LOG = LogManager.getLogger("CuatriCDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public CuatriCDaoImpl(){}
	
	public CuatriCDaoImpl(Connection con){
		this.con = con;
	}
	
	@Override
	public ArrayList<CuatriC> getAll() {
		
		ArrayList<CuatriC> cuatrisC = new ArrayList<CuatriC>();
		String sql = "SELECT * FROM CUATRI_C";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				CuatriC cuatriC = new CuatriC(rs.getInt("id_cuatri_c"));
				cuatrisC.add(cuatriC);
			}

		} catch (SQLException e) {
			cuatrisC.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return cuatrisC;
	}

}
