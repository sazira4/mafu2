
<%-- 
    Document   : pengesahan
    Created on : Dec 8, 2014, 8:52:42 AM
    Author     : MPK05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@include file= "hod_header.jsp"%>
<%@ include file ="mysqlconnect.jsp"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Pengesahan Page</title>

   
</head>

<body>

   

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Senarai Pengesahan Khusus</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Senarai Permohon Khusus
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
                                            <th>Category</th>
                                            <th>Start date</th>
                                            <th>End date</th>
                                            <th>Verify</th>
                                            
                                        </tr>
                                    </thead>
                                    
                                    <!--Isi dalam badan-->
                                    
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
		        <td><%= rs.getString("category") %></td>
                        <td><%= rs.getDate("startDate") %></td>
                        <td><%= rs.getDate("endDate") %></td>
                        <td><a href='pendaftaran.jsp?courseID=<%= rs.getString("courseCode")%>'>View Application</a></td>
                        
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
                                </table>
                            </div>
                            
                            <!-- Page-Level Demo Scripts - Tables - Use for reference -->
                            
                            <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

    <script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
    </script>
                        </div>
</body>

</html>
