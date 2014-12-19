<%-- 
    Document   : applyCourseTable
    Created on : Dec 8, 2014, 9:14:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@include file= "hod_header.jsp"%>
<%@ include file ="mysqlconnect.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Apply Course</title>
</head>

<body>
    
    <div id="wrapper">
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Apply Course</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
      
                <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Search Course
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive"><br>
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>ID Code</th>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Category</th>
                                            <th>Date Start</th>
                                            <th>Date End</th>
                                        </tr>
                                    </thead>
                                    <tbody>    
                                    <%
                                        //String user = session.getAttribute("username");
                                    try 
                                    {  
                                        Class.forName("com.mysql.jdbc.Driver");
                                        String connectionUrl = "jdbc:mysql://127.0.0.1:3306/training?user=root";
                                        //Connection con1 = DriverManager.getConnection(connectionUrl);

                                        Statement stmt = null;
                                        //ResultSet rs = null;
                                        //SQL query command
                                        String SQL = "SELECT * FROM course";
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(SQL);
                                        
                                        int i=1;
                                        
                                        while (rs.next()) 
                                        {
                                            //String id = rs.getString("idC");
                                            String code = rs.getString("courseCode");
                                            String name = rs.getString("courseName");
                                            String cat = rs.getString("category");
                                            String start = rs.getString("startDate");
                                            String end = rs.getString("finalDate");
                                    %>  
                                        <tr>    
                                            <td><%= i %></td>
                                            <td><%= code %></td>
                                            <!-- <td><a href = "applyCourseForm.jsp?username=<//%=user%>&idC=<//%=id%>"><//%= name %></a></td> -->
                                            <td><a href = "applyCourseForm.jsp?username=<%=session.getAttribute("username")%>&idCode=<%=code%>"><%= name %></a></td>
                                            <td><%= cat %></td>
                                            <td><%= start %></td>
                                            <td><%= end %></td>
                                        </tr>
                                    <%
                                            i++;
                                        }
                                    } catch (SQLException e) {
                                        System.out.println("SQL Exception: "+ e.toString());
                                    } catch (ClassNotFoundException cE) {
                                        System.out.println("Class Not Found Exception: "+ cE.toString());
                                    } 
                                    %>    
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();   
    });
    </script>

</body>

</html>

