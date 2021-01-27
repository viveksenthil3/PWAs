package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return false;
	}	
}
