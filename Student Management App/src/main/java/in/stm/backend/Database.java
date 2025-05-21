package in.stm.backend;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {

	public static Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/sms" , "root" , "Divyabhay@54");
	}
}
