package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.GrupoC;

public class GrupoCDaoImpl implements GrupoCDao {

	private static final Logger LOG = LogManager.getLogger("GrupoCDaoImpl: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public GrupoCDaoImpl(){}
	
	public GrupoCDaoImpl(Connection con){
		this.con = con;
	}
	
	@Override
	public ArrayList<GrupoC> getAll() {
		
		ArrayList<GrupoC> gruposC = new ArrayList<GrupoC>();
		
		String sql = "SELECT * FROM GRUPO_C";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				GrupoC grupoC = new GrupoC(rs.getInt("id_grupo_c"));
				
				gruposC.add(grupoC);
			}

		} catch (SQLException e) {
			gruposC.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return gruposC;
	}

}
