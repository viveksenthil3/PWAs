package db;

import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

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
	
	public String addReview(String username, String pwaId, String message, int rating) {
		UUID uuid=UUID.randomUUID();
		String query = "INSERT INTO review (`ReviewId`, `Username`, `PwaId`, `Message`, `Date`, `Rating`) VALUES (?, ?, ?, ?, ?, ?);";
		int row=0;
		Date date = new java.util.Date();
		SimpleDateFormat DateFor = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate= DateFor.format(date);
//		System.out.println(stringDate);
		
		try(Connection con = DriverManager.getConnection(DBConfig.getURI(), DBConfig.getUserName(), DBConfig.getPassword());
				PreparedStatement pstm = con.prepareStatement(query);){
			
			pstm.setString(1, uuid.toString());
			pstm.setString(2, username);
			pstm.setString(3, pwaId);
			pstm.setString(4, message);
			pstm.setString(5, stringDate);
			pstm.setInt(6, rating);
			
			row = pstm.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		if(row>0)
			return uuid.toString();
		return null;			
	}
}
