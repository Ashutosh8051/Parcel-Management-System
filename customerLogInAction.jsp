<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*"%>
<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	
		try
		{
			int i=0;
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/parcel","root","Ashutosh@8051");
				String sql ="select username,password from customer_register where username='"+username+"' and password='"+password+"'";
				PreparedStatement pst=con.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				while(rs.next())
				{
					i=1;
					session.setAttribute("username",username);
					response.sendRedirect("customerHome.jsp");
					
				}
				if(i==0)
				{
					response.sendRedirect("customerLogIn.jsp?msg=notexist");
				}
			}            
		catch(Exception e)
		{
			response.sendRedirect("customerLogIn.jsp?msg=invalid");
				
		}




%>