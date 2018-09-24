  <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="Dbcon.Dbconnection"%>
    <%@page import="java.sql.Connection"%>

  <%

                       
    String username = request.getParameter("username");
    String subject = request.getParameter("subject");
    
    Connection con=Dbconnection.getConnection();
    try {

    Statement st=con.createStatement();
    int j = st.executeUpdate("update complaints set status='Solved' where subject='"+subject+"' and username='"+username+"' ");
    if(j!=0)
    {
    response.sendRedirect("bankviewcomplaints.jsp?msg=Solved");
    }

    else {
      response.sendRedirect("bankviewcomplaints.jsp?m1=Failed");
    }
    } catch (Exception e) {
    e.printStackTrace();
    }

    %>