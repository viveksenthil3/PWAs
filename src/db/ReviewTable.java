package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import models.PWA;
import models.Review;

public class ReviewTable {
	
	public ArrayList<Review> getReviews(String pwaId){
		ArrayList<Review> reviews = new ArrayList<>();
		
		try(Connection con = DriverManager.getConnection(DBConfig.getURI(), DBConfig.getUserName(), DBConfig.getPassword());
				Statement stm = con.createStatement();){
			
			String query = "SELECT * FROM review WHERE PwaId='%s' LIMIT 10;";
			
//			System.out.println(String.format(query, pwaId));
			ResultSet rs = stm.executeQuery(String.format(query, pwaId));
			while(rs.next()) {
				Review review = new Review(rs.getString("ReviewId"), rs.getString("Username"), rs.getString("PwaId"), rs.getString("Message"), rs.getString("Date"), rs.getInt("Rating"));
				reviews.add(review);
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return reviews;
	}
	
	public int getRating(String pwaId) {
		try(Connection con = DriverManager.getConnection(DBConfig.getURI(), DBConfig.getUserName(), DBConfig.getPassword());
				Statement stm = con.createStatement();){
			
			String query = "SELECT AVG(Rating) AS avgRating FROM review WHERE PwaId='%s' ;";
			
//			System.out.println(String.format(query, pwaId));
			ResultSet rs = stm.executeQuery(String.format(query, pwaId));
			if(rs.next()) {
				return rs.getInt("avgRating");
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}
}
