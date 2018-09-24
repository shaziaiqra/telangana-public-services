
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="Dbcon.Dbconnection"%>
    <%@page import="java.sql.Connection"%>
    <%
    String department = request.getParameter("department");
    String status = request.getParameter("status");
    %>
    <br/><br/>     
    <h2><font color="black"> <%=status%> Complaints of </font> <font color="red"><%=department%> </font></h2><br/>
    <%

    try
    {
        
    Connection con=Dbconnection.getConnection();
    ResultSet rs=con.createStatement().executeQuery("SELECT department,count(department) FROM complaints where department = '"+department+"' and status = '"+status+"' group by department ");

    %>
    <script type="text/javascript" src="sources/jscharts.js"></script>

    <div id="graph">Loading graph...</div>


        <script type="text/javascript">
    var myData=new Array();
    var colors=[];

    <%
            int i=0;
	
	String s1=null;
	
	while(rs.next())
	{
	 s1=rs.getString(1);
	int  s2=rs.getInt(2);
	
	
	
	%>
	
	myData["<%=i%>"]=["<%= s1%>",<%=s2%>];
        
	<%
	i++;}
	%>
	
	var myChart = new JSChart('graph', 'bar');
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
        