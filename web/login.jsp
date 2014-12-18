<%--
    Document   : login_admin
    Created on : Dec 2, 2014, 9:53:13 AM
    Author     : Dee Dee
--%>
<%@ page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="mysqlconnect.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Login</title>
</head>
<%  
        String username = request.getParameter("username");
        String pwd = request.getParameter("password"); 
         try {
		//Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		rs = stmt.executeQuery("select * from admin where username='" + username 
			+ "' and password='" + pwd + "'");
                if (rs.next()) {
                    session.setAttribute("username", username); 
                    
                    //out.println("welcome " + userid);
                    //out.println("<a href='logout.jsp'>Log out</a>");
                    response.sendRedirect("adminSuccess.jsp");
                    
                }else {
                    
                   rs = stmt.executeQuery("select userType from staff where username='" + username 
			+ "' and password='" + pwd+ "'");
                   
                   if (rs.next()) {
                       session.setAttribute("username", username); 
                       String userType = rs.getString("userType");

                        //out.println("welcome " + userid);
                        //out.println("<a href='logout.jsp'>Log out</a>");
   

                        if("staff".equals(userType)){
                            //RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("/staffSuccess/.jsp");
                            //RequetsDispatcherObj.forward(request, response);
                            response.sendRedirect("staffSuccess.jsp"); 
                        }else if("hod".equals(userType)){
                           // RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("/hodSuccess.jsp");
                           // RequetsDispatcherObj.forward(request, response);
                            response.sendRedirect("hodSuccess.jsp"); 
                        }else{
                           //out.println("Invalid password <a href='index.jsp'>try again</a>");
                           // out.println("Invalid password");
                           if (username == null || username.trim().equals("") || pwd == null || pwd.trim().equals("")){ 
                                response.sendRedirect("loginErrorPage.jsp");
                           }else{
                               out.println("Invalid password <a href='index.jsp'>try again</a>");
                           }
                        }

                     
                        //response.sendRedirect("staffSuccess.jsp"); 
                    }else {
                      // out.println("Invalid password <a href='index.jsp'>try again</a>");
                       // out.println("Invalid password");
                           // response.sendRedirect("loginErrorPage.jsp");
                        if (username == null || username.trim().equals("") || pwd == null || pwd.trim().equals("")){ 
                                response.sendRedirect("loginErrorPage.jsp");
                           }else{
                               out.println("Invalid password <a href='index.jsp'>try again</a>");
                           }
                    
                    }
                }
        }catch (SQLException ex) {
            System.err.println("SQLException: " + ex.getMessage() );	
	}	
%>        
</body>
</html>
