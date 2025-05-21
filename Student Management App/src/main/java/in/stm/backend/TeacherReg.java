package in.stm.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/RegisterTeacher")
public class TeacherReg extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1526273865427479765L;

	protected void doPost(HttpServletRequest req , HttpServletResponse res) throws IOException {
		String name = req.getParameter("name");
		String Id = req.getParameter("Id");
		PrintWriter out = res.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms?useSSL=false", "root" , "Divyabhay@54");
			PreparedStatement ps = c.prepareStatement("Insert into Teacher values(?,?)");
			ps.setString(1, name);
			ps.setString(2, Id);
			int con = ps.executeUpdate();
			if(con > 0) {
				res.setContentType("text/html");
				out.println("<h3 style='colour:green'> Now login </h3>");
				
				RequestDispatcher rd = req.getRequestDispatcher("/Teacher.jsp");
				rd.forward(req, res);
			}
			ps.close();
		}catch(Exception e) {
			System.out.println(e);
		} 
	}
}
