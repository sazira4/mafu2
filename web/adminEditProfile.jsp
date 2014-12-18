<%-- 
    Document   : adminEditProfile
    Created on : Dec 16, 2014, 11:03:38 PM
    Author     : Dee Dee
--%>
<%@include file= "admin_header.jsp"%>
<%@ include file="mysqlconnect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Edit Admin Profile</title>
    
</head>
<body>
<%   
    String username = request.getParameter("input1");
    String password = request.getParameter("input2");
    

    String userSession = (String)session.getAttribute("username");    
    
    int i = 0;
    if(username!=null && password!= null){
	try {
        	//Connection con = DriverManager.getConnection(url, user, password);
        	PreparedStatement edit = null;
        	int updateQuery = 0;

                String queryString = "UPDATE admin SET username=?,password=?"
                                    + "WHERE username='" + userSession + "'"; 

                /* createStatement() is used for create statement object that is used for 
			 sending sql statements to the specified database. */
		edit = con.prepareStatement(queryString);
		edit.setString(1, username);
                edit.setString(2, password);
	
                i = edit.executeUpdate();
	} catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage() );
	}
    if (i > 0) {
        session.setAttribute("username", username);
        response.sendRedirect("adminProfile.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        out.println("Edit cannot be done because of system error!");
    }
    }
%>
  
</body>

</html>


