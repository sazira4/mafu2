
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%@include file = "mysqlconnect.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Manage Courses</title>

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
                    <h1 class="page-header">Manage Courses</h1>
                </div>
                <!-- /.col-lg-12 -->
         </div>
        <div class="row">
            <div class="col-lg-offset-10">
                <h5> <a href="addCourse.jsp">Add Courses</a></h5>
            </div>
        </div>
        
       
      

      
    <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Bil</th>
                                            <th>Course Code</th>
                                            <th>Course Name</th>
                                            <th>Category</th>
                                            <th>Venue</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        <%

	try {
		//Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		
		String query = "SELECT * FROM course";

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
		        <td><%= rs.getString("venue") %></td>
                        <td><%= rs.getDate("startDate") %></td>
                        <td><%= rs.getDate("finalDate") %></td>
                        <td><a href='editCourse.jsp?courseID=<%= rs.getString("idC") %>'>Edit</a></td>
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
