package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;


public class SociosDAO 
{
	Connection conexion=null;
	
	
	public SociosDAO() throws ClassNotFoundException
	{		
		Conexion con=new Conexion();
		conexion=con.getConnection();
	}
		
	
	
	public List<Socios> listarSocios()
	{
		PreparedStatement ps;
        ResultSet rs;
		List<Socios> lista=new ArrayList<>();
		
		try
		{
		
			ps=conexion.prepareStatement("select s.id_socio, s.nombre, s.apellido, s.dni, s.mail, s.fecha_alta, s.estado, estado.nombre as estado_nombre from socios s inner join estado on estado.id_estado = s.estado order by estado_nombre");			
			rs=ps.executeQuery();
			while(rs.next())
			{
				int id=rs.getInt("id_socio");
				String nombre=rs.getString("nombre");
				String apellido=rs.getString("apellido");
				int dni=rs.getInt("dni");
				String mail=rs.getString("mail");
				Timestamp fecha = rs.getTimestamp("fecha_alta");
				int estado=rs.getInt("estado");
				String estadoNombre=rs.getString("estado_nombre");
				Socios socio=new Socios(id,nombre,apellido,dni,mail,fecha,estado,estadoNombre);			
				lista.add(socio);									
			}
			
			return lista;
		}
		catch(SQLException e)
		{
			System.out.println("Error de Conexion");
			return null;
		}		
	}
	
	
	public boolean  insertarSocio(Socios socio)
	{
		PreparedStatement ps;
		
		try
		{
			ps=conexion.prepareStatement("insert into socios (nombre,apellido,dni,mail,estado) values(?,?,?,?,?)");
			//ps.setString(0, null);
			ps.setString(1, socio.getNombre());
			ps.setString(2, socio.getApellido());
			ps.setInt(3, socio.getDni());
			ps.setString(4,socio.getMail());			
			ps.setInt(5,socio.getEstado());			
			ps.execute();			
			return true;			
		}
		catch(SQLException e)
		{
			JOptionPane.showMessageDialog(null, "El numero de documento o el mail ya esta registrado en la base de datos");
			return false;			
		}
		
	}
	
	
	public boolean actualizarSocio(Socios socio)
	{
		PreparedStatement ps;		
		try
		{
			ps=conexion.prepareStatement("update socios set nombre=? ,apellido=?,dni=?,mail=?,estado=? where id_socio=?");
			ps.setString(1, socio.getNombre());
			ps.setString(2, socio.getApellido());
			ps.setInt(3, socio.getDni());
			ps.setString(4,socio.getMail());			
			ps.setInt(5,socio.getEstado());			
			ps.setInt(6,socio.getId_socio());
			ps.execute();			
			return true;			
		}
		catch(SQLException e)
		{
			JOptionPane.showMessageDialog(null, "El numero de documento o el mail ya esta registrado en la base de datos");
			return false;			
		}
	}
	
	
	public boolean eliminarSocio(int _id)
	{
		PreparedStatement ps;
		try
		{
			ps=conexion.prepareStatement("delete from socios where id_socio=?");
			ps.setInt(1, _id);
			ps.execute();
			return true;
		}
		catch(SQLException e)
		{
			System.out.println("Error al insertar dato");
			return false;			
		}
		
	}
	
	
	
	public Socios mostrarSocio(int _id)
	{
		PreparedStatement ps;
		ResultSet rs;
		Socios socio=null;
		
		try
		{
			ps=conexion.prepareStatement("select * from socios where id_socio=?");
			ps.setInt(1, _id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				int id=rs.getInt("id_socio");
				String nombre=rs.getString("nombre");
				String apellido=rs.getString("apellido");
				int dni=rs.getInt("dni");
				String mail=rs.getString("mail");
				Timestamp fecha = rs.getTimestamp("fecha_alta");
				int estado=rs.getInt("estado");
				socio =new Socios(id,nombre,apellido,dni,mail,fecha,estado,"");				
			}
			return socio;
		}
		catch(SQLException e)
		{
			System.out.println("Error al insertar dato");
			return null;			
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
