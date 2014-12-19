
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="admin_header.jsp" %>
<%@include file = "mysqlconnect.jsp" %>
<%@ page autoFlush="true" buffer="1094kb"%>  

<%
    String courseID = request.getParameter("courseCode"); 
    String courseName = request.getParameter("courseName");
    String venue = request.getParameter("venue");
    String startDate = request.getParameter("departing");
    String finalDate = request.getParameter("returning");
    String category = request.getParameter("category");
    String finalTime = request.getParameter("finalTime");
    String startTime = request.getParameter("startTime");
    
    
    //if(courseCode!= null && courseName != null && venue != null && startDate != null && finalDate != null && category != null && finalTime != null && startTime != null){
               
       
        
        String update = "UPDATE course SET category=?, venue=?, time=?, courseName=?, finalTime=?, startDate=?, finalDate=? WHERE courseCode= 'SCSJ1111'";
        PreparedStatement edit = null;
        try
        {
            Class.forName(driverName);
            //con = DriverManager.getConnection(url,user,psw);

             edit = con.prepareStatement(update);
             edit.setString(1, category);
             edit.setString(2,venue);
             edit.setString(3, startTime);
             edit.setString(4,courseName);
             edit.setString(5, finalTime);
             edit.setString(6, startDate);
             edit.setString(7, finalDate);
             
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
    //}
    
    %>