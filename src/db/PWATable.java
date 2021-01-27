package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;

import com.mysql.cj.xdevapi.PreparableStatement;

import models.PWA;

public class PWATable {
	
	public ArrayList<PWA> getPwa(String category, boolean onlyTen){
		ArrayList<PWA> pwa_array = new ArrayList<>();
		
		try(Connection con = DriverManager.getConnection(DBConfig.getURI(), DBConfig.getUserName(), DBConfig.getPassword());
				Statement stm = con.createStatement();){
			
			String query = "SELECT * FROM pwa WHERE Category='%s' ";
			if(onlyTen)
				query+="LIMIT 10;";
			else
				query+=";";
			
			ResultSet rs = stm.executeQuery(String.format(query, category));
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
	
	public String addPwa(String category, String name, String description, int samplePicsCount, String link) {
		UUID uuid=UUID.randomUUID();
		String query = "INSERT INTO pwa (PwaId, Username, Name, Category, Description, Link, SamplePicsCount, Views) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		int row=0;
		
		try(Connection con = DriverManager.getConnection(DBConfig.getURI(), DBConfig.getUserName(), DBConfig.getPassword());
				PreparedStatement pstm = con.prepareStatement(query);){
			
			pstm.setString(1, uuid.toString());
			pstm.setString(2, "vivek");
			pstm.setString(3, name);
			pstm.setString(4, category);
			pstm.setString(5, description);
			pstm.setString(6, link);
			pstm.setInt(7, samplePicsCount);
			pstm.setInt(8, 0);
			row = pstm.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		if(row>0)
			return uuid.toString();
		return null;			
	}
	
	public static void main(String[] a) {
		PWATable p = new PWATable();
		p.getPwa("entertainment", false);
	}
	
}
