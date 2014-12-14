
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="header.jsp" %>
<%@include file = "mysqlconnect.jsp" %>
<%@ page autoFlush="true" buffer="1094kb"%>  

<%
    String id = request.getParameter("courseID");
    if(id!=null){
        int courseID = Integer.parseInt(id);
        
        String courseName = request.getParameter("courseName");
        String courseCode = request.getParameter("courseCode");
        String venue = request.getParameter("venue");
        
        String update = "UPDATE course SET courseName=?, courseCode=?, venue=? WHERE idC= '" + courseID + "'";
        PreparedStatement edit = null;
        try
        {
            Class.forName(driverName);
            //con = DriverManager.getConnection(url,user,psw);

             edit = con.prepareStatement(update);
             edit.setString(1, courseName);
             edit.setString(2, courseCode);
             edit.setString(3,venue);
             
             int i = edit.executeUpdate();
             if (i>0)
            {
            
                        %>
                        <jsp:forward page="manageCourses.jsp"/>
                        <% 
                    //sendPage(request, response, "/ViewUserServlet");
            }
            else
            {
                System.out.println("Record updating failure");
                System.out.println("");
            }
        
        }
         catch(SQLException sqe)
        {
        request.setAttribute("error", sqe);
        out.println(sqe);
        }
    }
    
    %>