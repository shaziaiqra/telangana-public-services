package action;

import Dbcon.Dbconnection;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javazoom.upload.*;

/**
 *
 * @author ashwini
 */
public class UploadServlet extends HttpServlet {
    
    
//protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    
    
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String resPath = "D:\\Compalints";

        PrintWriter out = res.getWriter();

        try {
            MultipartFormDataRequest nreq = new MultipartFormDataRequest(req);

            Connection con=Dbconnection.getConnection();
    
            String department = nreq.getParameter("department"); 
            String location = nreq.getParameter("location");
            String subject = nreq.getParameter("subject");
            String description = nreq.getParameter("description");
            String username = (String) req.getSession().getAttribute("user");
            String status = "Pending";

            UploadBean upb = new UploadBean();
            upb.setFolderstore(resPath);
            upb.setOverwrite(false);
            upb.store(nreq, "efile");

            Vector history = upb.getHistory();

            ArrayList<String> filesName = new ArrayList<String>();

            for (int i = 0; i < history.size(); i++) {
                UploadParameters up = (UploadParameters) history.elementAt(i);
                filesName.add(up.getFilename());
            }

            System.out.println("material" + filesName.get(0));

            String query = "insert into complaints values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, department);
            ps.setString(3, location);
            ps.setString(4, subject);
            ps.setString(5, description);
            ps.setString(6,filesName.get(0));
            ps.setString(7, resPath + "/" + filesName.get(0));
            ps.setString(8, status);
           
            int i = ps.executeUpdate();

            if (i == 1) {
            out.println("Successfully Uploaded ");

            RequestDispatcher rs = req.getRequestDispatcher("complaint.jsp?msg=Success");
            rs.forward(req, res);
            out.println("Successfully Uploaded ");
                
            } else {
                out.println("File Upload Failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
