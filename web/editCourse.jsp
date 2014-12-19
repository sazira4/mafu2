<%-- 
    Document   : editCourse
    Created on : Dec 15, 2014, 12:37:12 AM
    Author     : user
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="admin_header.jsp" %>
<%@include file = "mysqlconnect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Course</title>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

   

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
    
<%
    String id = request.getParameter("courseID");
    if(id!=null){
                                                        
       
        rs = queryStmt.executeQuery("SELECT * FROM course WHERE courseCode='" + id + "'");
        if(rs!=null){
            rs.next();
        }
        /*if(rs.next())
        {
            String courseCode = rs.getString("courseCode");
            String courseName = rs.getString("courseName");
            String venue = rs.getString("venue");
        }*/
        
    }
%>



<div id="wrapper">
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Edit Course</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">

                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <form action="updateCourse.jsp" method="post">
                                
                                    <div class="form-group">
                                        <label>Course Name</label>
                                        <input class="form-control" name="courseName" value="<%= rs.getString("courseName") %>" >
                                    </div>
                                    <div class="form-group">
                                        <label>Course Code</label>
                                        <input  class="form-control"  value="<%= rs.getString("courseCode")%>" readonly>
                                    </div>
                                             
                                    <div class="form-group">
                                        <label>Venue</label>
                                        <input class="form-control" name="venue"  value="<%= rs.getString("venue")%>">
                                    </div>
                                    <div class="form-group">
                                        <label>Start Date</label>
                                        <input type="text" id="departing" class="form-control" name="departing"  value="<%= rs.getString("startDate")%>">
                                    </div>
                                    <div class="form-group">
                                        <label>End Date</label>
                                        <input type="text" id="returning" class="form-control"  name="returning" value="<%= rs.getString("finalDate")%>">

                                    </div>
                                        
                                     <div class="form-group">
                                        <label>Category</label>
                                        <input type="text" class="form-control" name="category" value="<%= rs.getString("category")%>">

                                    </div>
                                        
                                    <div class="form-group">
                                        <label>Start Time</label>
                                        <input type="text" class="form-control" name="startTime" value="<%= rs.getString("time")%>">

                                    </div>
                                        
                                    <div class="form-group">
                                        <label>End Time</label>
                                        <input type="text" class="form-control" name="finalTime" value="<%= rs.getString("finalTime")%>">

                                    </div>
                                    <div class="col-lg-offset-9">
                                        <input type="hidden" name="courseID" value="<%= rs.getString("courseCode")%>"/>
                                        <button type="submit" class="btn btn-default">Edit</button>
                                    </div>
                                </form>
                            </div>
                            <!-- /.panel-body -->


                        </div>
                        <!-- /.panel -->

                    </div>

                </div>
            </div>
        </div>


    
</html>
