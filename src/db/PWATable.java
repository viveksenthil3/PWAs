package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import models.PWA;

public class PWATable {
	
	public ArrayList<PWA> getTenPwa(String category){
		ArrayList<PWA> pwa_array = new ArrayList<>();
		
		try(Connection con = DriverManager.getConnection(DBConfig.getURI(), DBConfig.getUserName(), DBConfig.getPassword());
				Statement stm = con.createStatement();){
				
			ResultSet rs = stm.executeQuery(String.format("select * from pwa where Category='%s'", category));
			while(rs.next()) {
				PWA pwa = new PWA();
				pwa.setName(rs.getString("Name"));
//				System.out.println(rs.getString("Name"));
				pwa_array.add(pwa);
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return pwa_array;
	}
	
	public static void main(String[] a) {
		PWATable p = new PWATable();
		p.getTenPwa("entertainment");
	}
	
}
