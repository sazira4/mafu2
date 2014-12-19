
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

    <title>Record Details Attendance</title>

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
                    <h1 class="page-header">Record Details Attendance</h1>
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
                                <form class="form-horizontal" name="form1" method="get" action="recordDetails.jsp">  
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            
                                            <th>No</th>
                                            <th>Staff Id</th>
                                            <th>Staff Name</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        <%

	try {
		//Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		String courseCode = request.getParameter("courseCode");
		 String query = "SELECT * FROM staff WHERE courseCode ='" 
				+ courseCode+ "'";
                 
                  
		rs = stmt.executeQuery(query);
                
            int i =1;
            
                while(rs.next()){
         
           
%>
		
                <tr>
                       
                       
                       
                    
                   <td><%= i %></td>
                   
                   
			<td><%= rs.getString("staffID") %></td>
		   
			<td><%= rs.getString("name") %></td>
                        
                        <td><a href="recordDetails.jsp?staffID=<%= rs.getString("staffID")%>
                               &name=<%= rs.getString("name")%>&courseCode=<%= rs.getString("courseCode")%>"/>ADD</a></td>
             
                            <input type="hidden" name="staffID" value="<%= rs.getString("staffID") %>" />
                            <input type="hidden" name="name" value="<%= rs.getString("name") %>" />
                           <input type="hidden" name="courseCode" value="<%= rs.getString("courseCode") %>" />    
		
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




   <%   
        String staffname = request.getParameter("name");
        String idCourse = request.getParameter("courseCode");
        String idStaff = request.getParameter("staffID");
        String status = request.getParameter("attendanceStatus");

        //int book_id= Integer.parseInt(request.getParameter("book_id"));
     
         PreparedStatement attend;
         int i=0;
         int updateQuery = 0;
  
   try{
         
         Class.forName(driverName);
         String queryString = "INSERT INTO attendance(name,staffID,courseCode) VALUES (?, ?, ?)";
                      /* createStatement() is used for create statement object that is used for  sending sql statements to the specified database. */
				attend = con.prepareStatement(queryString);
				
				
				attend.setString(1, staffname);
                                attend.setString(2, idStaff);
                                attend.setString(3, idCourse);
                                
				
                                i = attend.executeUpdate();
                            if(i > 0)
					{
						%>
						<jsp:include page="record.jsp"/>
                                               
						<% 
					}
				else
					{
						%>
						<jsp:include page="record.jsp"/>
                                                
						<%
					}
        
 
                                }catch(SQLException sqe){
      
                                }
   
                            %>
    
    </body>
</html>
<%@include file ="footer.jsp" %>


