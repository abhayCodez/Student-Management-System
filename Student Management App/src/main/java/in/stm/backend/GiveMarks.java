package in.stm.backend;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/giveMarks")
public class GiveMarks extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2965306054487355696L;

	public void doPost(HttpServletRequest req , HttpServletResponse res) {
		String roll = req.getParameter("roll");
		int soft = Integer.parseInt(req.getParameter("soft"));
        int comp = Integer.parseInt(req.getParameter("comp"));
        int java = Integer.parseInt(req.getParameter("java"));
        int acc = Integer.parseInt(req.getParameter("acc"));
        int py = Integer.parseInt(req.getParameter("py"));

		roll = "bca"+roll;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms" , "root" , "Divyabhay@54");
			PreparedStatement ps = con.prepareStatement("Insert into "+roll+" values (?,?,?,?,?)");
			ps.setInt(1, soft);
            ps.setInt(2, comp);
            ps.setInt(3, java);
            ps.setInt(4, acc);
            ps.setInt(5, py);
			int a = ps.executeUpdate();
			System.out.println(a);
			if(a > 0) {
				 PrintWriter out = res.getWriter();
			        out.print("<h1>Marks registered succesfully ! ");
			}else {
				PrintWriter out = res.getWriter();
				out.println("<h1>not registered ! ");
			}
			ps.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		}
}
