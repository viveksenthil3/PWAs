package models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Review {
	private String reviewId;
	private String username;
	private String pwaId;
	private String message;
	private Date date;
	private int rating;
	
	public Review(String reviewId, String username, String pwaId, String message, String date, int rating) {
//		super();
		this.reviewId = reviewId;
		this.username = username;
		this.pwaId = pwaId;
		this.message = message;
//		this.date = date;
		this.rating = rating;
		
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
	      
	      try {
	         this.date = ft.parse(date); 
	          
	      } catch (ParseException e) { 
	         System.out.println("Unparseable using " + ft); 
	      }
	}

	public String getReviewId() {
		return reviewId;
	}

	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwaId() {
		return pwaId;
	}

	public void setPwaId(String pwaId) {
		this.pwaId = pwaId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
	
}
