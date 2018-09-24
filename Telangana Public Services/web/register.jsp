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

<script>  
function validateform(){  
var password=document.myform.password.value;
var x=document.myform.email.value;
var phoneno = document.getElementById('txtphoneno'); 

if(password.length<6){  
  alert("Password must be at least 6 characters long.");  
  return false;  
  } 
  
var atposition=x.indexOf("@");  
var dotposition=x.lastIndexOf(".");  
if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
  alert("Please enter a valid e-mail address \n atpostion:"+atposition+"\n dotposition:"+dotposition);  
  return false;  
} 
if (phoneno.value == "" || phoneno.value == null) {
            alert("Please enter your Mobile No.");
            return false;
        }
        if (phoneno.value.length < 10 || phoneno.value.length > 10) {
            alert("Mobile No. is not valid, Please Enter 10 Digit Mobile No.");
            return false;
        }
}  
</script>

<body>	
    
    <%
    if (request.getParameter("m1") != null) {%>
    <script>alert('Registration Failed...!');</script>
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
    <li><a href="index.html">Home</a></li>															
    <li><a href="admin.jsp">Admin</a></li>
    <li><a href="govtofficials.jsp">Govt Officials</a></li>
   
    <li><a href="citizens.jsp">Citizens</a></li>
    <li class="btn active"><a href="register.jsp">Registration</a></li>
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
    <center><p><font color="red" size="5">Citizen Registration</font></p>
    <form name="myform" action="Citizen" method="get" onsubmit="return validateform()" >
    <table width="371">
    <tr>
    <td height="43"><font color="black">User Name </td>
    <td width="218"><input type="text" name="username" autocomplete="off" required="" placeholder="User Name" /></td>
    </tr>
    <tr>
    <td height="43"><font color="black">Password </td>
    <td width="218"><input type="password" autocomplete="off" name="password" required="" placeholder="Password" /></td>
    </tr>
    <tr>
    <td height="43"><font color="black"> Email ID</td>
    <td><input type="text" name="email" autocomplete="off" required="" placeholder="Email ID"/></td>
    </tr>
    <tr>
    <td height="43"><font color="black">Date Of Birth</td>
    <td><input type="date" name="dob"  style="text-align:right" required="" ></td></label>
    </td>
    </tr>
    <tr>
    <td height="43"><font color="black">Select Gender</td>
    <td><select name="gender" style="width:220px;" required="">
    <option>--Select--</option>
    <option>MALE</option>
    <option>FEMALE</option>
    </select></td>
    </tr>
    <tr>
    <td height="65"><font color="black">Location</td>
    <td><input type="text" name="address" autocomplete="off" required="" placeholder="Location"></input></td>
    </tr>
    <tr>
    <td height="43"><font color="black">Mobile Number </td>
    <td><input type="text" name="mobile" autocomplete="off" required="" placeholder="Mobile Number" id="txtphoneno" onkeypress="return isNumber(event)" /></td>
    </tr>
    <tr>
    <td height="43" rowspan="3"></td>
    <td align="left" valign="middle"> 
    <p>
    <input name="submit" type="submit" value="REGISTER" />
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