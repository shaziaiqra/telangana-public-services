
    <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="Dbcon.Dbconnection"%>
    <%@page import="java.sql.Connection"%>
    <%
    String department = request.getParameter("department");
   
    %>
    <br/><br/>     
    <h2><font color="black">  Complaints of </font> <font color="red"><%=department%> </font></h2><br/>
    <%
    String s = null;
    
    String s1 = null;
    int a = 0;
    int b= 0;
  Connection con=Dbconnection.getConnection();
    try
    {
        
    String gg = "delete from g";
    Statement st1 = con.createStatement();
   st1.executeUpdate(gg);
        
    String q = "select * from complaints where department  = '"+department+"'";
    Statement st = con.createStatement();
    ResultSet rsa = st.executeQuery(q);
            
            
            
            while(rsa.next())
	{
	 s1=rsa.getString(1);
s = rsa.getString("status");

if(s.equals("Pending"))
{
 a = a+1;   
    
    
}


if(s.equals("Solved"))
{
 b = b+1;   
    
    
}


        }
        
        
        PreparedStatement ps = con.prepareStatement("insert into g values(?,?)");
        ps.setString(1,"Pending");
        ps.setInt(2,a);
        ps.executeUpdate();
        
        
        PreparedStatement psa = con.prepareStatement("insert into g values(?,?)");
        psa.setString(1,"Solved");
        psa.setInt(2,b);
        psa.executeUpdate();
        
        System.out.println("pending"+a);
        System.out.println("Solved"+b);
        
        
        
        
  
    ResultSet rs=con.createStatement().executeQuery("SELECT * FROM g  ");

    %>
    <script type="text/javascript" src="sources/jscharts.js"></script>

    <div id="graph">Loading graph...</div>


        <script type="text/javascript">
    var myData=new Array();
    var colors=[];

    <%
            int i=0;
	
	
	while(rs.next())
	{
	 s1=rs.getString(1);
	int  s2=rs.getInt(2);
	
	
	
	%>
	
	myData["<%=i%>"]=["<%= s1%>",<%=s2%>];
        
	<%
	i++;}
	%>
	
	var myChart = new JSChart('graph', 'pie');
	myChart.setDataArray(myData);
	myChart.setBarColor('#42aBdB');
	myChart.setBarOpacity(0.8);
	myChart.setSize(500, 400);
	myChart.setBarBorderColor('#D9EDF7');
	myChart.setBarValues(true);
	myChart.setTitleColor('#8C8383');
	myChart.setAxisColor('#777E89');
	myChart.setAxisValuesColor('#777E81');
	myChart.draw();
	
  </script>

<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>



<br/>
<center><a href="graph.jsp">BACK</a></center>
        