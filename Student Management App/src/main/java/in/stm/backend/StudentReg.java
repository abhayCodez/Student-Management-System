package in.stm.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentRegistration")
public class StudentReg extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7109454197962954406L;
	protected void doPost(HttpServletRequest req , HttpServletResponse res) throws IOException {
		String name = req.getParameter("name");
		String roll = req.getParameter("rollno");
		String email = req.getParameter("email");
		String phone  = req.getParameter("phone");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms?useSSL=false", "root" , "Divyabhay@54");
			PreparedStatement ps = c.prepareStatement("Insert into Student values(?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, roll);
			ps.setString(3, email);
			ps.setString(4, phone);
			int con = ps.executeUpdate();
			if(con > 0) {
				
				req.setAttribute("roll",roll);
				RequestDispatcher dispatcher = req.getRequestDispatcher("/studentInfo");
				dispatcher.forward(req, res);
			}
			ps.close();
		}catch(Exception e) {
			System.out.println(e);
		} 
	}
}
