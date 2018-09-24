<%    
//  String filename = "cancer.txt";   
 // String filepath = "F:/Temp/cancer.txt";  
  String filepath = request.getParameter("path");  
  
  response.setContentType("APPLICATION/OCTET-STREAM");
  
  response.setHeader("Content-Disposition","attachment; filename=\"" + filepath + "\"");   
  
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath);  
            
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   
%>   