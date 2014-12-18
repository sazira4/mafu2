<%-- 
    Document   : logout_admin
    Created on : Dec 4, 2014, 3:00:13 PM
    Author     : Dee Dee
--%>
<%
session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
