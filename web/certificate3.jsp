<%-- 
    Document   : certificate3
    Created on : Dec 19, 2014, 6:44:37 AM
    Author     : User
--%>
<%
String staffname = request.getParameter("name");
  String idCourse = request.getParameter("courseCode");
   String idStaff = request.getParameter("staffID");
   String icNo = request.getParameter("noIC");
    String startDate = request.getParameter("startDate");
   String finalDate = request.getParameter("finalDate");

   %>
<%@ page contentType="application/pdf" %>

