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
    <li><a href="adminhome.jsp">Home</a></li>															
    <li><a href="addofficials.jsp">Add Officials</a></li>
    <li><a href="viewofficials.jsp">View Officials</a></li>
    <li><a href="viewcitizens.jsp">View Citizens</a></li>
    <li><a href="viewcomplaints.jsp">View Complaints</a></li>
    <li class="btn active"><a href="graph.jsp">Graph</a></li>
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
    
   
        
    <p align="justify">
    <center><p><font color="red" size="5">Complaint Analysis</font></p>
    <form name="myform" action="graph1.jsp" method="post">
    <table width="371">
    
    <tr>
    <td height="43"><font color="black">Select Department</td>
    <td><select name="department" style="width:220px;" required="">
    <option value="">--Select--</option>
    <option value="Police Department">Police Department</option>
    <option value="Banking Services">Banking Services</option>
    <option value="GHMC">GHMC</option>
    </select></td>
    </tr>
    
    
    <tr>
    <td height="43" rowspan="3"></td>
    <td align="left" valign="middle"> 
    <p>
    <input name="submit" type="submit" value="VIEW" />
    </p>
    <div align="right">
    </div></td>
    </tr>
    </table>
    </form>
    </center>
    </p>    
        
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