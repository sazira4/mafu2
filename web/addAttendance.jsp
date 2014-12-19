<%@include file = "mysqlconnect.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<html>
<head>
    <title>Inserting the values into the database</title> 
</head>
<body>
   <%
   
        String staffname = request.getParameter("name");
   int idCourse = Integer.parseInt(request.getParameter("idC"));
   int idStaff = Integer.parseInt(request.getParameter("idS"));
   String status = request.getParameter("attendanceStatus");
   
         if(request.getParameter("action")!=null){
        //int book_id= Integer.parseInt(request.getParameter("book_id"));
          
         PreparedStatement jobInfo = null;
        int updateQuery = 0;
   try{
         Statement st= null;
    
  
        Class.forName(driverName);
      
         String queryString = "INSERT INTO attendance(name,idC,idS,attendanceStatus) VALUES (?, ?, ?, ?)";
                      /* createStatement() is used for create statement object that is used for  sending sql statements to the specified database. */
				jobInfo = con.prepareStatement(queryString);
				jobInfo.setString(1, staffname);
				jobInfo.setInt(2, idCourse);
				jobInfo.setInt(3, idStaff);
				jobInfo.setString(4, status);
				
                                int i = jobInfo.executeUpdate();
                            if(i > 0)
					{
						%>
						<jsp:forward page="record.jsp"/>
						<% 
					}
				else
					{
						%>
						<jsp:forward page="recordDetails.jsp"/>
						<%
					}
        st.close();
        
        
          
   }
     catch(SQLException sqe)
    {
        request.setAttribute("error", sqe);
        out.println(sqe);
    }
   
       }  
    
    %>
</body>
</html>

