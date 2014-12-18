<%-- 
    Document   : index
    Created on : Dec 8, 2014, 11:14:49 PM
    Author     : Dee Dee
--%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
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

    <title>Login</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

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

<body>
    <%
	String username = request.getParameter("username");
        String pwd = request.getParameter("password");
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="login.jsp" >
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Username" name="username" type="text" autofocus>
            <%
		if (request.getParameter("submit") != null) {
		   if (username == null || username.trim().equals("") ) {
			out.println("<font color='red' size='-2'>You must enter your " +
					"username!</font>");
	   	   } 	            
		}
           %>  
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="password" name="password" type="password" value="">
            <%
		if (request.getParameter("submit") != null) {
		   if (pwd == null || pwd.trim().equals("") ) {
			out.println("<font color='red' size='-2'>You must enter your " +
					"password!</font>");
	   	   } 
		}
            %>                 
                                </div>
                                
                                <div class="checkbox">
                                    <input type="reset" value="Reset" />
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>                                 
                                </div>

                                <!-- Change this to a button or input when using this as a form -->
                                
                                <!--a href="adminSuccess.jsp" class="btn btn-lg btn-success btn-block">Login</a-->
                                
                                <button class="btn btn-lg btn-success btn-block" type="submit" name="submit"> 
                                        <a href="login.jsp" style="color:white"></a>Login</button>
                               
                                
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- js placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/plugins/metisMenu/metisMenu.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="js/sb-admin-2.js"></script>
  

</body>

</html>

