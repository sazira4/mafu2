
<%@ include file="header.jsp" %>
<%@include file = "mysqlconnect.jsp" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html lang="en">

    <head>


        <title>Manage Courses</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin-2.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="css/plugins/morris.css" rel="stylesheet">

        <!-- first calendar --> 
        <meta charset="utf-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
        <!-- end first calendar -->

        <!-- second calendar -->

        <link rel='stylesheet' type='text/css' href='stylesheet.css'/>
        <link rel='stylesheet' type='text/css' href='http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css'/>
        <script type='text/javascript' src='js/script.js'></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>



        <!-- end second calendar -->

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
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/training"
                           user="root"  password=""/>

        <div id="wrapper">
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Add Course</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">

                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <form action="addCourses.jsp" method="post">
                                    <div class="form-group">
                                        <label>Course Name</label>
                                        <input class="form-control" placeholder="Enter text" name="courseName">
                                    </div>
                                    <div class="form-group">
                                        <label>Course Code</label>
                                        <input class="form-control" placeholder="Enter text" name="courseCode">
                                    </div>

                                    <div class="form-group">
                                        <label>Venue</label>
                                        <input class="form-control" placeholder="Enter text" name="venue">
                                    </div>
                                    <div class="form-group">
                                        <label>Start Date</label>
                                        <input type="text" id="departing" class="form-control" placeholder="Select Date" name="startDate">
                                    </div>
                                    <div class="form-group">
                                        <label>End Date</label>
                                        <input type="text" id="returning" class="form-control" placeholder="Select Date" name="finalDate">

                                    </div>
                                    <div class="col-lg-offset-9">
                                        <button type="submit" class="btn btn-default">Save</button>
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
        <%      String name = request.getParameter("courseName");
            String code = request.getParameter("courseCode");
            String venue = request.getParameter("venue");            
            
            /*String startD = request.getParameter("startDate");  
            String finalD = request.getParameter("finalDate");
            
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date dS = df.parse(startD);
            Date dF = df.parse(finalD);
            out.println(dS);
            out.println(dF);
            */

            /*
            
            java.util.Date util_StartDate = df.parse(startD);
            java.sql.Date sql_StartDate = new java.sql.Date( util_StartDate.getTime() );
            
          
           
            SimpleDateFormat reFormat = new SimpleDateFormat("mm-dd-yyyy");
           // java.util.Date sDate = reFormat.parse(request.getParameter("startDate"));
           //java.sql.Date sqlDate = new java.sql.Date(sDate.getTime());
            
          
            
             java.util.Date fDate = reFormat.parse(request.getParameter("finalDate"));
            java.sql.Date sqlDateF = new java.sql.Date(fDate.getTime());
            
            
            
            
            java.util.Date util_FinalDate = df.parse(finalD);
            java.sql.Date sql_FinalDate = new java.sql.Date( util_FinalDate.getTime() );
            */
            
            
            
            
            //if (name != null && code != null && venue != null && startD!= null && finalD != null)
            if (name != null && code != null && venue != null) {
                //Connection con = DriverManager.getConnection(url,user,password);
                PreparedStatement courseInfo = null;
                int updateQuery = 0;
                try {
                    Class.forName(driverName);
                    //con = DriverManager.getConnection(url,user,psw);
                       
                     //String queryString = "INSERT INTO course(courseCode, venue, courseName, startDate, finalDate) VALUES (?, ?, ?, ?, ?)";
                    String queryString = "INSERT INTO course(courseCode, venue, courseName) VALUES (?, ?, ?)";
                    /* createStatement() is used for create statement object that is used for  sending sql statements to the specified database. */
                    courseInfo = con.prepareStatement(queryString);
                    courseInfo.setString(1, code);
                    courseInfo.setString(2, venue);
                    courseInfo.setString(3, name);
                    //courseInfo.setDate(4, sd );
                    //courseInfo.setDate(5, fd );
                   // courseInfo.setDate(4, sql_StartDate );
                    //courseInfo.setDate(5, sql_FinalDate );
                    //courseInfo.setString(4, startD);
                    //courseInfo.setString(5, finalD);

                    int i = courseInfo.executeUpdate();
                    if (i > 0) {
        %>
        <jsp:forward page="manageCourses.jsp"/>
        <%
        } else {
        %>
        <jsp:forward page="addCourses.jsp"/>
        <%
                    }

                } catch (SQLException sqe) {
                    request.setAttribute("error", sqe);
                    out.println(sqe);
                }
            }
        %>



    </body>
</html>

<%@include file ="footer.jsp" %>
