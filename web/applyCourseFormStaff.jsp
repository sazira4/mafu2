<%-- 
    Document   : applyCourseFormStaff
    Created on : Dec 8, 2014, 10:14:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@include file= "staff_header.jsp"%>
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
           <!-- 
                <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Apply Course
                        </div>
                        <div class="panel-body">
           -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="searchCourseForm" action="./apply2" method="post">
                                        
                                    <%
                                        String user = request.getParameter("username");
                                        String cid = request.getParameter("idCode");
                                    try 
                                    {  
                                        
                                        Class.forName("com.mysql.jdbc.Driver");
                                        String connectionUrl = "jdbc:mysql://127.0.0.1:3306/training?user=root";
                                        //Connection con1 = DriverManager.getConnection(connectionUrl);

                                        Statement stmt = null;
                                        //ResultSet rs1 = null;
                                        //SQL query command
                                        String SQL = "SELECT * FROM course WHERE courseCode = '"+ cid +"'";
                                        
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(SQL);
                                        
                                        while (rs.next()) 
                                        {
                                                String code = rs.getString("courseCode");
                                                String name = rs.getString("courseName");
                                                String cat = rs.getString("category");
                                                String start = rs.getString("startDate");
                                                String end = rs.getString("finalDate");
                                    %>
                                    
                                            <div class="form-group">
                                                <h4><b class="text-primary">Course Information</b></h4><br>
                                                <label for="disabledInput">Course Code</label>
                                                <input class="form-control" id="courseCode" name="courseCode" type="text" value="<%=code%>"><br>
                                                <label for="disabledInput">Course Name</label>
                                                <input class="form-control" id="courseName" name="courseName" type="text" value="<%=name%>"><br>
                                                <label for="disabledInput">Date Start</label>
                                                <input class="form-control" id="start" name="start" type="text" value="<%=start%>"><br>
                                                <label for="disabledInput">Date End</label>
                                                <input class="form-control" id="end" name="end" type="text" value="<%=end%>"><br>
                                                <input type="hidden" id="cat" name="cat" value="<%=cat%>">
                                            </div><hr>
                                            
                                    <%
                                        }
                                        
                                        stmt = null;
                                        rs = null;
                                        //SQL query command
                                        SQL = "SELECT * FROM staff WHERE username ='" + user + "'";
                                        
                                        stmt = con.createStatement();
                                        rs = stmt.executeQuery(SQL);
                                        
                                        while (rs.next()) 
                                        {
                                            String s_id = rs.getString("staffID");
                                            String name = rs.getString("name");
                                            String ic = rs.getString("noIC");
                                            String add = rs.getString("address");
                                            String job = rs.getString("position");
                                            String g_job = rs.getString("positionGrade");
                                            String dep = rs.getString("department");
                                            String fac = rs.getString("faculty");
                                            String m_num = rs.getString("noTelHP");
                                            String o_num = rs.getString("noTelOffice");
                                            String emel = rs.getString("email");
                                    %>
                                        
                                            <div class="form-group">
                                                <h4><b class="text-primary">Staff Information</b></h4><br>
                                                <label for="disabledInput">Name</label>
                                                <input class="form-control" id="staffName" name="staffName" type="text" value="<%=name%>"><br>
                                                <label for="disabledInput">IC No.</label>
                                                <input class="form-control" id="icNum" name="icNum" type="text" value="<%=ic%>"><br>
                                                <label for="disabledInput">Address</label>
                                                <input class="form-control" id="address" name="address" type="text" value="<%=add%>"><br>
                                                <label for="disabledInput">Mobile Number</label>
                                                <input class="form-control" id="mobile" name="mobile" type="text" value="<%=m_num%>"><br>
                                                <label for="disabledInput">Office Number</label>
                                                <input class="form-control" id="office" name="office" type="text" value="<%=o_num%>"><br>
                                                <label for="disabledInput">Email</label>
                                                <input class="form-control" id="email" name="email" type="text" value="<%=emel%>"><br>
                                                <label for="disabledInput">Faculty</label>
                                                <input class="form-control" id="faculty" name="faculty" type="text" value="<%=fac%>"><br>
                                                <label for="disabledInput">Department</label>
                                                <input class="form-control" id="dept" name="dept" type="text" value="<%=dep%>"><br>
                                                <label for="disabledInput">Gred Jawatan</label>
                                                <input class="form-control" id="gred" name="gred" type="text" value="<%=g_job%>"><br>
                                                <label for="disabledInput">Jawatan</label>
                                                <input class="form-control" id="jawatan" name="jawatan" type="text" value="<%=job%>"><br> 
                                                <input type="hidden" id="staffID" name="staffID" value="<%=s_id%>">
                                            </div>
                                    <%        
                                            /*
                                                name
                                                username
                                                staffIC
                                                address
                                                jawatan
                                                gredJawatan
                                                tarafJawatan
                                                department
                                                faculty
                                                staffType
                                                m_phoneNum
                                                o_phoneNum
                                                email*/
                                        }
                                    %>
                                        <button type="submit" class="btn btn-primary">Submit</button><br><br><hr>
                                    </form>
                                    
                                    <%
                                    } catch (SQLException e) {
                                        System.out.println("SQL Exception: "+ e.toString());
                                    } catch (ClassNotFoundException cE) {
                                        System.out.println("Class Not Found Exception: "+ cE.toString());
                                    } 
                                    %>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
    <!--                    </div>
                        <!-- /.panel-body -->
    <!--                 </div>
                    <!-- /.panel -->
    <!--             </div>
                <!-- /.col-lg-12 -->
    <!--        </div>
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
