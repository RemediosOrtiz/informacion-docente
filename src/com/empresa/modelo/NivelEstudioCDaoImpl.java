package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.NivelEstudioC;

public class NivelEstudioCDaoImpl implements NivelEstudioCDao {
	
	private static final Logger LOG = LogManager.getLogger("NivelEstudioCDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public NivelEstudioCDaoImpl(){};
	
	public NivelEstudioCDaoImpl(Connection con){
		this.con = con;
	};

	@Override
	public ArrayList<NivelEstudioC> getAll() {
		
		ArrayList<NivelEstudioC> nivelEstudioCs = new ArrayList<NivelEstudioC>();
		
		String sql = "SELECT * FROM NIVEL_ESTUDIO_C";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				NivelEstudioC nivelEstudioC = new NivelEstudioC(
						rs.getInt("id_nivel_estudio_c"),
						rs.getString("desc_nivel_estudio")
						);
				
				nivelEstudioCs.add(nivelEstudioC);
			}

		} catch (SQLException e) {
			nivelEstudioCs.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return nivelEstudioCs;
	}

}
