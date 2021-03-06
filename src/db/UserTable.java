package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import models.PWA;

public class UserTable {
	public static boolean isValid(String username, String pass) {
		String query = "SELECT * FROM user WHERE Username=? AND password=?;";
		int row=0;
		
		try(Connection con = DriverManager.getConnection(DBConfig.getURI(), DBConfig.getUserName(), DBConfig.getPassword());
			PreparedStatement pstm = con.prepareStatement(query);){
			pstm.setString(1, username);
			pstm.setString(2, pass);
			ResultSet rs = pstm.executeQuery();
//			System.out.println(pstm.toString());
			
			if(rs.next())
				return true;
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return false;
	}	
	

	public String insert(String s1,String s2,String s3) throws ClassNotFoundException
	{
		
		
		String result = "Success";
		
		try(Connection con = DriverManager.getConnection(DBConfig.getURI(), DBConfig.getUserName(), DBConfig.getPassword());
				Statement stm = con.createStatement();){

			
			PreparedStatement ps;	
			ps = con.prepareStatement("insert into user values(?,?,?)");
			ps.setString(1, s1);
			ps.setString(2, s2);
			ps.setString(3, s3);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Invalid";
		}
		return result;
	}
	public static boolean isExist(String username) {
		
		
		try(Connection con = DriverManager.getConnection(DBConfig.getURI(), DBConfig.getUserName(), DBConfig.getPassword());
			PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE Username=? ;");){
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
				return true;
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return false;
}
}
