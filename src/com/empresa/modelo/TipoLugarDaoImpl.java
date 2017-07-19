package com.empresa.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.empresa.pojo.TipoLugar;

public class TipoLugarDaoImpl implements TipoLugarDao {
	
	private static final Logger LOG = LogManager.getLogger("TipoLugarDao: ");
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TipoLugarDaoImpl() {}
	
	public TipoLugarDaoImpl(Connection con){
		this.con = con;
	}

	@Override
	public ArrayList<TipoLugar> getAll() {
		ArrayList<TipoLugar> tipoLugares = new ArrayList<TipoLugar>();
		String sql = "SELECT * FROM TIPO_LUGAR";
		
		try {
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				
				TipoLugar tipoLugar = new TipoLugar(
						rs.getInt("id_tipo_lugar"),
						rs.getString("desc_lugar"));
				
				tipoLugares.add(tipoLugar);
			}

		} catch (SQLException e) {
			tipoLugares.clear();
			LOG.error("getAll(): " + e.getMessage());
			
		} finally {
			
			try {
				if(rs!= null) rs.close();
				if(ps!= null) ps.close();
				
			} catch (SQLException e) {
				LOG.error("Al cerrar conexiones - getAll(): " + e.getMessage());
			}
		}
		
		return tipoLugares;
	}

}
