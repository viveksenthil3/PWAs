package db;

public class DBConfig {
	private static String userName = "root";
	private static String password = "toor";
	private static String URI = "jdbc:mysql://localhost:3306/pwas";
	
	public static String getUserName() {
		return userName;
	}

	public static String getPassword() {
		return password;
	}

	public static String getURI() {
		return URI;
	}
	
}
