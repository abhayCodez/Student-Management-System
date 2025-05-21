package in.stm.backend;

import java.io.IOException;
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

@WebServlet("/StudentServ")
public class CheckStudent extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5423595980448471329L;

	protected void doPost(HttpServletRequest req , HttpServletResponse res) throws IOException {
		String roll = req.getParameter("roll");
		String name = req.getParameter("name");
		PrintWriter out = res.getWriter();
		try{ 
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms?useSSL=false", "root" , "Divyabhay@54");
			PreparedStatement ps = con.prepareStatement("select * from Student");
			ResultSet rs = ps.executeQuery();
			boolean b = false;
			while(rs.next()) {
				String r = rs.getString("rollno");
				String n = rs.getString("name");
				if(r.equals(roll) && n.equals(name)) {
					RequestDispatcher rd = req.getRequestDispatcher("/StudentERP.jsp");
					rd.include(req, res);
					b = true;
				}
			}
			if(b == false) {
				out.println("User not found !");
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
