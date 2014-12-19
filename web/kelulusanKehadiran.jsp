<%-- 
    Document   : kelulusanKehadiran
    Created on : Dec 17, 2014, 4:15:52 PM
    Author     : Hafizah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@include file= "staff_header.jsp"%>
<%@ include file ="mysqlconnect.jsp"%>
<html lang="en">

    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Course Verify</title>
</head>
    


</head>

<body>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Status Permohonan</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Senarai Khusus Yang Dipohon
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Head Department</th>
                                            <th>Human Resources</th>
                                        </tr>
                                    </thead>
                                    
                                    <!--Isi dalam badan-->
                                    
                                    <tbody>
                                     <tbody>
                                        
                                        <%

	try {
		//Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		
		String query = "SELECT * FROM penyertaan";

		rs = stmt.executeQuery(query);
%>

		 
                 
<%	
                 int i = 1;
		while(rs.next() ) {
%>
		   
                    <tr>
                        <td><%= i %></td>
			<td><%= rs.getString("courseCode") %></td>
                        <td><%= rs.getString("courseName") %></td>
		        <td><%= rs.getDate("startDate") %></td>
                        <td><%= rs.getDate("endDate") %></td>
                        
                        <td><%= rs.getString("status") %></td>
                        <td><%= rs.getString("statusH") %></td>
                        
		   </tr>
                   
<%
		i++;
                } 
                
%>
<%
	} catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage() );
	}  catch(Exception ex) {
      System.err.println("Error with input: " + ex);
    }
%>

                                    </tbody>
                            </div>
                            
                            <!-- Page-Level Demo Scripts - Tables - Use for reference -->
                            
                            <!-- jQuery -->
  
    <script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
    </script>
                        </div>
</body>

</html>

