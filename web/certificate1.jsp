
<%@page import="java.io.*" %>

<%@page import="java.sql.*" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "admin_header.jsp" %>
<%@include file = "mysqlconnect.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Certificate</title>

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
<body>
    
        
     <div id="wrapper">
    <div id="page-wrapper">
        <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Certificate</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
        
      

      
    <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Striped Rows
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <form class="form-horizontal" name="form1" method="get" action="certificate1.jsp">  
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                           
                                            <th>No</th>
                                            <th>Staff Id</th>
                                            <th>Staff Name</th>
                                            <th>IC Number</th>
                                            <th>Start Date</th>
                                            <th>Final Date</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        <%

	try {
		//Connection con = DriverManager.getConnection(url, user, password);
		//Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
                
               
		//String idC = request.getParameter("idC");
		 String query = "SELECT * FROM attendance INNER JOIN staff ON attendance.staffID = staff.staffID "
                         + "INNER JOIN course ON attendance.courseCode = course.courseCode"
                         
                      ;
		rs = stmt.executeQuery(query); 
                
               
                int i=1;
       
      
            while(rs.next()){
                
           
%>
		   <tr>
                       
                 
                   
                   <td><%= i %></td>
			<td><%= rs.getString("staffID") %></td>
		   
			<td><%= rs.getString("name") %></td>
                           
                          <td><%= rs.getString("noIC") %></td> 
                   
                   <td><%= rs.getString("startDate") %></td> 
                   <td><%= rs.getString("finalDate") %></td> 
                   
                     
                   <td><a href="certificate2.jsp?staffID=<%= rs.getString("staffID")%>&name=<%= rs.getString("name")%>&noIC=<%= rs.getString("noIC")%>&startDate=<%= rs.getString("startDate")%>&finalDate=<%= rs.getString("finalDate")%>"/>Jana Sijil</a></td>
                   
                   
                 
               
		   
           
		 
<%                  
            i++;
            }    
        
	
%>

                </tr> </tbody>        
                                </table>             
              <%
        }catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage() );
	}  
        
        
%>


                             </form>
                            </div>
                            <!-- /.table-responsive -->
                           
                           
                        </div>

                        <!-- /.panel-body -->
                    </div>

                    <!-- /.panel -->
                </div>
            </div>
    </div>
     </div>


    </body>
</html>
<%@include file ="footer.jsp" %>
