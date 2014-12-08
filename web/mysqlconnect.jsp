<%@page import="java.sql.*"%>
<%!String serverName= "localhost";%>
<%!String databaseName= "training";%>
<%!String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/training";%> 
<%!String user = "root";%>
<%!String password = "";%>
<%   //Open connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,user,password);
   ResultSet rs = null;
   Statement queryStmt = con.createStatement();
%>
