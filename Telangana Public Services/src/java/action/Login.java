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
public class Login extends HttpServlet {
    
    
//protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    
    
   public void doGet(HttpServletRequest nreq, HttpServletResponse response) throws IOException{  

       response.setContentType("text/html");  
        PrintWriter out = response.getWriter(); 

        try {

            String username = nreq.getParameter("username");
            String password = nreq.getParameter("password");
            String type = nreq.getParameter("type");
            String police = "Police Department";
            String banking = "Banking Services";
            String ghmc = "GHMC";
            
           Connection con=Dbconnection.getConnection();

            
            if(type.equalsIgnoreCase(police)){
                
            String query = "select * from employee where username = '"+username+"' and password = '"+password+"' and etype = '"+type+"' ";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){    
            
            String location = rs.getString("location");
            HttpSession session=nreq.getSession();  
            session.setAttribute("user",username);
            session.setAttribute("location",location);
            session.setAttribute("department",type);
            out.print("Welcome "+username);
            
            response.sendRedirect("policehome.jsp?msg=Success");   
            }
            else{   
            response.sendRedirect("govtofficials.jsp?m1=Failed");      
            }
            }
            
            if(type.equalsIgnoreCase(banking)){
                
            String query = "select * from employee where username = '"+username+"' and password = '"+password+"' and etype = '"+type+"' ";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
            String location = rs.getString("location");
            HttpSession session=nreq.getSession();  
            session.setAttribute("user",username);
            session.setAttribute("location",location);
            session.setAttribute("department",type);
            out.print("Welcome "+username);
            
            response.sendRedirect("bankinghome.jsp?msg=Success");
               
            }
            else{   
            
            response.sendRedirect("govtofficials.jsp?m1=Failed");    
            }
            }
            
            if(type.equalsIgnoreCase(ghmc)){
                
            String query = "select * from employee where username = '"+username+"' and password = '"+password+"' and etype = '"+type+"' ";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
             
            String location = rs.getString("location");
            HttpSession session=nreq.getSession();  
            session.setAttribute("user",username);
            session.setAttribute("location",location);
            session.setAttribute("department",type);
            out.print("Welcome "+username);
            
            response.sendRedirect("ghmchome.jsp?msg=Success");    
            }
            else{   
            response.sendRedirect("govtofficials.jsp?m1=Failed");      
            }
            }
 

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
