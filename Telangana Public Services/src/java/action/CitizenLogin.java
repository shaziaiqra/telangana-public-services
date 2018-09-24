package action;

import Dbcon.Dbconnection;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javazoom.upload.*;

/**
 *
 * @author ashwini
 */
public class CitizenLogin extends HttpServlet {
    
    
//protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    
    
   public void doGet(HttpServletRequest nreq, HttpServletResponse response) throws IOException{  

       response.setContentType("text/html");  
        PrintWriter out = response.getWriter(); 

        try {

            String username = nreq.getParameter("username");
            String password = nreq.getParameter("password");
            
           Connection con=Dbconnection.getConnection();
                
            String query = "select * from citizen where username = '"+username+"' and password = '"+password+"' ";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){    
            
            HttpSession session=nreq.getSession();  
            session.setAttribute("user",username);
            out.print("Citizen "+username);
            
            response.sendRedirect("citizenshome.jsp?msg=Success");   
            }
            else{   
            response.sendRedirect("citizens.jsp?m1=Failed");      
            }
            
            
           
 

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
