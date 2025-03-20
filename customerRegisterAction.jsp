
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer RegisterAction</title>
</head>
<body>
	<%
	try
	{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/Parcel","root","Ashutosh@8051");
			String name= request.getParameter("name");
			String email= request.getParameter("email");
			String country_code= request.getParameter("countrycode");
			String mob= request.getParameter("mobile");
			String country= request.getParameter("country");
			String state= request.getParameter("state");
			String city= request.getParameter("city");
			String address= request.getParameter("address");
			String zipcode= request.getParameter("zip");
			String postalcode= request.getParameter("postal");
			String username= request.getParameter("username");
			String password= request.getParameter("password");
			String preference= request.getParameter("preference");
			
			
		
			String sql = "insert into customer_register(name,email,country_code,mobile_number,country,state,city,address,zipcode,postalcode,username,password,preference) values ('"+name+"','"+email+"','"+country_code+"','"+mob+"','"+country+"','"+state+"','"+city+"','"+address+"','"+zipcode+"','"+postalcode+"','"+username+"','"+password+"','"+preference+"')";
			PreparedStatement pst= con.prepareStatement(sql);
			int i=pst.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("customerLogIn.jsp");
			}
			else
			{
				response.sendRedirect("customerRegister.jsp");
			}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
		
		
	}
	%>
</body>
</html>
