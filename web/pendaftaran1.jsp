<%-- 
    Document   : pendaftaran1
    Created on : Dec 19, 2014, 6:50:47 AM
    Author     : Hafizah
--%>

<%-- HR --%>

<%@ page import="java.sql.*" %>
<%@ include file="admin_header.jsp" %>
<%@include file = "mysqlconnect.jsp" %>
<!DOCTYPE html>
<html lang="en">
    

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Senarai Pemohon</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="css/plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>



    <div id="wrapper">
  
                </div>
                <!-- /.sidebar-collapse -->
            

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Senarai Pemohon</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
                    
                    
            
          

<div class="panel panel-default">
                        <div class="panel-heading">
                            Senarai staf yang memohon
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <form class="form-horizontal" name="status" id="statusH" method="get" action="pendaftaran.jsp">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
        
                                    <thead>
                                        <tr>
                                            
                                            <th>Verification</th>
                                            <th>ID</th>
                                            <th>Staff Name</th>
                                            <th>Position</th>
                                            
                                        </tr>
                                    </thead>
                           <%

	try {
		//Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		String courseID = request.getParameter("courseID");
		String query = "SELECT * FROM penyertaan WHERE courseCode ='" 
				+ courseID + "'";
		rs = stmt.executeQuery(query);
%>
                
<%	
                
		while(rs.next() ) {
%>
            
                                    <!--Isi dalam badan-->
                                    
                                    <tbody>
                                        
                                        
		   
                    <tr>
                        
                        <td><input type="checkbox" name="yes" value='Acceptance'> Approve</td>
                        <td><%= rs.getString("staffID") %></td>
		        <td><%= rs.getString("staffName") %></td>
                        <td><%= rs.getString("jawatan") %></td>
                       <input type="hidden" name="idPenyertaan" value="<%= rs.getString("idPenyertaan") %>" />
                    </tr>
                    
                    
	<% 
        
        } %>  
                   
        

<%
	} catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage() );
	}  catch(Exception ex) {
      System.err.println("Error with input: " + ex);
    }
%>
                                        
                                    </tbody>
                                </table>
                                

  
  <button type="submit" class="btn btn-info">Submit</button>
                        </form>
                            </div>
                        </div>
</div>
        </div>

<%
   
   
   String status = request.getParameter("yes");
  
  
   
   String id = request.getParameter("idPenyertaan");
   
   
        //int book_id= Integer.parseInt(request.getParameter("book_id"));
     
         PreparedStatement attend;
         int i=0;
        int updateQuery = 0;
   try {
         
        Class.forName(driverName);
        String queryString = "UPDATE penyertaan SET statusH=? WHERE idPenyertaan= '" + id + "'";
      //  String queryString = "UPDATE penyertaan SET status=? WHERE idPenyertaan= '1'";
         
                      /* createStatement() is used for create statement object that is used for  sending sql statements to the specified database. */
				attend = con.prepareStatement(queryString);
				attend.setString(1, status);
				
                                attend.executeUpdate();
                            
   }
     catch(SQLException sqe)
    {
      
    }
   
    %>                  
   
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
    



</html>
<%@include file ="footer.jsp" %>