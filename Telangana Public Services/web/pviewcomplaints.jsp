<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Telangana Public Services</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">      
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

<link href="themes/css/bootstrappage.css" rel="stylesheet"/>
<link href="themes/css/flexslider.css" rel="stylesheet"/>
<link href="themes/css/main.css" rel="stylesheet"/>

<!-- scripts -->
<script src="themes/js/jquery-1.7.2.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>				
<script src="themes/js/superfish.js"></script>	
<script src="themes/js/jquery.scrolltotop.js"></script>


</head>
<body>	
    
    <%
    if (request.getParameter("msg") != null) {%>
    <script>alert('Solved...!');</script>
    <%}%>
    <%
    if (request.getParameter("m1") != null) {%>
    <script>alert('Failed...!');</script>
    <%}%>

    <div id="top-bar" class="container">
    <div class="row">
    <center><h2>Telangana Public Services</h2></center>	
    </div>
    </div>
    <div id="wrapper" class="container">
    <section class="navbar main-menu">
    <div class="navbar-inner main-menu">				
    <nav id="menu" class="pull-right">
    <ul>
    <li><a href="policehome.jsp">Home</a></li>															
    <li class="btn active"><a href="pviewcomplaints.jsp">View Complaints</a></li>
    <li><a href="pviewstatus.jsp">View Status</a></li>
    <li><a href="logout.jsp">Logout</a></li>
    </ul>
    </nav>
    </div>
    </section>
    <section class="homepage-slider" id="home-slider">
    <div class="flexslider">
    <ul class="slides">
    <li>
    <img src="themes/images/carousel/banner-1.jpg" alt="" />
    </li>
    <li>
    <img src="themes/images/carousel/banner-2.jpg" alt="" />
    </li>
    </ul>
    </div>			
    </section>
    <section class="header_text">
    
        
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="Dbcon.Dbconnection"%>
    <%@page import="java.sql.Connection"%>
       
    <%
    Connection con=Dbconnection.getConnection();
    String department = session.getAttribute("department").toString();
    String location = session.getAttribute("location").toString();
    String sql="select * from complaints where location = '"+location+"' and department = '"+department+"' and status = 'Pending'"; 
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery(sql);
    
    if(rs.next()){
    
    String sql2="select * from complaints where location = '"+location+"' and department = '"+department+"' and status = 'Pending'"; 
    Statement st2=con.createStatement();
    ResultSet rs1=st2.executeQuery(sql2);
    %>
        
    <center>
   <h2><font color="black" size="5"> Complaints </font></h2>
   <style>
    td{
        text-align: center;
    }

   </style>
   <table border="2" width="80%">

   <tr style="background-color: #df8505">
   <th><font color="white">Citizen Name</th>
   <th><font color="white">Subject</th>
   <th><font color="white">Description</th>
   <th><font color="white">Location</th>
   <th><font color="white">Download</th>
   <th><font color="white">Solve</th>

   </tr>

   <%                while (rs1.next()) {
   %>

     <tr>
    <td><font color="black"><%=rs1.getString(1)%></td>
    <td><font color="black"><%=rs1.getString(4)%></td>
    <td><textarea readonly="" cols="20" rows="2"><%=rs1.getString(5)%></textarea></td>
    <td><font color="black"><%=rs1.getString(3)%></td>
    <td> <a href=<%= "\"download.jsp?path=" + rs1.getString(7) + "\""%> > Download</a></td>
    <td><a href="solve.jsp?username=<%=rs1.getString(1)%>&subject=<%=rs1.getString(4)%>"><button type="button">Solve </button></a></td>
    </tr>
       <%
       }
       %>
      </table></center> 
      <%
      }
    else{
      out.println("<br/><center><font color='red' size='4'>There are no Complaints to Dispaly</font></center><br/><br/>");
    }
    
      %>
        
    </section>
    <section class="main-content">
    <div class="row">
    <div class="span12">													
    <div class="row">

    </div>
    <br/>
    <div class="row">

    </div>

    </div>				
    </div>
    </section>

    <section id="copyright">
    
    </section>
    </div>
    <script src="themes/js/common.js"></script>
    <script src="themes/js/jquery.flexslider-min.js"></script>
    <script type="text/javascript">
    $(function() {
    $(document).ready(function() {
    $('.flexslider').flexslider({
    animation: "fade",
    slideshowSpeed: 4000,
    animationSpeed: 600,
    controlNav: false,
    directionNav: true,
    controlsContainer: ".flex-container" // the container that holds the flexslider
    });
    });
    });
    </script>
</body>
</html>