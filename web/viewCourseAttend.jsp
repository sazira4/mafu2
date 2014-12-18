<%-- 
    Document   : viewCourseAttended
    Created on : Dec 18, 2014, 1:14:28 PM
    Author     : Dee Dee
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "staff_header.jsp" %>
<%@include file = "mysqlconnect.jsp" %>

<%      
        
        //String username = request.getParameter("username");
        String username = (String)session.getAttribute("username");
        String sqlQuery = "SELECT * FROM staff "
               + "INNER JOIN course ON course.courseCode=staff.courseCode" + 
                "WHERE username=" + username;
        
     //   String sqlQuery = "SELECT * FROM course "
       //         + "JOIN infostaff ON infostaff.staffID=course.staffID" + 
        //        "WHERE infostaff.username=" + username;
     
// "WHERE ((infostaff.username) LIKE" + "\"*\"" +username+ "\"*\""+")";          
   // z e.g  WHERE (((InstDegreeProgram.Program) Like " + "\"*\"" + input2 + "\"*\""+"))"
       // +"ORDER BY InstDegreeProgram.Program";
        queryStmt = con.createStatement();
        rs = queryStmt.executeQuery(sqlQuery);
        
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Course Attended</title>
</head>

<body>
    
    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Course Attend</h1>
                    </div>
                <!-- /.col-lg-12 -->
            </div>
    
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 style="text-align:center"><b>Information of Course Attend</b></h4>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                              <table class="table table-striped table-advance table-hover">         
                                    <thead>
                                    <tr>
                                        <th><i class="fa fa-bullhorn"></i> Index</th>
                                        <th class="hidden-phone"><i class="fa fa-question-circle"></i>Course Code</th>
                                        <th class="hidden-phone"><i class="fa fa-question-circle"></i>Course Name</th>
                                        <th class="hidden-phone"><i class="fa fa-question-circle"></i>Start Date</th>
                                        <th class="hidden-phone"><i class="fa fa-question-circle"></i>End Date</th>
                                        <th class="hidden-phone"><i class="fa fa-question-circle"></i>Time</th>
                                        <th class="hidden-phone"><i class="fa fa-question-circle"></i>Venue</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                              <% int index = 0;
                                      while (rs.next()){
                                        index++;

                                        String courseCode = rs.getString("courseCode");
                                        String courseName = rs.getString("courseName");
                                        String startDate = rs.getString("startDate");
                                        String finalDate = rs.getString("finalDate");
                                        String time = rs.getString("time");
                                        String venue = rs.getString("venue");
                                       // if (!userType.equals("staff")){
                              %>
                                          <tr>
                                                <td>
                                                    <%=index %> 
                                                </td>
                                                <td class="hidden-phone"><%=courseCode%></td>
                                                <td class="hidden-phone"><%=courseName%></td>
                                                <td class="hidden-phone"><%=startDate%></td>
                                                <td class="hidden-phone"><%=finalDate%></td>
                                                <td class="hidden-phone"><%=time%></td>
                                                <td class="hidden-phone"><%=venue%></td> 
                                            </tr>  
                                   <% //  }else{
                                      //    index--;
                                      //  }
                                     } 
                                   %> 
                                   </tbody>
                             </table>      
                            </div>
                        </div>
                            <!-- /.table-responsive -->
                    </div>
                        <!-- /.panel-body -->
                </div>
                    <!-- /.panel -->
            </div>
        </div>
   </div>
</body>
</html>

