<%-- 
    Document   : deleteCourse
    Created on : Dec 15, 2014, 8:29:56 AM
    Author     : user
--%>
<%@ include file="header.jsp" %>
<%@include file = "mysqlconnect.jsp" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page autoFlush="true" buffer="1094kb"%> 

<%
        String courseID = request.getParameter("courseID");
        String delete = "DELETE FROM course" +
                           " WHERE courseCode = '" + courseID + "'";
        
        PreparedStatement ps = null;
        ps = con.prepareStatement(delete);
        int i = ps.executeUpdate();
        if (i>0)
        {
            
                        %>
                        <jsp:forward page="manageCourses.jsp"/>
                        <% 
                    //sendPage(request, response, "/ViewUserServlet");
        }
        else
        {
            out.println("SQL Error: " + delete);
        }        
    

%>   


