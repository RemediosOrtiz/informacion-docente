package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.NombramientoC;

public class NombramientoCDaoImpl implements NombramientoCDao {

	private static final Logger LOG = LogManager.getLogger("NombramientoCDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public NombramientoCDaoImpl(){};
	
	public NombramientoCDaoImpl(Connection con){
		this.con = con;
	}
	
	@Override
	public ArrayList<NombramientoC> getAll() {
		
		ArrayList<NombramientoC> nombramientosC = new ArrayList<NombramientoC>();
		
		String sql = "SELECT * FROM NOMBRAMIENTO_C";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				NombramientoC nombramientoC = new NombramientoC();
				nombramientoC.setIdNombramientoC(rs.getInt("id_nombramiento_c"));
				nombramientoC.setDescNombramiento(rs.getString("desc_nombramiento"));
				
				nombramientosC.add(nombramientoC);
			}

		} catch (SQLException e) {
			nombramientosC.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return nombramientosC;
	}

}
