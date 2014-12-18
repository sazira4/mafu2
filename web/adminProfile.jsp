<%-- 
    Document   : adminProfile
    Created on : Dec 16, 2014, 9:22:50 PM
    Author     : Dee Dee
--%>
<%@ include file="admin_header.jsp" %>
<%@ include file="mysqlconnect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Profile</title>

</head>

<body>
   <div id="wrapper">
    <div id="page-wrapper">
        <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Admin Profile</h1>
                </div>
                <!-- /.col-lg-12 -->
        </div>
    
    <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                            <h4 style="text-align:center"><b>Administrator Information</b></h4>
                    </div>
                        <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <form action="adminEditProfile.jsp" method="post" style="display:inline;">
                        <%
                            String username = (String)session.getAttribute("username");
                            try {
                            //Connection con = DriverManager.getConnection(url, user, password);
                            Statement stmt = con.createStatement();
                            String query = "SELECT * FROM admin WHERE username='" 
                                    + username + "'";
                            rs = stmt.executeQuery(query);
                        %>

		  <table class="table table-striped table-advance table-hover">
                  <%	
                       if (rs.next() ) {
                  %>          
		   <tr>
			<td width="150">Username</td><td width="45">:</td><td id="input1"><%= rs.getString("username") %></td>
		   </tr>
                   
		   <tr>
                        <td>Password</td><td>:</td><td id="input2"><%= rs.getString("password") %></td>
		   </tr>

                   
                    <%
                            }else{
                                  out.println("No records");
                            }
                    %>      
		</table>

                    <%
                            }catch(SQLException ex) {
                                 System.err.println("SQLException: " + ex.getMessage() );
                            }
                    %>
	<div style="margin-top:15pt;">
	<button type="button" onclick="myfunction()" id="editButton" class="btn btn-warning">Edit</button>
	
	<button type="submit" id="changeButton" style="display:none;" class="btn btn-primary">Change</button>
        <button type="button" onclick="cancelfunction()" id="cancelButton" style="display:none;" class="btn btn-success" >Cancel</button>

	</div>
	</form>
	</div>

<script>

function myfunction() {
	
	val = document.getElementById("input1").innerHTML;
	document.getElementById("input1").innerHTML = "<input type='text' name='input1' value='" + val + "' />";	
							

	val = document.getElementById("input2").innerHTML;
	document.getElementById("input2").innerHTML = "<input type='text' name='input2' value='" + val + "' />";
								      
	document.getElementById("editButton").style.display = "none";	
	document.getElementById("cancelButton").style.display = "inline";	
	document.getElementById("changeButton").style.display = "inline";	
}

function cancelfunction () {
	location.reload();
}
</script>
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
