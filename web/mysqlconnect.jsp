<%@page import= "java.sql.*"%>
<%!String serverName= "localhost";%>
<%!String databaseName= "training";%>
<%!String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/training";%> 
<%!String user = "root";%>
<%!String password = "";%>

<%  
        try{
            Class.forName("com.mysql.jdbc.Driver");
           // Class.forName("com.mysql.jdbc");
            // Class.forName("com.mysql.JDBC");
        }catch(java.lang.ClassNotFoundException cnfe){
            System.err.printf("ClassNoFoundException: ");
            System.err.println(cnfe.getMessage());
        }
            Connection con = DriverManager.getConnection(url,user,password);  
            ResultSet rs = null;
            Statement queryStmt = con.createStatement();  
    %>
