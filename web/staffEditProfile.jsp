<%-- 
    Document   : userProfile
    Created on : Dec 9, 2014, 3:49:18 PM
    Author     : Dee Dee
--%>
<%@include file= "staff_header.jsp"%>
<%@ include file ="mysqlconnect.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Edit User Profile</title>
    
</head>
<body>
<%
    String name = request.getParameter("input2");    
    String username = request.getParameter("input3");
    String password = request.getParameter("input4");
    String noIC = request.getParameter("input5");
    String address = request.getParameter("input6");
    String noTelOffice = request.getParameter("input7");
    String noTelHP = request.getParameter("input8");
    String email = request.getParameter("input9");
    String faculty = request.getParameter("input10");
    String department = request.getParameter("input11");
    String positionGrade = request.getParameter("input12");
    String position = request.getParameter("input13");
    

    String userSession = (String)session.getAttribute("username");    
    
    int i = 0;
    if(name!=null && username!=null && password!=null && noIC!=null && address!=null && noTelOffice!=null && noTelHP!= null 
            &&email!=null && faculty!=null && department!=null && positionGrade!=null && position!= null){
	try {
        	//Connection con = DriverManager.getConnection(url, user, password);
        	PreparedStatement edit = null;
        	int updateQuery = 0;

                String queryString = "UPDATE staff SET name=?,username=?,password=?,noIC=?,address=?,"
					+ "noTelOffice=?,noTelHP=?,email=?,faculty=?,department=?,"
                                        + "positionGrade=?,position=? WHERE username='" + userSession
					+ "'"; 

                /* createStatement() is used for create statement object that is used for 
			 sending sql statements to the specified database. */
		edit = con.prepareStatement(queryString);
		edit.setString(1, name);
		edit.setString(2, username);
                edit.setString(3, password);
		edit.setString(4, noIC);
		edit.setString(5, address);
		edit.setString(6, noTelOffice);
                edit.setString(7, noTelHP);
                edit.setString(8, email);
                edit.setString(9, faculty);
                edit.setString(10, department);
                edit.setString(11, positionGrade);
                edit.setString(12, position);
	
                i = edit.executeUpdate();
	} catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage() );
	}
    if (i > 0) {
        session.setAttribute("username", username);
        response.sendRedirect("staffProfile.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        out.println("Edit cannot be done because of system error!");
    }
    }
%>
  
</body>

</html>


