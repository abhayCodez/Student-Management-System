package in.stm.backend;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/studentInfo")
public class StudentTable extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3346079493065871387L;

	public void doPost(HttpServletRequest req , HttpServletResponse res){

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms", "root", "Divyabhay@54");
		Statement stmt = con.createStatement();
        
		String roll = "BCA"+(String)req.getAttribute("roll"); 
        
        String createTableQuery = "CREATE TABLE `" + roll + "` ("
                + "`Software_Engineering` INT, "
                + "`Computer_Architecture` INT, "
                + "`Java` INT, "
                + "`Accounts` INT, "
                + "`Python` INT "
                + ")";
        
        // Execute the query
        stmt.executeUpdate(createTableQuery);
        PrintWriter out = res.getWriter();
        out.print("<h1>user registered succesfully ! ");
        stmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
