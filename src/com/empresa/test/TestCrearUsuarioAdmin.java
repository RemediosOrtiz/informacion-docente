package com.empresa.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.empresa.conexion.ConexionBD;
import com.empresa.hash.Hasher;
import com.empresa.modelo.ContactoDao;
import com.empresa.modelo.ContactoDaoImpl;
import com.empresa.modelo.UsuarioDao;
import com.empresa.modelo.UsuarioDaoImpl;
import com.empresa.pojo.Contacto;
import com.empresa.pojo.Usuario;

public class TestCrearUsuarioAdmin {

	public static void main(String[] args) {

		Connection con = null;
		
		try {
			con = ConexionBD.getConexionBD().getCon();
			
			UsuarioDao usuarioDao = new UsuarioDaoImpl(con);
			
			Usuario usuario = new Usuario();
			usuario.setMatricula("2516160027");
			usuario.setPassword(new Hasher().generateHash("2516160027"));
			usuario.setIdUsuarioRol(1);
			usuario.setEstatus(1);
			
			if (usuarioDao.save(usuario)) {
				System.out.println("Usuarios creado");
				
				usuario = usuarioDao.getUsuarioByMatricula("2516160027");
				
				ContactoDao contactoDao = new ContactoDaoImpl(con);
				Contacto contacto = new Contacto();
				contacto.setNombre("Remedios");
				contacto.setApPaterno("Ortiz");
				contacto.setIdUsuario(usuario.getIdUsuario());
				
				if (contactoDao.save(contacto)) {
					System.out.println("Contacto creado");
				} else {
					System.out.println("Contacto no creado");
					
					if (usuarioDao.removeUsuarioById(usuario.getIdUsuario())) {
						System.out.println("El usuario se ha borrado");
					} else {
						System.out.println("El usuario no se pudo crear");
					}
				}
				
			} else {
				System.out.println("Usuarios no creado.");
			}
			
			ArrayList<Usuario> usuarios = usuarioDao.getAll();
			
			for (Usuario usuarioX : usuarios) {
				System.out.println(usuarioX.toString());
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
