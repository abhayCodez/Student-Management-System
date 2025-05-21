package in.stm.backend;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/checkRoll")
public class CheckRoll extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7059135123172045292L;

	public void doPost(HttpServletRequest req , HttpServletResponse res) {
		String roll = req.getParameter("roll");
		
		try{ 
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms?useSSL=false", "root" , "Divyabhay@54");
			PreparedStatement ps = con.prepareStatement("select * from Student");
			ResultSet rs = ps.executeQuery();
			boolean b = false;
			while(rs.next()) {
				String r = rs.getString("rollno");
				if(r.equals(roll)) {
					req.setAttribute("roll",roll);
					RequestDispatcher dispatcher = req.getRequestDispatcher("marks.jsp");
					dispatcher.forward(req, res);
					b = true;
				}
			}
			if(b == false) {
				PrintWriter out = res.getWriter();
				out.println("user not found ! ");
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
