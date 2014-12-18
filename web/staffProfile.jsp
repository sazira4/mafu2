<%-- 
    Document   : staffProfile
    Created on : Dec 9, 2014, 3:49:18 PM
    Author     : Dee Dee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file ="mysqlconnect.jsp"%>
<%@ include file ="staff_header.jsp"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>User Profile</title>
    
    
</head>

<body>
    
   <div id="wrapper">
    <div id="page-wrapper">
        <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">User Profile</h1>
                </div>
                <!-- /.col-lg-12 -->
        </div>
    
    <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                            <h4 style="text-align:center"><b>Staff Information</b></h4>
                    </div>
                        <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <form action="staffEditProfile.jsp" method="post" style="display:inline;">
                    <%
                        String username = (String)session.getAttribute("username");
                        try {
                            Statement stmt = con.createStatement();
                            String query = "SELECT * FROM staff WHERE username='" 
                                            + username + "'";
                            rs = stmt.executeQuery(query);
                  %>

		  <table class="table table-striped table-advance table-hover">
                  <%	
                       if (rs.next() ) {
                  %>          
		   <tr>
			<td width="150">Staff ID</td><td width="45">:</td><td id="input1"><%= rs.getString("staffID") %></td>
		   </tr>
                   <tr>
                        <td>Staff Name</td><td>:</td><td id="input2"><%=rs.getString("name") %></td>
                   </tr>
		   <tr>
                        <td>Username</td><td>:</td><td id="input3"><%= rs.getString("username") %></td>
		   </tr>
                   <tr>
                        <td>Password</td><td>:</td><td id="input4"><%= rs.getString("password") %></td>
		   </tr>
                   <tr>
                        <td>IC Number</td><td>:</td><td id="input5"><%= rs.getString("noIC") %></td>
		   </tr>
                   <tr>
                       <td>Address</td><td>:</td><td id="input6"><%= rs.getString("address")%></td>
                   </tr> 
                   <tr>
                       <td>Office Tel Number</td><td>:</td><td id="input7"><%= rs.getString("noTelOffice")%></td>
                   </tr>    
                   <tr>
                       <td>HP Tel Number</td><td>:</td><td id="input8"><%= rs.getString("noTelHP")%></td>
                   </tr>   
		   <tr>
			<td>Email</td><td>:</td><td id="input9"><%= rs.getString("email") %></td>
		   </tr>
                   <tr>
			<td>Faculty</td><td>:</td><td id="input10"><%= rs.getString("faculty") %></td>
		   </tr>
                   <tr>
                       <td>Department</td><td>:</td><td id="input11"><%= rs.getString("department")%></td>
                   </tr>    
                   <tr>
                       <td>Grade Position</td><td>:</td><td id="input12"><%= rs.getString("positionGrade")%></td>
                   </tr>
                   <tr>
                       <td>Position</td><td>:</td><td id="input13"><%= rs.getString("position")%></td>
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
	
	val = document.getElementById("input2").innerHTML;
	document.getElementById("input2").innerHTML = "<input type='text' name='input2' value='" + val + "' />";	
							

	val = document.getElementById("input3").innerHTML;
	document.getElementById("input3").innerHTML = "<input type='text' name='input3' value='" + val + "' />";
								
        
        val = document.getElementById("input4").innerHTML;
        document.getElementById("input4").innerHTML = "<input type='text' name='input4' value='" + val + "'/>";
                                                        
        
        val = document.getElementById("input5").innerHTML;
        document.getElementById("input5").innerHTML = "<input type='text' name='input5' value='" + val + "'/>";
                                                        
                                             
        val = document.getElementById("input6").innerHTML;
        document.getElementById("input6").innerHTML = "<input type='text' name='input6' value='" + val + "'/>";
        
        val = document.getElementById("input7").innerHTML;
        document.getElementById("input7").innerHTML = "<input type='text' name='input7' value='" + val + "'/>";
         
        val = document.getElementById("input8").innerHTML;
        document.getElementById("input8").innerHTML = "<input type='text' name='input8' value='" + val + "'/>";
        
        val = document.getElementById("input9").innerHTML;
        document.getElementById("input9").innerHTML = "<input type='text' name='input9' value='" + val + "'/>";
        
        val = document.getElementById("input10").innerHTML;
        document.getElementById("input10").innerHTML = "<input type='text' name='input10' value='" + val + "'/>";
        
        val = document.getElementById("input11").innerHTML;
        document.getElementById("input11").innerHTML = "<input type='text' name='input11' value='" + val + "'/>";
        
        val = document.getElementById("input12").innerHTML;
        document.getElementById("input12").innerHTML = "<input type='text' name='input12' value='"+ val +"'/>";
        
        val = document.getElementById("input13").innerHTML;
        document.getElementById("input13").innerHTML = "<input type='text' name='input13' value='"+ val +"'/>";
        
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